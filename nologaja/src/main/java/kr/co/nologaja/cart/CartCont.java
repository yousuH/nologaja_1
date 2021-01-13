package kr.co.nologaja.cart;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.nologaja.cart.CartDAO;
import kr.co.nologaja.cart.CartDTO;
import kr.co.nologaja.cart.CartFolderDAO;
import kr.co.nologaja.cart.CartFolderDTO;
import kr.co.nologaja.cs.InquiryDTO;
import kr.co.nologaja.member.BuyerDTO;

@Controller
public class CartCont {
	
	@Inject
	CartFolderDAO cartFolderdao;
	
	@Inject
	CartDAO cartdao;
	

	public CartCont() {
		System.out.println("==CartCont()==");
	}
	
	
	@RequestMapping(value = "/cartfolderlist.do")
	public ModelAndView cartfolderlist(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		
		String uid = (String) session.getAttribute("uid");
		List<CartFolderDTO> cartFolders= new ArrayList<CartFolderDTO>();		
		cartFolders.addAll(cartFolderdao.getcartFolders(uid));
		
		System.out.println(cartFolders);
		
		mav.setViewName("mypage/cartfolderlist");
		mav.addObject("cartFolders", cartFolders);
		
		return mav;
	}
	
	
	
	@RequestMapping(value = "/cartdetail.do")
	public ModelAndView cartdetail(int ctFolder_num) {
		ModelAndView mav = new ModelAndView();
	

		List<CartDTO> cartitems= new ArrayList<CartDTO>();		
		cartitems.addAll(cartdao.getcartitems(ctFolder_num));
		
		System.out.println(cartitems);
		
		mav.setViewName("mypage/cartdetail");
		mav.addObject("cartitems", cartitems);
		
		return mav;
	}//insert() end
	
	
	
	
	@RequestMapping("/addcartfolder.do")
	public ModelAndView addcartfolder(CartFolderDTO dto) {
		cartFolderdao.addcartfolder(dto);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/cartfolderlist.do");
		
		return mav;
	}// insert() end
	
	
	
	
	
		
}//class end 
