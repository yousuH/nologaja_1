package kr.co.nologaja.hotel;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import net.utility.HotelImageDTO;
import net.utility.RoomImageDTO;
import net.utility.imageDAO;

@Controller
public class HotelCont {

	@Inject
	HotelDAO hdao;

	@Inject
	RoomDAO rdao;
	
	@Inject
	imageDAO imdao;

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
	public ModelAndView roomins(@ModelAttribute HotelDTO hoteldto, MultipartHttpServletRequest mtfRequest) {
		System.out.println("------"+hoteldto);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("hotel/roomins");
		mav.addObject("hoteldto", hoteldto);
		//호텔이미지 정보담아두기
		MultipartFile mf = mtfRequest.getFile("hotelIMG");
			//경로는 각자 변경해줘야됨
        String path = "/Users/moon/git/nologaja_1/nologaja/src/main/webapp/resources/img/hotel/";
        String originFileName = mf.getOriginalFilename(); // 원본 파일 명
        String safeFile = path + System.currentTimeMillis() + originFileName;
        	//저장 될 파일 명
        String saveFIle = safeFile.substring(safeFile.lastIndexOf("/")+1);
        HotelImageDTO hotelimagedto = null;
        //호텔넘버값 가져와서 hotel이미지테이블에 삽입
        hotelimagedto.setHotelNumber(hoteldto.getHotelNumber());
        hotelimagedto.setSaveFile(saveFIle);
        
        mav.addObject("hotelimagedto", hotelimagedto);
        
        

        try {
            mf.transferTo(new File(safeFile));
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

		return mav;
	}

	// 숙소, 룸 인서트
	@RequestMapping(value = "/hotelroominspro.do")
	public ModelAndView hotelroominspro(@ModelAttribute RoomDTO roomdto, HotelDTO hoteldto, MultipartHttpServletRequest mtfRequest ) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("roomdto", roomdto);
//		//정보삽입
//		hdao.hotelins(hoteldto);
//		rdao.roomins(roomdto);
		
		List<MultipartFile> fileList = mtfRequest.getFiles("hotelIMG");

        String path = "/Users/moon/git/nologaja_1/nologaja/src/main/webapp/resources/img/room/";

        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명

            String safeFile = path + System.currentTimeMillis() + originFileName;
            String saveFIle = safeFile.substring(safeFile.lastIndexOf("/")+1);
            
            RoomImageDTO roomimagedto = null;
            roomimagedto.setRoomNumber(roomdto.getRoomNumber());
            roomimagedto.setSaveFile(saveFIle);
            
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
		
		mav.setViewName("mypage/hotellist");

		return mav;
	}

}// class end
