package kr.co.nologaja.booking;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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

	// 예약 페이지
	@RequestMapping(value = "/booking.do")
	public ModelAndView booking() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("booking/booking");
		return mav;
	}

	// 예약 진행
	@RequestMapping(value = "/bookingproc.do")
	public String insert(@ModelAttribute BkDTO dto, HttpServletRequest req) {
		dao.insert(dto);
		return "redirect:/mypage.do";
	}

	// 마이페이지 예약 목록에서 예약번호의 상세페이지
	@RequestMapping(value = "/bkdetail.do")
	public ModelAndView detail(@ModelAttribute BkDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/bkdetail");
		
		dto = dao.detail(dto.getBk_num());		
		mav.addObject("dto", dto);
		mav.addObject("bk_num", dto.getBk_num());
		mav.addObject("ck_in", dto.getCk_in());
		mav.addObject("ck_out", dto.getCk_out());
		mav.addObject("night", dto.getNight());
		mav.addObject("hotelName", dto.getHotelName());
		mav.addObject("roomNumber", dto.getRoomNumber());
		mav.addObject("roomName", dto.getRoomName());
		mav.addObject("maxGuest", dto.getMaxGuest());
		mav.addObject("fee", dto.getFee());
		mav.addObject("uid", dto.getUid());
		mav.addObject("request", dto.getRequest());
		mav.addObject("pay", dto.getPay());
		mav.addObject("pay_st", dto.getPay_st());
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
