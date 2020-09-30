package controller;

import java.util.ArrayList;
import java.util.Date;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import exception.ItemEmptyException;
import exception.LineException;
import exception.QnaException;
import logic.Item;
import logic.Line;
import logic.Qna;
import logic.ShopService;
import logic.Sns;
import logic.SnsItem;
import logic.User;

@Controller		
@RequestMapping("item")
public class itemController {
		
		//객체 주입
		@Autowired
		private ShopService service;
		
		@GetMapping("list")
		public String test(Model model) {
			return null;
		}
		
		/*
		@PostMapping("list")	//item/list.shop
		public ModelAndView list(Integer pageNum,String searchtype, String searchcontent, Integer category) {
			ModelAndView mav =new ModelAndView();
			if(pageNum==null || pageNum.toString().equals("")){
				pageNum=1;
			}
			if(searchtype == null || searchcontent == null ||searchtype.trim().equals("") || searchcontent.trim().equals("")) {
				searchtype =null;
				searchcontent =null;
			}
			int limit = 10;
			int listcount=service.getItemCount(searchtype,searchcontent);
			List<Item> itemList = service.getItemList(pageNum, limit,searchtype,searchcontent,category);
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
			mav.addObject("itemList",itemList);
			mav.addObject("listcount",listcount);
			return mav;
		}
		*/
		
	
		
		@GetMapping("store")	//item/list.shop
		public ModelAndView storemain() {
			ModelAndView mav = new ModelAndView();
			List<Item> rankItems = service.getRankItems();
			List<Item> newItems = service.getNewItems();
			for(Item r : rankItems) {
				User seller = service.getUser(r.getUserid());
				r.setName(seller.getCom_name());
			}
			for(Item n : newItems) {
				User seller = service.getUser(n.getUserid());
				n.setName(seller.getCom_name());
			}
			mav.addObject("rankItems",rankItems);
			mav.addObject("newItems",newItems);
			return mav;
		}
		
	

		@RequestMapping("create")
		public String loginCheckaddform(Model model) {
			model.addAttribute(new Item());
			return "item/add";
		}
		
	
		
		@PostMapping("write")	//한줄평 등록
		public ModelAndView write(Line line,HttpServletRequest request) {
			ModelAndView mav =new ModelAndView();
			service.lineWrite(line,request);  
			return mav;
		}

		
		@RequestMapping("plus")	//qna 등록
		public ModelAndView add(Qna qna,HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			service.qnaWrite(qna,request);
			return mav;
		}

		@GetMapping("reply")	//qna 답변 뷰
		public ModelAndView replyform(Integer qna_no,HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			Qna qna = service.getQna(qna_no);
			mav.addObject("qna",qna);
			
			return mav;
		}
		
		@PostMapping("replyadd")	//qna 등록
		public ModelAndView reply(@Valid Qna qna,HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			service.qnaReply(qna, request);
			return mav;
		}
		
	
		
		@RequestMapping("register")	//아이템 등록
		public ModelAndView add(@Valid Item item, BindingResult bresult, HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
		int max=service.getmaxnum();
		item.setItem_no(++max);
		service.itmeCreate(item,request);
		mav.setViewName("redirect:/item/list.shop");
		}catch(Exception e) {
			e.printStackTrace();
			mav.getModel().putAll(bresult.getModel());
		}
		
		return mav;
		}
		
		@RequestMapping("*") // /item/*.shop 각종 뷰
		public ModelAndView detail(Integer item_no,Integer qna_no,Integer line_no, HttpServletRequest request,Integer pageNum,Integer pageNum1,Integer pageNum2) {
			ModelAndView mav =new ModelAndView();
			
			Item item=null;
			Qna qna=new Qna();
			Line line=new Line();
			User user1=null;
			try {
				if(item_no == null) {
					item =new Item();
				}else {
					boolean readcntable=false;
					if(request.getRequestURI().contains("detail.shop")) {
						readcntable=true;
					}
				
					item=service.getItem(item_no,readcntable);
					user1=service.getUser(item.getUserid());
					if(request.getRequestURI().contains("update.shop")) {
						String[] option = item.getItem_option().split(",");
						String[] size = item.getSize().split(",");
						mav.addObject("option",option);
						mav.addObject("size",size);
						
					}
				}
		
			mav.addObject("user1",user1);
			mav.addObject("item",item);

			}catch(IndexOutOfBoundsException e) {
				throw new ItemEmptyException("존재하지 않는 상품입니다.","list.shop");
			}
			
			//상품 후기
			
			
			
			//line 페이징

			int limit1 = 6;
			if (pageNum1 == null || pageNum1.toString().equals("") || pageNum1 == 0) {
				pageNum1 = 1;
			}

			String searchtype1 = request.getParameter("searchtype1");
			String searchcontent1 = request.getParameter("searchcontent1");
			
			if (searchtype1 == null || searchcontent1 == null || searchtype1.trim().equals("") || searchcontent1.trim().equals("")) {
				searchtype1 = null;
				searchcontent1 = null;
			}
			
			List<Line> linelist = service.linelist(pageNum1, limit1, item_no,line_no);
			
			int linecount = service.linecount(searchtype1, searchcontent1,item_no);
			int lineno = linecount - (pageNum1 - 1) * limit1;
			int maxpage1 = (int)((double)linecount/limit1 + 0.95);
			int startpage1 = (int)((pageNum1/10.0 + 0.9) - 1) * 10 + 1;
			int endpage1 = startpage1 + 9;
			
			if (endpage1 > maxpage1) {
				endpage1 = maxpage1;
			}
			
			mav.addObject("pageNum1", pageNum1);
			mav.addObject("linelist", linelist);
			mav.addObject("linecount", linecount);
			mav.addObject("lineno", lineno);
			mav.addObject("maxpage1", maxpage1);
			mav.addObject("startpage1", startpage1);
			mav.addObject("endpage1", endpage1);
			mav.addObject("today1", new SimpleDateFormat("yyyyMMdd").format(new Date()));
			
		//qna 페이징	
			int limit = 6;
			if (pageNum == null || pageNum.toString().equals("") || pageNum == 0) {
				pageNum = 1;
			}
			
			String searchtype = request.getParameter("searchtype");
			String searchcontent = request.getParameter("searchcontent");
			
			if (searchtype == null || searchcontent == null || searchtype.trim().equals("") || searchcontent.trim().equals("")) {
				searchtype = null;
				searchcontent = null;
			}

			List<Qna> qnalist = service.qnalist(pageNum, limit, searchtype, searchcontent,item_no);
			
			int listcount = service.qnacount(searchtype, searchcontent,item_no);
			int qnano = listcount - (pageNum - 1) * limit;
			int maxpage = (int)((double)listcount/limit + 0.95);
			int startpage = (int)((pageNum/10.0 + 0.9) - 1) * 10 + 1;
			int endpage = startpage + 9;
			
			if (endpage > maxpage) {
				endpage = maxpage;
			}
			
			mav.addObject("pageNum", pageNum);
			mav.addObject("qnalist", qnalist);
			mav.addObject("listcount", listcount);
			mav.addObject("qnano", qnano);
			mav.addObject("maxpage", maxpage);
			mav.addObject("startpage", startpage);
			mav.addObject("endpage", endpage);
			mav.addObject("today", new SimpleDateFormat("yyyyMMdd").format(new Date()));
			
			
				
			return mav;
		}
		
		
		@GetMapping("update")	//아이템 수정 뷰
		public ModelAndView getItem(Integer item_no,HttpServletRequest request) {
			ModelAndView mav =new ModelAndView();
			boolean readcntable=false;
			Item item=service.getItem2(item_no,readcntable);
			System.out.println(item);
			String[] option = item.getItem_option().split(",");
			String[] size = item.getSize().split(",");
			mav.addObject("option",option);
			mav.addObject("size",size);
			mav.addObject("item",item);
			return mav;
		}
		
		@PostMapping("update")	//아이템 수정
		public ModelAndView update(Item item,HttpServletRequest request) {
			ModelAndView mav = new ModelAndView("item/update");
			service.itemUpdate(item,request);
			mav.setViewName("redirect:/item/detail.shop?item_no="+item.getItem_no());
			return mav;
		}
		

		@GetMapping(value = {"change"})	//한줄평 수정 뷰
		public ModelAndView check(Integer line_no,HttpSession session) {
			ModelAndView mav = new ModelAndView();
			Line line = service.getlineno(line_no);
			mav.addObject("line",line);
			return mav;
		}
		
		@PostMapping("change")	//한줄평 수정
		public ModelAndView update(Line line ,HttpServletRequest request) {
			ModelAndView mav =new ModelAndView("item/change");
			service.lineupdate(line,request);
			
			return mav;
		}
		
		@GetMapping(value = {"change1"}) //qna 수정 뷰
		public ModelAndView check1(Integer qna_no,HttpSession session) {
			ModelAndView mav = new ModelAndView();
			Qna qna = service.getQna(qna_no);
			mav.addObject("qna",qna);
			return mav;
		}
		
		@PostMapping("change1")	//qna 수정
		public ModelAndView update1(Qna qna ,HttpServletRequest request) {
			ModelAndView mav =new ModelAndView("item/change1");
			service.qnaupdate(qna,request);
			
			return mav;
		}
		 
		@RequestMapping("imgupload")
		//upload : ckeditor에서 전달해 주는 파일 정보의 이름
		// 			<input type="file" name="upload">
		//CKEditorFuncNum: ckeditor에서 
		public String imgupload(MultipartFile upload,String CKEditorFuncNum, HttpServletRequest request, Model model) {
			String path=request.getServletContext().getRealPath("/") + "item/imgfile/"; //이미지는 저장할 폴더를 지정 
			File f = new File(path);
			if(!f.exists()) f.mkdirs();
			if(!upload.isEmpty()) {	//업로드될 파일을 저장할 File 객체 지정
				File file= new File(path, upload.getOriginalFilename());
				try {
					upload.transferTo(file);	//업로드 파일 생성
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			String fileName =request.getServletContext().getContextPath()+"/item/imgfile/" +upload.getOriginalFilename();
			model.addAttribute("fileName",fileName);
			model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
			return "ckedit";
		}
		
		@RequestMapping("delete")	//아이템 삭제
		public ModelAndView delete(int item_no) {
			ModelAndView mav = new ModelAndView();
			service.itemDelete(item_no);
			mav.setViewName("redirect:/item/store.shop");
			return mav;
		}
		

		@PostMapping("remove")
		public ModelAndView delete1(int line_no) {
			ModelAndView mav = new ModelAndView();
			Line line = service.getlineno(line_no);
			service.lineDelete(line);
			return mav;
		}
		
		@PostMapping("remove1")	//qna 삭제
		public ModelAndView delete(Qna qna) {
			ModelAndView mav = new ModelAndView();
			service.qnaDelete(qna);	
			return mav;
		}
		
		@GetMapping("searchResult")
		public ModelAndView searchform(String keyword) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("keyword",keyword);
			return mav;
		}
	
}
