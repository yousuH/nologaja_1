package kr.co.nologaja.cart;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		List<CartFolderDTO> cartFolders = new ArrayList<CartFolderDTO>();
		cartFolders.addAll(cartFolderdao.getcartFolders(uid));

		System.out.println(cartFolders);

		mav.setViewName("mypage/cartfolderlist");
		mav.addObject("cartFolders", cartFolders);

		return mav;
	}

	@RequestMapping(value = "/cartdetail.do")
	public ModelAndView cartdetail(int ctFolder_num) {
		ModelAndView mav = new ModelAndView();

		List<CartDTO> cartitems = new ArrayList<CartDTO>();
		cartitems.addAll(cartdao.getcartitems(ctFolder_num));

		System.out.println(cartitems);

		mav.setViewName("mypage/cartdetail");
		mav.addObject("cartitems", cartitems);

		return mav;
	}// insert() end

	@RequestMapping("/addcartfolder.do")
	public ModelAndView addcartfolder(CartFolderDTO dto) {
		cartFolderdao.addcartfolder(dto);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/cartfolderlist.do");

		return mav;
	}// insert() end

	@RequestMapping("/addcartfolder_insert.do")
	public void idCheckProc(CartFolderDTO cartfolderdto, CartDTO cartdto, HttpServletRequest req, HttpSession session) {
		try {
			 
			System.out.println("------"+cartfolderdto);
			System.out.println("======"+cartdto);
			
				String uid=(String)session.getAttribute("uid");
				int totalFee=Integer.parseInt(req.getParameter("totalFee"));
				cartdto.setUid(uid);
				cartdto.setTotalFee(totalFee);
				//사용자가 요청한 값은 cartdto에 다 담아놓았습니다
		
				
				//여기에 dao작업하면 됩니다 아래 다 되어있어욥! 에러가 안난다면....
				
				cartfolderdto.setUid(uid);
				cartFolderdao.addcartfolder(cartfolderdto);

				// 방금 생성한 cartfolder의 number를 알아와서 cartdto에 담아줘야 함 
				int ctFolder_num = cartFolderdao.getctfoldernum(cartfolderdto);
				cartdto.setCtFolder_num(ctFolder_num);

				cartdao.cartinsert(cartdto);				
							
			

		} catch (Exception e) {
			System.out.println("addcartfolder+insert 실패 : " + e);
		} // try catch end

	}// idCheckProc() end
	
	
	
	
	@RequestMapping("/cartinsert.do")
	public void cartinsert(CartDTO cartdto, HttpServletRequest req, HttpSession session) {
		try {
			System.out.println("======"+cartdto);
			
			String uid=(String)session.getAttribute("uid");
			int totalFee=Integer.parseInt(req.getParameter("totalFee"));
			cartdto.setUid(uid);
			cartdto.setTotalFee(totalFee);
			
						
			
			cartdao.cartinsert(cartdto);
		} catch (Exception e) {
			System.out.println("cartinsert실패 : " + e);
		} // try catch end

	}// idCheckProc() end

}// class end
