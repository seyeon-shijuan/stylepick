package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import logic.Board;
import logic.Comment;
import logic.GoogleChartService;
import logic.Item;
import logic.ShopService;
import logic.Sns;
import logic.User;


//view를통하지 않고 바로 클라이언트로 전달(just data) : @Controller + @ResponseBody
@RestController
@RequestMapping("ajax")
public class AjaxController {
	@Autowired
	ShopService service;
	
	@RequestMapping(value="graph1", produces="text/plain; charset=UTF8")
	public String graph1() {
		//알고리즘을 통해서 json 형태로 재편집(this script) -> parser로해서 ajax로 보내줌(next script)
		//map : ("이지은", 10),("장만월",8) ...
		Map<String, Object> map = service.graph1();
		/*
		 * json : [{"name":"이지은","cnt":"10"}, 
		 * {"name":"장만월","cnt":"8"}, 
		 */
		StringBuilder json = new StringBuilder("[");
		int i = 0;
		for(Map.Entry<String, Object> me : map.entrySet()) {
	         json.append("{\"name\":\""+me.getKey()+"\","
	               + "\"cnt\":\""+me.getValue()+"\"}");
	         i++;
	         if(i<map.size())
	            json.append(",");
	      }
	      json.append("]");
	      //System.out.println(json);
	      return json.toString(); //클라이언트에 전달될 데이터
	}
	@RequestMapping(value="graph2", produces="text/plain; charset=UTF8")
	public String graph2() {
		Map<String, Object> map = service.graph2();
		StringBuilder json = new StringBuilder("[");
		int i = 0;
		for(Map.Entry<String, Object> me : map.entrySet()) {
	         json.append("{\"regdate\":\""+me.getKey()+"\","
	               + "\"cnt\":\""+me.getValue()+"\"}");
	         i++;
	         if(i<map.size())
	            json.append(",");
	      }
	      json.append("]");
	      //System.out.println(json);
	      return json.toString();
	}
	
	@RequestMapping(value="exchange1", produces="text/plain; charset=UTF8")
	public String exchange1() {
		String url = "https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
		Document doc = null;
		List<String> list = new ArrayList<String>();
		List<String> list2 = new ArrayList<String>();
		try {
			doc = Jsoup.connect(url).get();
			Elements e1 = doc.select(".tc"); //국가코드, 환율값 태그 선택
			Elements e2 = doc.select(".tl2.bdl"); //국가이름
			for(int i=0; i<e1.size(); i++) {
				if(e1.get(i).html().equals("USD")) {
					list.add(e1.get(i).html());//USD 정보 저장
					for(int j=1; j<=6; j++) {
						list.add(e1.get(i+j).html());
					}//2nd for
					break;
				}//if
			}//for
			for (Element ele : e2) {
				if(ele.html().contains("미국")) { //미국이 들어가있는 단어
					list2.add(ele.html());
				}//if
			}//for
		} catch (IOException e) {
			e.printStackTrace();
		}
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		StringBuilder html = new StringBuilder();
		html.append("<table class='w3-table-all'>");
		html.append("<caption>수출입은행:" + today + "</caption>");
		html.append("<tr><td colspan='3' class='w3-center'>" + list2.get(0)+ ":" + list.get(0)+"</td></tr>");
		html.append("<tr><th>기준율</th><th>받을때</th><th>파실때</th></tr>");
		html.append("<tr><td>"+list.get(3)+"</td>");
		html.append("<td>"+list.get(1)+"</td>");
		html.append("<td>"+list.get(2)+"</td></tr></table>");
	      return html.toString();
	}
	@RequestMapping(value="exchange2", produces="text/plain; charset=UTF8")
	public String exchange2() {
		Map<String,List<String>> map = new HashMap<>();
		StringBuilder html = null;
		try {
			String kebhana =Jsoup.connect("http://fx.kebhana.com/FER1101M.web").get().text();
			String strJson = kebhana.substring(kebhana.indexOf("{"));
			JSONParser jsonParser = new JSONParser();
			JSONObject json = (JSONObject)jsonParser.parse(strJson.trim()); //array임
			
			JSONArray array = (JSONArray)json.get("리스트"); //리스트의 value값이 array에 담김
			for(int i = 0; i< array.size(); i++) {
				JSONObject obj = (JSONObject)array.get(i); //!!
				if(obj.get("통화명").toString().contains("미국")||
					obj.get("통화명").toString().contains("일본")||
					obj.get("통화명").toString().contains("유로")||
					obj.get("통화명").toString().contains("중국")	) {
					String str = obj.get("통화명").toString();
					String[] sarr = str.split(" ");
					String key = sarr[0];
					String code = sarr[1];
					List<String> list = new ArrayList<String>();
					list.add(code);
					list.add(obj.get("매매기준율").toString());
					list.add(obj.get("현찰사실때").toString());
					list.add(obj.get("현찰파실때").toString());
					map.put(key, list); //(미국, {code, 매매기준율값, 현찰사실때값, 현찰파실때 값})
				}//if
					
			}//for
			html = new StringBuilder();
			html.append("<table class='w3-table-all'>");
			html.append("<caption>KEB하나은행("+json.get("날짜").toString()+")</caption>");
			html.append("<tr><th rowspan='2' style='vertical-align: middle;'>코드</th>");
			html.append("<th rowspan='2' style='vertical-align:middle;'>기준율</th>");
			html.append("<th colspan='2' class='w3-center'>현찰</th></tr>");
			html.append("<tr><th>파실때</th><th>사실때</th></tr>");
			for(Map.Entry<String, List<String>> m : map.entrySet()) {
				html.append("<tr><td class='w3-center'>"+m.getKey()+"("+m.getValue().get(0) + ")</td>");
				html.append("<td>"+m.getValue().get(1)+"</td><td>"+m.getValue().get(2)+"</td><td>"+m.getValue().get(3)+"</td></tr>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} //try and catch
		return html.toString();
	}
	
	/**
	 * Sns
	 */
	
	//[sns] 게시물 불러오기
	@RequestMapping(value="main", produces="text/plain; charset=UTF8")
	public String main(String ksb,String type,int listAmount,int status) {
		if(ksb == null) {
			ksb = "";
		}
		StringBuilder html = new StringBuilder();
		int limit = 16;
		List<Sns> itemss = service.getSnsList(ksb,type,listAmount,limit);
		if(itemss.isEmpty()) {
			return null;
		} else {
			//html.append("<table style=\"margin:2% 6%;\">");
			int i = 1;
			for(Sns s : itemss) {
				if(i%4==1) {
					html.append("<tr>");
				}
				s.setLikenum(service.getlikenum(s.getSns_no()));
				s.setCommentnum(service.getcommentnum(s.getSns_no()));
				User user = service.getUser(s.getUserid());
				String regdate = new SimpleDateFormat("yy.MM.dd").format(s.getRegdate());
				html.append("<td><div class=\"style-card\" onClick=\"location.href ='../sns/detail.shop?sns_no="+s.getSns_no()+"'\">");
				html.append("<div class=\"style-img\"><img id=\"thumb\" src=\"file/"+s.getImg1url()+"\" width=\"228px\" height=\"270px\"></div>");
				html.append("<div class=\"style-content\">");
				html.append("<div class=\"style-profile\"><img src=");
				if(user.getImgurl()!=null && !user.getImgurl().equals(""))
					html.append("\"../user/file/"+user.getImgurl()+"\"");
				else
					html.append("../assets/img/user.svg");
				html.append(" width=\"30px\" height=\"30px\" style=\"border-radius:70%\" ></div>");
				html.append("<div class=\"style-info\">");
				html.append("<div class=\"style-info-first\">");
				html.append("<a>"+user.getNickname()+"</a>");
				html.append("<a style=\"float: right;\">"+regdate+"</a></div>");
				html.append("<div class=\"style-info-second\" >");
				html.append("<div class=\"txt_box\">"+s.getDescription()+"</div>...&nbsp;&nbsp;<a href=\"#\" style=\"color: #6d6d6d; font-size: 15px;\">더보기</a></div>");
				html.append("<div class=\"style-info-third\">");
				html.append("<img src=\"../assets/img/test7.PNG\" width=\"15px\" height=\"15px\">&nbsp;"+s.getLikenum());
				html.append("&nbsp;&nbsp;<img src=\"../assets/img/test8.PNG\" width=\"15px\" height=\"15px\">&nbsp;"+s.getCommentnum());
				html.append("</div></div></div></div></td>");
				if(i%4==0) {
					html.append("</tr>");
				}
				i++;
			}
			//html.append("</table>");
			return html.toString();
		}
	}
	
	
	//[sns] 내가 쓴 게시물 불러오기
		@RequestMapping(value="mypage", produces="text/plain; charset=UTF8")
		public String mypage(String userid,int listAmount,int status) {
			StringBuilder html = new StringBuilder();
			int limit = 8;
			//System.out.println(listAmount+","+limit);
			List<Sns> itemss = service.mysns(userid,listAmount,limit);
			if(itemss.isEmpty()) {
				return null;
			} else {
				//System.out.println(itemss);
				//html.append("<table style=\"margin:2% 6%;\">");
				int i = 1;
				for(Sns s : itemss) {
					if(i%4==1) {
						html.append("<tr>");
					}
					s.setLikenum(service.getlikenum(s.getSns_no()));
					s.setCommentnum(service.getcommentnum(s.getSns_no()));
					User user = service.getUser(s.getUserid());
					String regdate = new SimpleDateFormat("yy.MM.dd").format(s.getRegdate());
					html.append("<td><div class=\"style-card\" onClick=\"location.href ='../sns/detail.shop?sns_no="+s.getSns_no()+"'\">\r\n" + 
							"					<c:if test=\"${!empty s.img1url}\">\r\n" + 
							"						<div class=\"style-img\"><img id=\"thumb\" src=\"file/"+s.getImg1url()+"\" width=\"228px\" height=\"270px\"></div>\r\n" + 
							"					</c:if>\r\n" + 
							"					<div class=\"style-content\">\r\n"); 
							
					html.append("<div class=\"style-profile\"><img src=");
					if(user.getImgurl()!=null && !user.getImgurl().equals(""))
						html.append("\"../user/file/"+user.getImgurl()+"\"");
					else
						html.append("../assets/img/user.svg");
					html.append(" width=\"30px\" height=\"30px\" style=\"border-radius:70%\" ></div>");	
					
					html.append("						<div class=\"style-info\">\r\n" + 
							"							<div class=\"style-info-first\">\r\n" + 
							"								<a>"+user.getNickname()+"</a>\r\n" + 
							"								<a style=\"float: right;\">"+regdate+"</a>		\r\n" + 
							"							</div>\r\n" + 
							"							<div class=\"style-info-second\" >\r\n" + 
							"								<div class=\"txt_box\">"+s.getDescription()+"</div>\r\n" + 
							"							...&nbsp;&nbsp;<a href=\"#\">더보기</a>\r\n" + 
							"							</div>\r\n" + 
							"							<div class=\"style-info-third\">\r\n" + 
							"								<img src=\"../assets/img/test7.PNG\" width=\"15px\" height=\"15px\">&nbsp;&nbsp;"+s.getLikenum()+"&nbsp;&nbsp;&nbsp;&nbsp;\r\n" + 
							"								<img src=\"../assets/img/test8.PNG\" width=\"15px\" height=\"15px\">&nbsp;&nbsp;"+s.getCommentnum()+"\r\n" + 
							"							</div>\r\n" + 
							"						</div>\r\n" + 
							"					</div>\r\n" + 
							"				</div>\r\n" + 
							"				</td>");
					if(i%4==0) {
						html.append("</tr>");
					}
					i++;
				}
				//html.append("</table>");
				//System.out.println(html);
				return html.toString();
			}
		}
	
	//[sns] 댓글 목록
	@RequestMapping(value="commentlist",produces="text/plain; charset=UTF8")
	public String commentlist(int sns_no) {
		StringBuilder html = new StringBuilder();
		List<Comment> list = service.getCommentList(sns_no);
		for(Comment c : list) {
			User user = service.getUser(c.getUserid());
			html.append("<tr style=\"border-bottom:1px solid #babbbb;\"><td style=\"width:10%; padding:10px 0;\"><img src=");
			if(user.getImgurl()!=null && !user.getImgurl().equals(""))
				html.append("\"../user/file/"+user.getImgurl()+"\"");
			else
				html.append("../assets/img/user.svg");
			html.append(" width=\"30px\" height=\"30px\" style=\"border-radius:70%\" ></td>");
			html.append("<td style=\"width:20%;\">"+user.getUserid()+"</td>");
			html.append("<td>"+c.getContent()+"</td>");
			String regdate = new SimpleDateFormat("yy.MM.dd").format(c.getRegdate());
			html.append("<td style=\"width:20%; font-size:13px;\">"+regdate+"</td>");
		}
		return html.toString();
	}
	
	//[sns] 좋아요
	@RequestMapping(value="like",produces="text/plain; charset=UTF8")
	public String loginChecklikeSns(int sns_no,String userid) {
		StringBuilder html = new StringBuilder();
		if(userid.trim().equals("")) {
			html.append("로그인 후 이용하세요.");
		} else {
			service.addlike(sns_no,userid);
			int likenum = service.getlikenum(sns_no);
			html.append("<button style=\"border:none;background:#fff; cursor:pointer;\"><img src=\"../assets/img/heart2.PNG\" width=\"23px\" height=\"21px\"></button>&nbsp;|&nbsp;&nbsp;"+likenum);
		}
		return html.toString();
	}
	
	//[sns] ootd 삭제
	@RequestMapping(value="delete",produces="text/plain; charset=UTF8")
	public void deleteSns(int sns_no) {
		service.deleteSns(sns_no);
		return;
	}
	
	//[admin] 구글차트 0814
	@Autowired
	GoogleChartService googleChart;
	
	//[admin] dashboard index 2-1 주간 매출 0814
	@RequestMapping("weeklyrevenue")
    public JSONObject weeklyrevenue() {
		JSONObject json = googleChart.getChartData();
		//System.out.println(json);
        return json;
    }
	//[admin] dashboard index 2-2 최근 4주간 매출 0815
	@RequestMapping("monthlyrevenue")
	 public JSONObject monthlyrevenue() {
		JSONObject json = googleChart.getChartData2();
		//System.out.println(json);
	   return json;
	}
	//[admin] widgets index 2-1 이번 달 최다 구매 회원 랭킹 0816
	@RequestMapping("monthlyheavyusers" )
		public JSONObject monthlyheavyusers() {
		//System.out.println("ajax 연결");
		JSONObject json = googleChart.getChartData3();
		//System.out.println(json);
		return json;
	}
	//[admin] widgets index 2-2 올해 최다 구매 회원 랭킹 0817
	@RequestMapping("yearlyheavyusers" )
		public JSONObject yearlyheavyusers() {
		//System.out.println("ajax 연결");
		JSONObject json = googleChart.getChartData4();
		//System.out.println(json);
		return json;
	}
	//[admin] widgets index 3-1 우수 입점 스토어 차트 0817
	@RequestMapping("topthreestores" )
		public JSONObject topthreestores() {
		//System.out.println("ajax 연결");
		JSONObject json = googleChart.getChartData5();
		//System.out.println(json);
		return json;
		}
	
	//[admin] charts index 1 스타일픽 회원 수 0820
			@RequestMapping("totnumofusers")
				public JSONObject totnumofusers() {
				JSONObject json = googleChart.getChartData6();
				return json;
			}
	//[admin] charts index 3 Yearly : 연 매출 현황 0818
	@RequestMapping("yearlyrevenue")
		public JSONObject yearlyrevenue() {
		JSONObject json = googleChart.getChartData7();
		//System.out.println(json);
		return json;
	}	
	//[admin] charts index 4-1 지역별 매출 평균 boxplot
	@RequestMapping("boxplot")
	public JSONObject boxplot() {
	JSONObject json = googleChart.getChartData8();
	return json;
}
	//[admin] charts index 4-2 지역별 매출 평균 >later drawChart5 getChartData9
	
	//[admin] charts index 5 구매건 기준 매출 산점도 0819
	@RequestMapping("scatterplot")
		public JSONObject scatterplot() {
		JSONObject json = googleChart.getChartData10();
		return json;
	}
	//[admin] charts index 6-1 카테고리별 판매 현황(월) 0820
	@RequestMapping("salesbycategories")
		public JSONObject salesbycategories() {
		JSONObject json = googleChart.getChartData11();
		return json;
	}
	//[admin] charts index 6-2 카테고리별 판매 현황(월) getChartData12(); later
	//[admin] charts index 7-1 스토어 매출 점유율 getChartData13(); later
	@RequestMapping("storeshare")
		public JSONObject storeshare() {
		JSONObject json = googleChart.getChartData13();
		return json;
	}
	//[admin] charts index 7-2 상위 10개 스토어 (월 매출 기준)
	@RequestMapping("toptenstores")
		public JSONObject toptenstores() {
		JSONObject json = googleChart.getChartData14();
		return json;
		}
	
	
	
	/**
	 * Board
	 */
	@RequestMapping(value="nd", produces="text/plain; charset=UTF8")
	public String noticeData() { 
		List<Board> list = service.getBoardList(1);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = null;
		try {
			json = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return json;
	}
	
	@RequestMapping(value="qd", produces="text/plain; charset=UTF8")
	public String qnaData(HttpServletRequest request, HttpSession session) { 
		String stat = request.getParameter("s");
		String author = request.getParameter("author");
		User loginUser = (User)session.getAttribute("loginUser");
		String admin = null;
		
		if (stat.equals("")) {
			stat = null;
		}
		if (author.equals("")) {
			author = null;
		}
		if (loginUser != null && loginUser.getUserid().equals("admin")) {
			admin = "admin";
		}
		
		List<Board> list = service.getQnaList(stat, author, admin);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = null;
		try {
			json = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return json;
	}
	
	@RequestMapping(value="fd", produces="text/plain; charset=UTF8")
	public String faqData(HttpServletRequest request) {
		String category = request.getParameter("c");
		if (category == "") {
			category = null;
		}
		List<Board> list = service.getFaqList(category);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = null;
		try {
			json = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return json;
	}
	
	//[item] 상품 목록 불러오기
	@RequestMapping(value="list", produces="text/plain; charset=UTF8")
	public String list(Integer category,int listAmount,int status,String keyword) {
		StringBuilder html = new StringBuilder();
		//System.out.println("keyword:"+keyword);
		if(keyword == null || keyword.trim().equals("")) {
			keyword =null;
		}
		//System.out.println("category:"+category);
		if(category == null || category.toString().trim().equals("")) {
			category = null;
		}
		int limit = 12;
		List<Item> itemss = service.getItemList(listAmount,limit,keyword,category);
		//System.out.println(itemss);
		if(itemss.isEmpty()) {
			return null;
		} else {
			//System.out.println(itemss);
			//html.append("<table style=\"margin:2% 6%;\">");
			int i = 1;
			for(Item it : itemss) {
				if(i%4==1) {
					html.append("<div class=\"row\">");
				}
				User seller = service.getUser(it.getUserid());
				it.setName(seller.getCom_name());
				html.append("<div class=\"col-xl-4 col-lg-4 col-md-6\"  style=\"max-width: 25%;\">");
				html.append("<div class=\"single_product_item\">");
				html.append("<div class=\"item_detail\" onClick=\"location.href='detail.shop?item_no="+it.getItem_no()+"'\">");
				html.append("<div><img src=\"img/"+it.getPictureUrl()+"\" width=\"226px\" height=\"270px\"></div>");
				html.append("									<div>\r\n" + 
						"										<ul>\r\n" + 
						"											<li>"+it.getName()+"</li>\r\n" + 
						"											<li>"+it.getSubject()+"</li>\r\n" + 
						"											<li>"+it.getPrice()+"원</li>\r\n" + 
						"										</ul>\r\n" + 
						"									</div>");
				html.append("								</div>\r\n" + 
						"                       		</div>\r\n" + 
						"                    	</div>");
				if(i%4==0) {
					html.append("</div>");
				}
				i++;
			}
			
			//System.out.println(html);
			return html.toString();
		}
	}
	

	
	@RequestMapping(value="reviewSns", produces="text/plain; charset=UTF8")
	public String getreviewSns(int item_no,int pageNum) {
		StringBuilder html = new StringBuilder();
		int limit = 4;
		List<Sns> reviewsns = service.getReviewSns(item_no, pageNum, limit);
		for(Sns s : reviewsns) {
			User writer = service.getUser(s.getUserid());
			String ds = s.getDescription().substring(0,s.getDescription().length());
			
			html.append("<div class=\"reviewSns\" style=\"margin: 30px 0; width: 235px;float: left;padding: 0 5px;\">" + 
					"	 	<img src=\"../sns/file/"+s.getImg1url()+"\" width=\"225px\" height=\"250px\" onclick=\"location.href='../sns/detail.shop?sns_no="+s.getSns_no()+"'\">\r\n" +
					"		<div><img src=\"../user/file/"+writer.getImgurl()+"\" style=\"float:left;margin:10px 5px 0 0\" width=\"35px\" height=\"35px\">"+
					"		"+"<p style=\"margin-bottom:0;float: left;margin-right: 130px;line-height: 16px;font-size: 14px;margin-top: 10px;font-weight: 600;\">"+writer.getNickname()+"</p>"+ds+"</div>"+
					"	 </div>");
		}
		return html.toString();
	}
	
	@RequestMapping(value="searchSns", produces="text/plain; charset=UTF8")
	public String searchSns(int listAmount,int status,String keyword) {
		StringBuilder html = new StringBuilder();
		int limit = 16;
		List<Sns> itemss = service.getSnsSearch(listAmount,limit,keyword);
		if(itemss.isEmpty()) {
			return null;
		} else {
			//html.append("<table style=\"margin:2% 6%;\">");
			int i = 1;
			for(Sns s : itemss) {
				if(i%4==1) {
					html.append("<tr>");
				}
				s.setLikenum(service.getlikenum(s.getSns_no()));
				s.setCommentnum(service.getcommentnum(s.getSns_no()));
				User user = service.getUser(s.getUserid());
				String regdate = new SimpleDateFormat("yy.MM.dd").format(s.getRegdate());
				html.append("<td><div class=\"style-card\" onClick=\"location.href ='../sns/detail.shop?sns_no="+s.getSns_no()+"'\">");
				html.append("<div class=\"style-img\"><img id=\"thumb\" src=\"file/"+s.getImg1url()+"\" width=\"228px\" height=\"270px\"></div>");
				html.append("<div class=\"style-content\">");
				html.append("<div class=\"style-profile\"><img src=");
				if(user.getImgurl()!=null && !user.getImgurl().equals(""))
					html.append("\"../user/file/"+user.getImgurl()+"\"");
				else
					html.append("../assets/img/user.svg");
				html.append(" width=\"30px\" height=\"30px\" style=\"border-radius:70%\" ></div>");
				html.append("<div class=\"style-info\">");
				html.append("<div class=\"style-info-first\">");
				html.append("<a>"+user.getNickname()+"</a>");
				html.append("<a style=\"float: right;\">"+regdate+"</a></div>");
				html.append("<div class=\"style-info-second\" >");
				html.append("<div class=\"txt_box\">"+s.getDescription()+"</div>...&nbsp;&nbsp;<a href=\"#\" style=\"color: #6d6d6d; font-size: 15px;\">더보기</a></div>");
				html.append("<div class=\"style-info-third\">");
				html.append("<img src=\"../assets/img/test7.PNG\" width=\"15px\" height=\"15px\">&nbsp;"+s.getLikenum());
				html.append("&nbsp;&nbsp;<img src=\"../assets/img/test8.PNG\" width=\"15px\" height=\"15px\">&nbsp;"+s.getCommentnum());
				html.append("</div></div></div></div></td>");
				if(i%4==0) {
					html.append("</tr>");
				}
				i++;
			}
			//html.append("</table>");
			return html.toString();
		}
	}
	
}
