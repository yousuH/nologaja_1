package kr.co.nologaja.booking;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BkCont {

	@Inject
	BkDAO dao;

	public BkCont() {
		System.out.println("==BkCont()==");
	}

	// 인덱스 배너 검색시 넘어가는 페이지
	@RequestMapping(value = "/searchlist.do")
	public ModelAndView hotellist() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("booking/searchlist");
		return mav;
	}

	// 예약 페이지
	@RequestMapping(value = "/booking.do")
	public ModelAndView booking() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("booking/booking");
		return mav;
	}

	// 예약 진행
	@RequestMapping(value = "/bookingproc.do")
	public String insert(@ModelAttribute BkDTO dto) {
		dao.insert(dto);
		return "index";
	}

	// 상세 페이지
	@RequestMapping(value = "/bkdetail.do")
	public ModelAndView detail() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("booking/detail");
		return mav;
	}

	// 마이페이지 내에서 예약목록 -> MypageCont.java
	@RequestMapping(value = "/bklist.do")
	public ModelAndView bklist() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/mypage(bookinglist)");
		return mav;
	}

	// 마이페이지 내에서 예약 취소
	@RequestMapping(value = "/bkupdate.do")
	public ModelAndView bkupdate() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("");
		return mav;
	}

}// class end
