package kr.co.nologaja.hotel;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.nologaja.member.BuyerDAO;

@Controller
public class HotelCont {
	
	@Inject
	HotelDAO hdao;
	
	@Inject
	RoomDAO rdao;

	public HotelCont() {
		System.out.println("==HotelCont()==");
	}

	// 마이페이지 내 숙소등록
	@RequestMapping(value = "/hotelins.do")
	public ModelAndView hotelins() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("hotel/hotelins");
		return mav;
	}

	// 마이페이지 내 룸등록
	@RequestMapping(value = "/roomins.do")
	public ModelAndView roomins(@ModelAttribute HotelDTO hoteldto) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("hotel/roomins");
		mav.addObject("hoteldto", hoteldto);
		return mav;
	}
	
	
	
	//숙소, 룸 인서트
		@RequestMapping(value = "/hotelroominspro.do")
		public ModelAndView hotelroominspro(@ModelAttribute RoomDTO roomdto, HotelDTO hoteldto) {
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("roomdto", roomdto);
			
			hdao.hotelins(hoteldto);
			rdao.roomins(roomdto);
			
			
			mav.setViewName("mypage/hotellist");
			
			
			return mav;
		}
	
	

}// class end
