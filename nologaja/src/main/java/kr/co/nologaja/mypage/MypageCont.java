package kr.co.nologaja.mypage;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.nologaja.booking.BkDAO;
import kr.co.nologaja.booking.BkDTO;
import kr.co.nologaja.hotel.HotelDAO;
import kr.co.nologaja.hotel.HotelDTO;
import kr.co.nologaja.hotel.RoomDAO;
import kr.co.nologaja.hotel.RoomDTO;
import kr.co.nologaja.inquiryHost.InquiryHostDAO;
import kr.co.nologaja.inquiryHost.InquiryHostDTO;
import kr.co.nologaja.search.RoomHotelDTO;
import net.utility.HotelListDTO;
import net.utility.RoomImageDTO;
import net.utility.imageDAO;

@Controller
public class MypageCont {

	@Inject
	HotelDAO hdao;

	@Inject
	HotelDTO hdto;

	@Inject
	imageDAO idao;

	@Inject
	RoomDAO rdao;

	@Inject
	RoomDTO rdto;

	@Inject
	RoomImageDTO roomimagedto;

	@Inject
	imageDAO imdao;

	@Inject
	BkDAO dao;

	@Inject
	InquiryHostDTO ihdto;

	@Inject
	InquiryHostDAO ihdao;

	public MypageCont() {
		System.out.println("==MypageCont()==");
	}

	// 마이페이지(배너 상의 마이페이지 버튼)
	@RequestMapping(value = "/mypage.do")
	public String list(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String suid = (String)session.getAttribute("suid");
		String uid  = (String)session.getAttribute("uid");
		
		if(uid != null) {
			List<BkDTO> list = dao.list(uid);
			model.addAttribute("list", list);
		} else if(suid != null) {
			List<BkDTO> list = dao.s_list(suid);
			model.addAttribute("list", list);
		}
		
		return "mypage/mypage(bookinglist)";
	}

	// 방추가 폼 불러오기
	@RequestMapping(value = "/add_room.do")
	public ModelAndView add_room(@ModelAttribute HotelListDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/add_room");
		mav.addObject("hotelName", dto.getHotelName());
		mav.addObject("hotelNumber", dto.getHotelNumber());
		return mav;
	}

	// 방 추가 등록하기
	@RequestMapping(value = "/add_room_proc.do")
	public ModelAndView hotel_detail(@ModelAttribute RoomDTO roomdto, MultipartHttpServletRequest mtfRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/hotellist");

		// 룸넘버 생성하기
		String roomNumber = roomdto.getHotelNumber() + "_01";
		roomdto.setRoomNumber(roomNumber);

		if (rdao.roomnumFind(roomNumber) == 1) {
			for (int i = 2; i < 99; i++) {
				roomNumber = roomdto.getHotelNumber() + "_" + String.format("%02d", i);
				if (rdao.roomnumFind(roomNumber) == 0) {
					break;
				}
				;
			}
		}

		roomdto.setRoomNumber(roomNumber);
		System.out.println(roomNumber);
		List<MultipartFile> fileList = mtfRequest.getFiles("roomIMG");

		// ctrl+h 개인작업 ex)조씨
		String path = "D:/java0812/git/nologaja_1/nologaja_1/nologaja/src/main/webapp/resources/img/room/";

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명

			String safeFile = path + System.currentTimeMillis() + originFileName;
			String saveFIle = safeFile.substring(safeFile.lastIndexOf("/") + 1);

			roomimagedto.setRoomNumber(roomdto.getRoomNumber());
			roomimagedto.setSaveFile(saveFIle);
			imdao.room_insert(roomimagedto);
			try {
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		rdao.roomins(roomdto);
		return mav;
	}

	// 판매자가 등록한 숙소 상세보기
	@RequestMapping(value = "/hotel_detail.do")
	public ModelAndView hotel_detail(@ModelAttribute HotelListDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/hotel_detail");
		hdto = hdao.hotel_detail(dto.getHotelNumber());
		List<RoomDTO> list = rdao.room_list(dto.getHotelNumber());
		mav.addObject("dto", hdto);
		mav.addObject("savefile", dto.getSavefile());
		mav.addObject("hotelName", dto.getHotelName());
		mav.addObject("list", list);
		return mav;
	}

	// 판매자가 등록한 숙소 목록 불러오기
	@RequestMapping(value = "/hotellist.do")
	public ModelAndView hotel_list(HttpServletRequest req) {
		// 세션에서 suid값을 가져와 판매자가 등록한 호텔리스트 불러옴
		HttpSession session = req.getSession();
		String suid = (String) session.getAttribute("suid");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/hotellist");
		List<HotelListDTO> list = hdao.hotel_list(suid);
		mav.addObject("list", list);
		return mav;
	}

	// 판매자가 등록한 방 상세보기
	@RequestMapping(value = "/room_detail.do")
	public ModelAndView room_detail(String roomNumber) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/room_detail");
		rdto = rdao.room_detail(roomNumber);
		mav.addObject("dto", rdto);
		List<RoomImageDTO> list = imdao.room_get_image(roomNumber);
		mav.addObject("list", list);
		return mav;
	}
	
	 @RequestMapping(value = "/inquirylist.do") 
	 public ModelAndView inquirylist(HttpSession session, HttpServletRequest req) { 
		String hotelNumber = req.getParameter("hotelNumber");
		ModelAndView mav = new ModelAndView();
	 	mav.setViewName("mypage/inquirylist");
	 	String suid = (String) session.getAttribute("suid");
	 	List<HotelDTO> list = ihdao.inquiryHost_hotelNumber(suid);
	 	List<InquiryHostDTO> list2 = ihdao.inquiryHost_getInquiry(hotelNumber);
    
    String uid = (String) session.getAttribute("uid");
    List<InquiryHostDTO> IHlist = ihdao.inquiryhost_list2(uid);
    for (int i = 0; i < IHlist.size(); i++) {

			String roomNumber = IHlist.get(i).getRoomNumber();
			String roomName = ihdao.getRoomName(roomNumber);
			System.out.println(roomName);
			IHlist.get(i).setRoomName(roomName);

			Date wdate = IHlist.get(i).getWdate();
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			String Swdate = transFormat.format(wdate);
			IHlist.get(i).setSwdate(Swdate);

		}
     
	 	mav.addObject("list",list);
	 	mav.addObject("list2", list2);
    mav.addObject("IHlist", IHlist);

	 	return mav; 
	 }
  
	@RequestMapping(value = "/ihdetail.do")
	public ModelAndView ihdetail(int grpno) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/ihdetail");

		List<InquiryHostDTO> IHlist = ihdao.getIHset(grpno);

		String roomNumber = IHlist.get(0).getRoomNumber();
		String roomName = ihdao.getRoomName(roomNumber);
		System.out.println(roomName);
		IHlist.get(0).setRoomName(roomName);

		for (int i = 0; i < IHlist.size(); i++) {
			Date wdate = IHlist.get(i).getWdate();
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			String Swdate = transFormat.format(wdate);
			IHlist.get(i).setSwdate(Swdate);
		}

		mav.addObject("IHlist", IHlist);
		System.out.println(IHlist);
		return mav;
	}
}// class
