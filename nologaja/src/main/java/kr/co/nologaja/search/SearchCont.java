package kr.co.nologaja.search;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchCont {
	
	@Inject
	SearchDAO sdao;

	public SearchCont() {
		System.out.println("==bkCont객체생성==");
	}
	
	// 검색
	@RequestMapping(value = "/search.do")
	public ModelAndView search(SearchDTO sdto) throws ParseException {
		//System.out.println(sdto.getCityCode());	// SE
		//System.out.println(sdto.getMaxGuest()); // 1
		//System.out.println(sdto.getCk_in());    // 2021-01-25 24 
		//System.out.println(sdto.getCk_out());   // 2021-01-29 29

		// 1. cityCode, maxGuest -> roomNumber list로 가져오기 a_1, a_2, a_3,,, c_3;
		List<String> rNlist= sdao.rNfind(sdto);
		//System.out.println(rNlist);             // [SEAP0003_01, SEAP0004_01, SEAP0005_01]
		//System.out.println(rNlist.get(0).toString()); // SEAP0003_01
		
		// 2_1. booktable에 없는 roomnumber if == 0 -> 바로 예약 가능한 방으로 분류
		// 2_2. booktable에 있는 roomnumber   else  -> 날짜 비교를 위한 방으루 분류
		List<String> ableRN = new ArrayList<String>(); // 바로예약가능한방
		List<String> checkRN = new ArrayList<String>(); // 날짜 비교를 위한방
		for(int i=0; i<rNlist.size(); i++) {
			if(sdao.ablerN(rNlist.get(i).toString()) == 0) { 
				ableRN.add(rNlist.get(i).toString());
			}else {
				checkRN.add(rNlist.get(i).toString());
			}//if end
		}//for end
		
		//System.out.println(ableRN); //[SEAP0005_01]
		//System.out.println(checkRN); //[SEAP0003_01, SEAP0004_01]
		
		
		// 3. 날짜비교로 예약가능한방을 ableRN 리스트로 추가 == 0 인방 
		for(int i=0; i<checkRN.size(); i++) {
			sdto.setRoomNumber(checkRN.get(i).toString());
			if(sdao.datecheck(sdto) == 0) {
				ableRN.add(checkRN.get(i).toString());
			}//if end
		}
		System.out.println("== 예약가능한 방" + ableRN);

		long fee=0;
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date ckin=df.parse(sdto.getCk_in());
		Date ckout=df.parse(sdto.getCk_out());
		
		long diff=ckout.getTime() - ckin.getTime();
		long night = diff/(24*60*60*1000);
		
		Calendar cld=Calendar.getInstance();
		cld.setTime(ckin);
		int DOW = cld.get(Calendar.DAY_OF_WEEK);//요일
		
		
		// 4. 예약가능한 방정보들 List로 불러와서 객체전달
		List<SearchlistDTO> list = new ArrayList<SearchlistDTO>();
		for(int i=0; i<ableRN.size(); i++) {
			list.add(sdao.ableList(ableRN.get(i).toString()));
			int longcost = list.get(i).getLongcost();
			int basecost = list.get(i).getBasecost();
			int weekcost = list.get(i).getWeekcost();
			if(night >= 7) {
				fee = longcost*night;
			}else {
				switch (DOW) 
				{
				case 1: 
					if(night==6) {
						fee=(weekcost)+(basecost*(night-1));
					}else {
						fee=basecost*night;
					}//if end	
					break;
					
				case 2:
					if(night==5) {
						fee=(weekcost)+(basecost*(night-1));
					}else if(night==6) {
						fee=(weekcost*2)+(basecost*(night-2));
					}else {
						fee=basecost*night;
					}
					break;
					
				case 3:
					if(night==4) {
						fee=(weekcost)+(basecost*night-1);
					}else if(night==5) {
						fee=(weekcost*2)+(basecost*(night-2));
					}else {
						fee=basecost*night;
					}
					break;
					
				case 4:
					if(night==3) {
						fee=(weekcost)+(basecost*night-1);
					}else if(night==4) {
						fee=(weekcost*2)+(basecost*(night-2));
					}else {
						fee=basecost*night;
					}
					break;
					
				case 5:
					if(night==2) {
						fee=(weekcost)+(basecost*night-1);
					}else if(night==3) {
						fee=(weekcost*2)+(basecost*(night-2));
					}else {
						fee=basecost*night;
					}
					break;
					
				case 6: 
					if(night==1) {
						fee=weekcost;
					}else if(night==2) {
						fee=(weekcost*2);
					}else {
						fee=(weekcost*2)+basecost*night-2;
					}
					break;
				
				case 7: 
					if(night==1) {
						fee=(weekcost);
					}else {
						fee=(weekcost)+(basecost*(night-1));
					}
					break;
				}//switch end
			}//if end
			list.get(i).setFee(fee);
		}
		System.out.println(list);
		//[RoomDTO [roomNumber=SEAP0005_01, roomName=방2, hotelNumber=SEAP0005, roomImg=, roomInform=방방방방바아, maxGuest=6, conv=KC,WS, baseCost=40000, weekCost=40000, longCost=40000]]
		
		
		//수정 hotle 주소 조인, 리뷰점수, 리뷰 갯수 조인 
		//점수 및 갯수는 없으면 조인 x? 0? 0넣고 인덱스 if문 써야할듯
		//계산된 fee값은 어쩌지
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search/search");
		mav.addObject("list", list);
		return mav;
	}// insert() end
		
}
