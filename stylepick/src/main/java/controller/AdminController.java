package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import javax.mail.PasswordAuthentication;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.sun.net.httpserver.HttpExchange;

import exception.LoginException;
import logic.Board;
import logic.Buy;
import logic.Line;
import logic.Mail;
import logic.ShopService;
import logic.Statistics;
import logic.User;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	//객체 주입
	@Autowired
	private ShopService service;
	
	//회원 목록
	@RequestMapping("list")
	public ModelAndView check_list(HttpSession session,String searchtype, String searchcontent, Integer pageNum) {
		ModelAndView mav = new ModelAndView();
		System.out.println(pageNum);
		if(searchtype == null || searchcontent ==null || searchtype.trim().equals("") || searchcontent.trim().equals("")) {
			searchtype = null;
			searchcontent = null;
		}
		/*
		 * pageNum: 현재 페이지 번호
		 * maxpage: 최대 페이지
		 * startpage: 보여지는 시작 페이지
		 * endpage: 보여지는 글 페이지번호
		 * listcount: 전체 등록 게시물 건수(db)
		 * boardlist: 화면에 보여지는 게시물 객체
		 * boardno: 화면내 재할당 된 게시글 번호(listcount부터 시작)
		 */
		
		int limit =30;// 한 페이지에 출력할 게시물 건수
		//listcount : 등록된 전체 게시물의 건수, 검색된 게시물의 건수
		int listcount = service.usercount(searchtype, searchcontent);
		//list : 화면에 출력할 내용, 목록 저장
		if (pageNum == null) {
			pageNum = 1;
		}

		List<User> list = service.list(searchtype, searchcontent,pageNum, limit);
		
		int maxpage=(int)((double)listcount/limit+0.95);
		int startpage=((int)(pageNum/10.0+0.9)-1)*10+1; //시작페이지 번호
		int endpage=startpage+9;//종료페이지번호
		if(endpage>maxpage) endpage=maxpage;
		//마지막페이지가 최대 글번호 보다 크지 않도록
		
		int boardno=listcount-(pageNum-1)*limit;
		
		
		mav.addObject("list",list);
		//mav.addObject("boardlist",boardlist);
		mav.addObject("pageNum",pageNum);
		mav.addObject("maxpage",maxpage);
		mav.addObject("startpage",startpage);
		mav.addObject("endpage",endpage);
		mav.addObject("listcount",listcount);
		mav.addObject("boardno",boardno);
		
		return mav;
	}//check_list
	
	//대시보드
	@RequestMapping("dashboard")
	public ModelAndView check_dashboard(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int newusers = service.newusers();
		mav.addObject("newusers",newusers);
		long numofusers = service.numofusers();
		mav.addObject("numofusers",numofusers);
		long salesofthismonth = service.salesofthismonth();
		mav.addObject("salesofthismonth",salesofthismonth);
		long totalrevenue = service.salesdata();
		mav.addObject("totalrevenue",totalrevenue);
		long numofreviews = service.numofreviews();
		mav.addObject("numofreviews",numofreviews);
		return mav;
	}//check_dashboard
		
	//위젯
	@RequestMapping("widgets")
	public ModelAndView check_widgets(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Buy> saleslist=service.getSales();
		mav.addObject("saleslist",saleslist);
		List<User> userslist=service.getUsers();
		mav.addObject("userslist",userslist);
		//System.out.println(userslist.toString());
		List<Line> evaluation=service.getEvaluation();
		mav.addObject("evaluation",evaluation);
		return mav;
	}//check_widgets
	
	//차트
	@RequestMapping("charts")
	public ModelAndView check_charts(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}//check_widgets
		
	//스토어 관리
	@RequestMapping("storelist")
	public ModelAndView check_storelist(HttpSession session, String searchtype, String searchcontent,Integer pageNum) {
		ModelAndView mav = new ModelAndView();
		if(searchtype == null || searchcontent ==null || searchtype.trim().equals("") || searchcontent.trim().equals("")) {
			searchtype = null;
			searchcontent = null;
		}
		int limit =30;
		int listcount = service.storecount(searchtype, searchcontent);
		if (pageNum == null) {
			pageNum = 1;
		}
		List<User> list = service.storelist(searchtype, searchcontent,pageNum, limit);
		int maxpage=(int)((double)listcount/limit+0.95);
		int startpage=((int)(pageNum/10.0+0.9)-1)*10+1; //시작페이지 번호
		int endpage=startpage+9;//종료페이지번호
		if(endpage>maxpage) endpage=maxpage;
		//마지막페이지가 최대 글번호 보다 크지 않도록
		
		int boardno=listcount-(pageNum-1)*limit;
		
		
		mav.addObject("list",list);
		//mav.addObject("boardlist",boardlist);
		mav.addObject("pageNum",pageNum);
		mav.addObject("maxpage",maxpage);
		mav.addObject("startpage",startpage);
		mav.addObject("endpage",endpage);
		mav.addObject("listcount",listcount);
		mav.addObject("boardno",boardno);
		return mav;
	}//check_storelist
	
	//매출 관리
		@RequestMapping("salesmgr")
		public ModelAndView check_salesmgr(HttpSession session, String searchtype, String searchcontent,Integer pageNum) {
			ModelAndView mav = new ModelAndView();
			if(searchtype == null || searchcontent ==null || searchtype.trim().equals("") || searchcontent.trim().equals("")) {
				searchtype = null;
				searchcontent = null;
			}
			int limit =50;
			int listcount = service.salecount(searchtype, searchcontent);
			if (pageNum == null) {
				pageNum = 1;
			}
			List<Buy> list = service.saleslist(searchtype, searchcontent,pageNum, limit);
			System.out.println(list.toString());
			
			int maxpage=(int)((double)listcount/limit+0.95);
			int startpage=((int)(pageNum/10.0+0.9)-1)*10+1; //시작페이지 번호
			int endpage=startpage+9;//종료페이지번호
			if(endpage>maxpage) endpage=maxpage;
			//마지막페이지가 최대 글번호 보다 크지 않도록
			
			int boardno=listcount-(pageNum-1)*limit;
			
			
			mav.addObject("list",list);
			//mav.addObject("boardlist",boardlist);
			mav.addObject("pageNum",pageNum);
			mav.addObject("maxpage",maxpage);
			mav.addObject("startpage",startpage);
			mav.addObject("endpage",endpage);
			mav.addObject("listcount",listcount);
			mav.addObject("boardno",boardno);
			return mav;
		}//check_salesmgr
			
	
	//메일 보내기
    @RequestMapping("mail")
    public ModelAndView check_mail(Mail mail, HttpSession session) {
       ModelAndView mav = new ModelAndView("/alert");
       check_mailSend(mail);
       mav.addObject("msg","메일이 전송되었습니다.");
       mav.addObject("url","storelist.shop");
       return mav;
    }//mail

	
	//메일 인증
    private final class MyAuthenticator extends Authenticator {
          private String id;
          private String pw;
          public MyAuthenticator(String id,String pw) {
             this.id = id;
             this.pw = pw;
          }
          @Override
          protected PasswordAuthentication getPasswordAuthentication() {
             return new PasswordAuthentication(id,pw);
          }
       }//MyAuthenticator

	
    //메일 전송
    private void check_mailSend(Mail mail) {
       //네이버 메일 전송을 위한 인증 객체
       MyAuthenticator auth = new MyAuthenticator(mail.getNaverid(),mail.getNaverpw());
       Properties prop = new Properties();
       try {
          FileInputStream fis = new FileInputStream("C:/Users/SEYEON/git/stylepick/src/main/resources/mail.properties");
          prop.load(fis); //mail.properties의 내용을 Properties(Map)객체로 로드
          prop.put("mail.smtp.user", mail.getNaverid());
       } catch (IOException e) {
          // TODO: handle exception
          e.printStackTrace();
       }

       //메일 전송을 위한 객체
       Session session = Session.getInstance(prop,auth);
       
       //메일의 내용을 저장하는 객체
       MimeMessage mimeMsg = new MimeMessage(session);

		try {
			//보내는 사람
			mimeMsg.setFrom(new InternetAddress(mail.getNaverid()+"@naver.com"));
			List<InternetAddress> addrs = new ArrayList<InternetAddress>();
			//받는 사람
			String[] emails = mail.getRecipient().split(",");
			for(String email : emails) {
				try {
					
					/*
					 * new String(email.getBytes("utf-8"),"8859_1")
					 * email.getBytes("utf-8") : email 문자열을 byte[] 형태로 변경
					 * (utf-8 문자로 인식해서 배열의 형태로 저장)
					 * 8859_1 : byte[]배열을 8859_1로 변경해서 다시 문자열로 생성
					 * : 수신 메일 함의 한글을 깨지지 않게 하는 역할
					 */
					addrs.add(new InternetAddress(new String(email.getBytes("utf-8"),"8859_1")));
				} catch (UnsupportedEncodingException ue) {
					// TODO: handle exception
					ue.printStackTrace();
				}//catch
			}//for
			InternetAddress[] arr = new InternetAddress[emails.length];
			for(int i=0;i<addrs.size();i++) {
				arr[i] = addrs.get(i);
			}//for
			
			//보낸 날짜
			mimeMsg.setSentDate(new Date());
			//받는 사람
			mimeMsg.setRecipients(Message.RecipientType.TO, arr);
			//제목
			mimeMsg.setSubject(mail.getTitle());
			MimeMultipart multipart = new MimeMultipart();
			MimeBodyPart message = new MimeBodyPart();
			//내용
			message.setContent(mail.getContents(),mail.getMtype());
			multipart.addBodyPart(message);
			//첨부파일
			for(MultipartFile mf : mail.getFile1()) {
				if((mf != null) && (!mf.isEmpty())) {
					multipart.addBodyPart(bodyPart(mf));
				}//if
			}//for
			mimeMsg.setContent(multipart);
			Transport.send(mimeMsg);
		} catch (MessagingException me) {
			// TODO: handle exception
			me.printStackTrace();
		}
	}//mailSend
	
	//메일 본문 0710-2
	private BodyPart bodyPart(MultipartFile mf) {
		MimeBodyPart body = new MimeBodyPart();
		//업로드 파일의 이름
		String orgFile = mf.getOriginalFilename();
		//업로드 위치
		String path = "d:/mailupload/";
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		//업로드된 내용을 저장하는 파일
		File f1 = new File(path + orgFile);
		try {
			//업로드 완성
			mf.transferTo(f1);
			//메일에 첨부
			body.attachFile(f1);
			//첨부파일이름 설정
			body.setFileName(new String(orgFile.getBytes("UTF-8"),"8859_1"));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return body;
	}//bodyPart
	
	// 그래프 0716-1
	@RequestMapping("graph*")
	public ModelAndView graph(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = service.graph1();
		mav.addObject("map",map);
		return mav;
	}//graph
	
	@RequestMapping("dataexpo2")
	public ModelAndView check_dataexpo2(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("dataexpo2 호출");
		return mav;
	}//check_widgets
	
	@RequestMapping("salesanalysis")
	public ModelAndView salesanalysis(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("salesanalysis 호출");
		return mav;
	}//check_widgets

	//메일 폼 화면 열기 
    @RequestMapping("mailForm")
    public ModelAndView check_mailform (String[] idchks, HttpSession session) {
//       view는 admin/mail.jsp로 설정
       ModelAndView mav = new ModelAndView("admin/mail");
       if(idchks == null || idchks.length==0) {
          throw new LoginException("[AdminController] 메일을 보낼 대상자를 선택하세요","list.shop");
       }
       //list : 클릭한 User objects
       List<User> list = service.userList(idchks);
       mav.addObject("list",list);
       return mav;
    }//mailform


    
}
