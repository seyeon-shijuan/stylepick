package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.SnsException;
import logic.Comment;
import logic.Item;
import logic.ShopService;
import logic.Sns;
import logic.SnsItem;
import logic.User;


@Controller
@RequestMapping("sns")	
public class SnsController {
	@Autowired
	private ShopService service;
	
	@RequestMapping("searchResult")
	public ModelAndView searchform(String keyword) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("keyword",keyword);
		return mav;
	}
	
	@GetMapping("main")
	public String test(Model model) {
		return null;
	}
	
	/*
	@GetMapping("*")
	public String entry(Model model) {
		model.addAttribute(new Sns());
		return null;
	}
	*/
	
	@GetMapping(value={"write","qna"})
	public String loginCheckWrite(Model model,HttpSession session) {
		model.addAttribute(new Sns());
		return null;
	}
	
	@PostMapping("write")
	public ModelAndView create(Sns sns,String category,String detail,String item_no,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<SnsItem> list = new ArrayList<SnsItem>();
		sns.setSns_no(service.snsNum());
		if(category == null && detail == null && item_no == null) {
			item_no = "";
			category = "";
			detail = "";
		} else {
			String[] in = item_no.split(",");
			List<Integer> list2 = new ArrayList<Integer>();
			for(int i=0;i<in.length;i++) {
				if(Integer.parseInt(in[i])!=0) {
					sns.setHasshopitem(true); break;
				}
			}
			for(int i=0;i<in.length;i++) {
				list2.add(Integer.parseInt(in[i]));
			}
			String[] cg = category.split(",");
			String[] dt = detail.split(",");
			for(int i=0;i<cg.length;i++) {
				SnsItem item = new SnsItem(sns.getSns_no(),i+1,cg[i],dt[i],list2.get(i));
				list.add(item);
			}
			sns.setItemList(list);
		}
		sns.setItemList(list);
		service.snsWrite(sns,request);
		if(sns.getType()==1) {
			mav.setViewName("redirect:main.shop?ksb=new&type=1");
		} else if(sns.getType()==2) {
			mav.setViewName("redirect:main.shop?type=2");
		}
		return mav;
	}
	
	@RequestMapping("main")
	public ModelAndView list(String ksb,String type,Integer pageNum,String searchcontent) {
		ModelAndView mav = new ModelAndView();
		if(type == null) {
			ksb = "hot";
			type = "1";
		}
		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		if(searchcontent == null || searchcontent.trim().equals("")) {
			searchcontent = null;
		}
		
		int limit = 20;
		int listcount = service.getSnsCount(type,searchcontent);
		List<Sns> snslist = service.getSnsList(ksb,type,pageNum,limit);
		
		int maxpage = (int)((double)listcount/limit + 0.95);
		int startpage = (int)((pageNum/10.0 + 0.9)-1)*10+1;
		int endpage = startpage + 9;
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		mav.addObject("pageNum",pageNum);
		mav.addObject("maxpage",maxpage);
		mav.addObject("startpage",startpage);
		mav.addObject("endpage",endpage);
		mav.addObject("boardlist",snslist);
		mav.addObject("listcount",listcount);
		
		return mav;
		
	}
	
	@PostMapping("comment")
	public ModelAndView comment(Comment comment) {
		ModelAndView mav = new ModelAndView();
		if(comment.getContent().trim().equals("")) {
			throw new SnsException("내용을 입력하세요.","detail.shop?sns_no="+comment.getSns_no());
		}
		comment.setReply_no(service.replyNum(comment.getSns_no()));
		service.replyWrite(comment);
		mav.setViewName("redirect:detail.shop?sns_no="+comment.getSns_no());
		return mav;
	}
	
	@GetMapping("*")	//detail,supdate
	public ModelAndView getSns(Integer sns_no) {
		ModelAndView mav = new ModelAndView();
		Sns sns = null;
		if(sns_no == null) {
			sns = new Sns();
		} else {
			try {
				sns = service.getSns(sns_no);
				User user = service.getUser(sns.getUserid());
				List<SnsItem> snsitems = service.getSnsItem(sns.getSns_no());
				List<Item> shopitems = new ArrayList<Item>(); 
				sns.setItemList(snsitems);
				List<SnsItem> shopitem = service.getshopItem(sns.getSns_no());
				for(SnsItem si : shopitem) {
					Item item = service.getItem(si.getIsshopitem());
					User seller = service.getUser(item.getUserid());
					item.setName(seller.getCom_name());
					shopitems.add(item);
				}
				//System.out.println(sns);
				//System.out.println(shopitems);
				sns.setCommentnum(service.getcommentnum(sns_no));
				sns.setLikenum(service.getlikenum(sns_no));
				mav.addObject("snsitems",snsitems);
				mav.addObject("shopitems",shopitems);
				mav.addObject("sns",sns);
				mav.addObject("user",user);
			} catch(Exception e) {
				throw new SnsException("없는 게시물입니다.","main.shop?ksb=new&type=1");
			}
		}
		mav.addObject("sns",sns);
		return mav;
	}
	
	@PostMapping("update")
	public ModelAndView update(Sns sns,String category,String detail,String item_no,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("sns/supdate");
		List<SnsItem> list = new ArrayList<SnsItem>();
		if(category == null && detail == null && item_no == null) {
			item_no = "";
			category = "";
			detail = "";
		} else {
			String[] in = item_no.split(",");
			List<Integer> list2 = new ArrayList<Integer>();
			for(int i=0;i<in.length;i++) {
				list2.add(Integer.parseInt(in[i]));
			}
			String[] cg = category.split(",");
			String[] dt = detail.split(",");
			for(int i=0;i<cg.length;i++) {
				SnsItem item = new SnsItem(sns.getSns_no(),i+1,cg[i],dt[i],list2.get(i));
				list.add(item);
			}
			sns.setItemList(list);
		}
		//System.out.println(sns);
		service.snsUpdate(sns,request);
		mav.setViewName("redirect:/sns/detail.shop?sns_no="+sns.getSns_no());
		return mav;
	}
	
	@GetMapping("mypage")
	public ModelAndView checkmypge(String userid,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = service.getUser(userid);
		int mysnsnum = service.getmySnsCount(userid);
		int follownum = service.getFollowCount(userid);
		int followernum = service.getFollowerCount(userid);
		mav.addObject("follownum",follownum);
		mav.addObject("followernum",followernum);
		mav.addObject("mysnsnum",mysnsnum);
		mav.addObject("user",user);
		return mav;
	}
	
	@RequestMapping("follow")
	public ModelAndView follow(String fuser,HttpSession session) {
		ModelAndView mav = new ModelAndView("sns/mypage");
		User loginUser = (User)session.getAttribute("loginUser");
		service.Follow(loginUser.getUserid(),fuser);
		mav.setViewName("redirect:/sns/mypage.shop?userid="+fuser);
		return mav;	
	}
	
	@GetMapping("searchForm")
	public ModelAndView form(int index,String category) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("index",index+1);
		mav.addObject("category",category);
		return mav;
	}
	
	@RequestMapping("search")
	public ModelAndView search(Integer pageNum,Integer category,String keyword,int index) {
		ModelAndView mav = new ModelAndView("sns/searchForm");
		if(pageNum==null || pageNum.toString().equals("")){
			pageNum=1;
		}
		if(keyword == null ||keyword.trim().equals("")) {
			keyword =null;
		}
		
		int limit = 4;
		int listcount=service.getItemCount2(keyword,category);
		List<Item> itemlist = service.getItemList2(pageNum,limit,keyword,category);
		for(Item i : itemlist) {
			User user = service.getUser(i.getUserid());
			i.setName(user.getCom_name());
		}
		int maxpage = (int)((double)listcount/limit + 0.95);
		int startpage = (int)((pageNum/10.0 + 0.9)-1)*10+1;
		int endpage = startpage + 9;
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		mav.addObject("index",index);
		mav.addObject("pageNum",pageNum);
		mav.addObject("maxpage",maxpage);
		mav.addObject("startpage",startpage);
		mav.addObject("endpage",endpage);
		mav.addObject("itemlist",itemlist);
		return mav;
	}
	
	@RequestMapping("searchCommit")
	public ModelAndView commit(int item_no,int index) {
		ModelAndView mav = new ModelAndView();
		Item item = service.getItem(item_no);
		mav.addObject("detail",item.getSubject());
		mav.addObject("item_no",item_no);
		mav.addObject("index",index);
		return mav;
	}
	

}
