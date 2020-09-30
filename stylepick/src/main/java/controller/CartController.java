package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.CartEmptyException;
import logic.Cart;
import logic.Item;
import logic.ItemSet;
import logic.Sale;
import logic.ShopService;
import logic.User;

@Controller
@RequestMapping("cart")
public class CartController {

	@Autowired
	private ShopService service;

	@RequestMapping("cartAdd")
	public ModelAndView add(Integer item_no,Integer quantity ,String item_option, String size,HttpSession session) {
		ModelAndView mav=new ModelAndView();
		Item item=service.getItem(item_no);
		Cart cart =(Cart)session.getAttribute("CART");
		if(cart==null) {
			cart = new Cart();
			session.setAttribute("CART", cart);
		}
	
		try {
			
		cart.push(new ItemSet(item,quantity, item_option, size));
		mav.setViewName("redirect:cartView.shop");
		}
		catch(Exception e) {
			e.printStackTrace();
			throw new CartEmptyException("장바구니 등록에 실패했습니다.", "list.shop?="+item.getItem_no());
		}
		mav.addObject("cart",cart);

		return mav;
	}


	
	@RequestMapping("cartView")
	public ModelAndView cartview(HttpSession session) {
		ModelAndView mav=new ModelAndView("cart/cart");
		Cart cart =(Cart)session.getAttribute("CART");
		if(cart == null || cart.getItemSetList().size()==0) {
			throw new CartEmptyException("장바구니에 상품이 없습니다.","../item/store.shop");
		}
		mav.addObject("cart",cart);
		return mav;
	}
	
	@GetMapping("cartDelete")
	public ModelAndView delete(int index,HttpSession session) {
		ModelAndView mav=new ModelAndView("cart/cart");
		Cart cart =(Cart)session.getAttribute("CART");
		ItemSet itemset=null;
		try {
			//List.remove(int) : index에 해당하는 객체를 제거
			//List.remove(Integer[Object]) : Object(object를 가르킨다) 객체 제거
			//itemset : List에서 제거된 객체 저장
			itemset=cart.getItemSetList().remove(index);
			mav.addObject("message",itemset.getItem().getItem_name()+"상품을 제거했습니다.");
		}catch(Exception e) {
			mav.addObject("message","장바구니 상품이 삭제되지 않았습니다.");
		}
		mav.addObject("cart",cart);
		return mav;
	}
	
	@RequestMapping("end")
	public ModelAndView checkend(Sale sale, HttpServletRequest request,HttpSession session) {

		ModelAndView mav = new ModelAndView();
		Cart cart = (Cart)session.getAttribute("CART");

		String name = cart.getItemSetList().get(0).getItem().getItem_name().trim();
		
		int count = cart.getItemSetList().size();
		if (count > 1) {
			name += " 외 " + (count - 1) + "건";
		}
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		Sale res = service.checkend(sale, cart, loginUser);
		long total = cart.getTotal();
		
		// 결제창에 표시될 내용
		Map<String, String> outMap = new HashMap<>();

		outMap.put("name", name);
		outMap.put("count", count + "");
		outMap.put("total", total + "");
		
		session.removeAttribute("CART");
		
		//mav.addObject("sale", res);
		//mav.addObject("total", total);
		
		mav.addObject("outMap", outMap);
		mav.setViewName("redirect:pay.shop?name="+name+"&total="+outMap.get("total"));
		return mav;
	}
	
	@RequestMapping("checkout")
	void checkout(HttpSession session) {}
	
	@RequestMapping("*")
	void all(HttpSession session) {}
}
