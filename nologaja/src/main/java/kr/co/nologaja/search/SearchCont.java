package kr.co.nologaja.search;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.nologaja.cart.CartFolderDAO;
import kr.co.nologaja.cart.CartFolderDTO;
import kr.co.nologaja.hotel.RoomDTO;
import net.utility.Pagination;


@Controller
public class SearchCont {
	
	@Inject
	SearchDAO sdao;
	
	@Inject
	CartFolderDAO cartFolderdao;
	
	public SearchCont() {
		System.out.println("==SearchCont객체생성==");
	}
	
	// 검색
	@RequestMapping(value = "/search.do")
	public ModelAndView search(SearchDTO sdto, HttpSession session, @RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue = "review") String sort) throws ParseException {
    
		// 1. cityCode, maxGuest -> roomNumber list로
		List<String> rNlist= sdao.rNfind(sdto);
		
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
			
		// 3. 날짜비교로 예약가능한방을 ableRN 리스트로 추가 == 0 인방 
		for(int i=0; i<checkRN.size(); i++) {
			sdto.setRoomNumber(checkRN.get(i).toString());
			if(sdao.datecheck(sdto) == 0) {
				ableRN.add(checkRN.get(i).toString());
			}//if end
		}
		System.out.println("== 예약가능한 방" + ableRN);
		
		//fee 계산시작
		DecimalFormat fomatter = new DecimalFormat("###,###");
		long fee=0;
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date ckin=df.parse(sdto.getCk_in());
		Date ckout=df.parse(sdto.getCk_out());
		
		long diff=ckout.getTime() - ckin.getTime();
		long night = diff/(24*60*60*1000);
		
		Calendar cld=Calendar.getInstance();
		cld.setTime(ckin);
		int DOW = cld.get(Calendar.DAY_OF_WEEK);//요일
		
		List<FeeListDTO> feeList = new ArrayList<FeeListDTO>();
		for(int i =0; i<ableRN.size(); i++) {
			feeList.add(sdao.feeList(ableRN.get(i).toString()));
			int longcost = feeList.get(i).getLongcost();
			int weekcost = feeList.get(i).getWeekcost();
			int basecost = feeList.get(i).getBasecost();
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
						fee=(weekcost)+(basecost*(night-1));
					}else if(night==5) {
						fee=(weekcost*2)+(basecost*(night-2));
					}else {
						fee=basecost*night;
					}
					break;
					
				case 4:
					if(night==3) {
						fee=(weekcost)+(basecost*(night-1));
					}else if(night==4) {
						fee=(weekcost*2)+(basecost*(night-2));
					}else {
						fee=basecost*night;
					}
					break;
					
				case 5:
					if(night==2) {
						fee=(weekcost)+(basecost*(night-1));
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
						fee=(weekcost*2)+(basecost*(night-2));
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
			feeList.get(i).setFee(fee);
			feeList.get(i).setFeestr(fomatter.format(fee));
		}//fee 계산끝
		
		//조건에 맞는 검색 리스트 
		List<SearchlistDTO> list = new ArrayList<SearchlistDTO>();
		for(int i=0; i<ableRN.size(); i++) {
			list.add(sdao.ableList(ableRN.get(i).toString()));
			list.get(i).setFee(feeList.get(i).getFee());
			list.get(i).setFeestr(feeList.get(i).getFeestr());
		}

		//sort값에 따른 list정렬 시작
		if(sort.equals("feeDESC")) { // 가격 내림차순 ~0
			list.sort(new Comparator<SearchlistDTO>() {
				@Override
				public int compare(SearchlistDTO f1, SearchlistDTO f2) {
					long fee1 = f1.getFee();
					long fee2 = f2.getFee();
					if(fee1 == fee2) {
						return 0;
					}else if(fee2 > fee1){
						return 1;
					}else {
						return -1;
					}
				}
			});
			
		}else if(sort.equals("feeASC")){ // 가격 오름차순 0~
			list.sort(new Comparator<SearchlistDTO>() {
				@Override
				public int compare(SearchlistDTO f1, SearchlistDTO f2) {
					long fee1 = f1.getFee();
					long fee2 = f2.getFee();
					if(fee1 == fee2) {
						return 0;
					}else if(fee2 < fee1){
						return 1;
					}else {
						return -1;
					}
				}
			});		
		}else if(sort.equals("review")) { //리뷰 갯수 내림차순 갯수같을경우 평점 내림차순
			list.sort(new Comparator<SearchlistDTO>() {
				@Override
				public int compare(SearchlistDTO s1, SearchlistDTO s2) {
					int cnt1 = s1.getCnt();
					int cnt2 = s2.getCnt();
					double avg1 = s1.getStarAvg();
					double avg2 = s2.getStarAvg();
					if(cnt1 == cnt2) {
						if(avg1 == avg2) {
							return 0;
						}else if(avg1 > avg2 ) {
							return 1;
						}else {
							return -1;
						}
					}else if(cnt2 > cnt1){
						return 1;
					}else {
						return -1;
					}//if end
				}
			});

		}else if(sort.equals("nameDESC")){ //이름내림차순 ㅎ~1
			list.sort(new Comparator<SearchlistDTO>() {
				@Override
				public int compare(SearchlistDTO s1, SearchlistDTO s2) {
			        String name1 = s1.getRoomName();
			        String name2 = s2.getRoomName();
			        return name2.compareTo(name1);
				}
			});
	
		}else if(sort.equals("nameASC")){	//이름 오름차순 1~ㅎ
			list.sort(new Comparator<SearchlistDTO>() {
				@Override
				public int compare(SearchlistDTO s1, SearchlistDTO s2) {
			        String name1 = s1.getRoomName();
			        String name2 = s2.getRoomName();
			        return name1.compareTo(name2);
				}
			});
			
		}else { //sort에 쓰레기값들어왔을 경우 review순
			list.sort(new Comparator<SearchlistDTO>() {
				@Override
				public int compare(SearchlistDTO s1, SearchlistDTO s2) {
					int cnt1 = s1.getCnt();
					int cnt2 = s2.getCnt();
					double avg1 = s1.getStarAvg();
					double avg2 = s2.getStarAvg();
					if(cnt1 == cnt2) {
						if(avg1 == avg2) {
							return 0;
						}else if(avg1 > avg2 ) {
							return 1;
						}else {
							return -1;
						}
					}else if(cnt2 > cnt1){
						return 1;
					}else {
						return -1;
					}//if end
				}
			});
		}// 정렬끝
        

		//curPage값에 따른 페이징 시작
				
		int listCnt=ableRN.size()+1;
		  
		Pagination pagination = new Pagination(listCnt, curPage);
		int start=pagination.getStartIndex();
		int end = pagination.getPageSize()*curPage;
	 
        System.out.println(start);
        System.out.println(end);
		//5. cartfolder 가져오기 
		
		String uid = (String) session.getAttribute("uid");
		List<CartFolderDTO> cartFolders= new ArrayList<CartFolderDTO>();		
		cartFolders.addAll(cartFolderdao.getcartFolders(uid));
		
		System.out.println(cartFolders);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search/search");
		mav.addObject("list", list);
		mav.addObject("night", night);
		mav.addObject("cartFolders", cartFolders);
		mav.addObject("sort", sort);
		mav.addObject("pagination", pagination);
		mav.addObject("curPage",curPage);
		mav.addObject("start", start);
		mav.addObject("end", end-1);
		return mav;
	}// search() end
	
	@RequestMapping(value="/searchdetail.do")
	public ModelAndView searchdetail(String roomNumber) {
		ModelAndView mav = new ModelAndView();
		RoomHotelDTO dto = sdao.searchdetail(roomNumber);
		System.out.println(dto);
		mav.addObject("dto", dto);
		mav.setViewName("search/searchdetail");
		return mav;
	}
	
}
