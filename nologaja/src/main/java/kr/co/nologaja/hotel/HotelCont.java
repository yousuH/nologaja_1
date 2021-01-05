package kr.co.nologaja.hotel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HotelCont {

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
	public ModelAndView roomins(@ModelAttribute HotelDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("hotel/roomins");
		mav.addObject("dto", dto);
		return mav;
	}
	
	
	// 마이페이지 내 룸등록
		@RequestMapping(value = "/hotellist.do")
		public ModelAndView hotellist(@ModelAttribute HotelDTO dto) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("hotel/roomins");
			mav.addObject("dto", dto);
			return mav;
		}
	
	
	

}// class end
