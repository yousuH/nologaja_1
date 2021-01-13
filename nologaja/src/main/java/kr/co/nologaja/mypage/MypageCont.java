package kr.co.nologaja.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypageCont {

	public MypageCont() {
		System.out.println("==MypageCont()==");
	}
	
	//마이페이지(배너 상의 마이페이지 버튼)
	@RequestMapping(value = "/mypage.do")
	public ModelAndView mypage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/mypage(bookinglist)");
		return mav;
	}
	
		
}
