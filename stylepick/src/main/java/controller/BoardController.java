package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import logic.Board;
import logic.Mail;
import logic.Reply;
import logic.ShopService;
import logic.User;

@Controller
@RequestMapping("board")
public class BoardController {

	@Autowired
	private ShopService service;
	
	@GetMapping("*")
	public ModelAndView getBoard(Integer no, String t, HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView();
		Board board = null;
		
		if (no == null) {
			board = new Board();
			String title = "";
			int seq = 0;
			if (t != null) {
				switch (t) {
				case "n": title = "공지사항"; seq = 1; break;
				case "q": title = "QnA"; seq = 2; break;
				case "f": title = "FAQ"; seq = 3; break;
				}
				mav.addObject("title", title);
				mav.addObject("seq", seq);
				List<String> list = service.getCategoryList();
				mav.addObject("category", list);
			}
		} else {
			boolean readcntable = false;
			if (request.getRequestURI().contains("detail.shop")) {
				readcntable = true;
			}
			board = service.getBoard(no, readcntable);
			
			Map<String, String> map = new HashMap<String, String>();
			switch (board.getSeq()) {
			case 1: map.put("title", "공지사항"); map.put("uri", "notice.shop"); break;
			case 2: map.put("title", "QnA"); map.put("uri", "qna.shop"); break;
			case 3: map.put("title", "FAQ"); map.put("uri", "faq.shop"); break;
			}

			List<Reply> reply = service.getReply(no);
			
			mav.addObject("type", map);
			mav.addObject("reply", reply);
		}
		
		mav.addObject("board", board);
		
		return mav;
	}

	@PostMapping("add")
	public ModelAndView write(Board board, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		service.boardWrite(board, request);
		
		String type = "support";
		switch (board.getSeq()) {
		case 1: type = "notice"; break;
		case 2: type = "qna"; break;
		case 3: type = "faq"; break;
		default:
		}
		mav.setViewName("redirect:" + type + ".shop");
	
		return mav;
	}
	
	@PostMapping("modify")
	public ModelAndView checkmodify(Board board, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		service.boardUpdate(board, request);
		mav.setViewName("redirect:detail.shop?no=" + board.getNo());
		
		return mav;
	}

	@RequestMapping("delete")
	public ModelAndView checkdelete(int no) {
		ModelAndView mav = new ModelAndView();

		Board board = service.getBoard(no, false);
		service.boardDelete(board.getNo());
		System.out.println(board);
		
		String type = "support";
		switch (board.getSeq()) {
		case 1: type = "notice"; break;
		case 2: type = "qna"; break;
		case 3: type = "faq"; break;
		default:
		}
		mav.setViewName("redirect:" + type + ".shop");

		return mav;
	}
	
	@PostMapping("regreply")
	public ModelAndView regreply(Reply reply, int bno, int seq, String author, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		User loginUser = (User)session.getAttribute("loginUser");
		if (loginUser == null) {
			mav.setViewName("redirect:/user/login.shop");
			return mav;
		}
		if (seq == 2) {
			if (loginUser.getUserid().equals("admin")) {
				service.boardStatComplete(bno);
			}
		}
		reply.setAuthor(loginUser.getUserid());
		reply.setBno(bno);
		
		service.regReply(reply);
		mav.setViewName("redirect:detail.shop?no=" + bno);
	
		return mav;
	}
	
	@RequestMapping("email")
	public ModelAndView checkmail(Mail mail, int no, HttpSession session) {
		ModelAndView mav = new ModelAndView("alert");
		mailSend(mail);
		
		Reply reply = new Reply();
		reply.setAuthor("admin");
		reply.setBno(no);
		reply.setContent("<메일로 답변이 전송되었습니다>" + mail.getContents());
		service.regReply(reply);
		service.boardStatComplete(no);
		
		mav.addObject("msg", "메일 전송이 완료되었습니다.");
		mav.addObject("url", "qna.shop");
		
		return mav;
	}
	
	private void mailSend(Mail mail) {
		MyAuthenticator auth = new MyAuthenticator(mail.getNaverid(), mail.getNaverpw());
		Properties prop = new Properties();
		try {
			FileInputStream fis = new FileInputStream("D:\\java_source\\stylepick\\src\\main\\resources\\mail.properties");
			
			prop.load(fis); // mail.properties의 내용을 Properties(Map)객체로 로드
			prop.put("mail.smtp.user", mail.getNaverid());
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		Session session = Session.getInstance(prop, auth);
		MimeMessage mimeMsg = new MimeMessage(session);
		
		try {
			// 보내는 사람
			mimeMsg.setFrom(new InternetAddress(mail.getNaverid() + "@naver.com"));
			InternetAddress addr = null;
			String email = mail.getRecipient();
			
			try {
				/*
				 * new String(email.getBytes("UTF-8"), "8859_1")
				 * email.getBytes("UTF-8") : email 문자열을 byte[] 형태로 변경
				 * 8859_1 : bytes[] 배열을 8859_1로 변경하여 문자열 생성
				 * => 수신된 메일에서 한글이름이 유지되도록 설정
				 */
				addr = new InternetAddress(new String(email.getBytes("UTF-8"),"8859_1"));
			} catch(UnsupportedEncodingException ue) {
				ue.printStackTrace();
			}
			
			mimeMsg.setSentDate(new Date());
			mimeMsg.setRecipient(Message.RecipientType.TO, addr);
			mimeMsg.setSubject(mail.getTitle());
			
			MimeMultipart multipart = new MimeMultipart();
			MimeBodyPart message = new MimeBodyPart();
			
			message.setContent(mail.getContents(), mail.getMtype());
			multipart.addBodyPart(message);
			for(MultipartFile mf : mail.getFile1()) {
				if((mf != null) && (!mf.isEmpty())) {
					multipart.addBodyPart(bodyPart(mf));
				}
			}
			
			mimeMsg.setContent(multipart);
			Transport.send(mimeMsg);
		} catch(MessagingException me) {
			me.printStackTrace();
		}
	}
	
	private final class MyAuthenticator extends Authenticator {
		private String id;
		private String pw;
		
		public MyAuthenticator(String id, String pw) {
			this.id = id;
			this.pw = pw;
		}
		
		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(id, pw);
		}
	}
	
	private BodyPart bodyPart(MultipartFile mf) {
		MimeBodyPart body = new MimeBodyPart();
		String orgFile = mf.getOriginalFilename();
		String path = "d:/lgh/projects/mailupload/";
		
		File f = new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		File f1 = new File(path + orgFile);
		try { 
			mf.transferTo(f1);
			body.attachFile(f1);
			body.setFileName(new String(orgFile.getBytes("UTF-8"), "8859_1"));
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return body;
	}
}