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
	      
		//호텔넘버생성
        String hotelNumber = hoteldto.getCityCode() + hoteldto.getBdgType() + String.format("%04d", 1); 
        if(hdao.hotelnumFind(hotelNumber)==1) {
        	for (int i = 2; i < 9999; i++) {
				hotelNumber = hoteldto.getCityCode() + hoteldto.getBdgType() + String.format("%04d", i);
				if(hdao.hotelnumFind(hotelNumber)==0) {
					break;	
				};
			}
        }
        //호텔넘버 hoteldto에 삽입
        hoteldto.setHotelNumber(hotelNumber);
        
		//호텔이미지 정보담아두기
		MultipartFile mf = mtfRequest.getFile("hotelIMG");
		
		//경로는 각자 변경해줘야됨
		//ctrl+h 개인작업 ex)조씨
        String path = "C:/Users/yousu/git/nologaja_1/nologaja/src/main/webapp/resources/img/hotel/";
        String originFileName = mf.getOriginalFilename(); // 원본 파일 명
        String safeFile = path + System.currentTimeMillis() + originFileName;
        	//저장 될 파일 명
        String saveFIle = safeFile.substring(safeFile.lastIndexOf("/")+1);
        HotelImageDTO hotelimagedto = new HotelImageDTO();
        //호텔넘버값 가져와서 hotel이미지테이블에 삽입
        hotelimagedto.setHotelNumber(hoteldto.getHotelNumber());
        hotelimagedto.setSaveFile(saveFIle);
        
        mav.addObject("hotelimagedto", hotelimagedto);
        System.out.println("------"+hotelimagedto);
        
 
        
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
	public ModelAndView hotelroominspro(@ModelAttribute RoomDTO roomdto, HotelDTO hoteldto, HotelImageDTO dto, MultipartHttpServletRequest mtfRequest) {
		ModelAndView mav = new ModelAndView();
		//숙소등록
		hdao.hotelins(hoteldto);
//		
		
		//룸넘버 생성하기
        String roomNumber = hoteldto.getHotelNumber() + "_01";
        
        roomdto.setRoomNumber(roomNumber);
        /*
          if(rdao.roomnumFind(roomNumber)==1) {
         
        	for (int i = 2; i < 99; i++) {
				roomNumber = hoteldto.getHotelNumber() + "_" + String.format("%02d", 1); 
				if(rdao.roomnumFind(roomNumber)==0) {
					break;	
				};
			}
        }
        */
		
		
		List<MultipartFile> fileList = mtfRequest.getFiles("roomIMG");

		//ctrl+h 개인작업 ex)조씨
        String path = "C:/Users/yousu/git/nologaja_1/nologaja/src/main/webapp/resources/img/room/";

        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명

            String safeFile = path + System.currentTimeMillis() + originFileName;
            String saveFIle = safeFile.substring(safeFile.lastIndexOf("/")+1);
            
            RoomImageDTO roomimagedto = new RoomImageDTO();
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

        rdao.roomins(roomdto);
		
		mav.setViewName("mypage/hotellist");

		return mav;
	}

}// class end
