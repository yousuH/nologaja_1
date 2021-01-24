package kr.co.nologaja.search;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpResponse;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.nologaja.cart.CartFolderDAO;
import kr.co.nologaja.cart.CartFolderDTO;

import kr.co.nologaja.cs.InquiryDAO;
import kr.co.nologaja.cs.InquiryDTO;
import kr.co.nologaja.inquiryHost.InquiryHostDAO;
import kr.co.nologaja.inquiryHost.InquiryHostDTO;

import kr.co.nologaja.hotel.ReviewDAO;
import kr.co.nologaja.hotel.ReviewDTO;

import net.utility.Pagination;
import net.utility.RoomImageDTO;
import net.utility.imageDAO;

@Controller
public class SearchCont {

	private static final int InquiryHostDTO = 0;
	
	@Inject
	imageDAO imdao;
	
	@Inject
	SearchDAO sdao;

	@Inject
	CartFolderDAO cartFolderdao;

	@Inject
	InquiryDAO idao;

	@Inject
	InquiryDTO idto;

	@Inject
	InquiryHostDAO ihDAO;

	@Inject
	InquiryHostDTO ihDTO;

	@Inject
	ReviewDAO rvdao;

	public SearchCont() {
		System.out.println("==SearchCont객체생성==");
	}

	// 검색
	@RequestMapping(value = "/search.do")
	public ModelAndView search(SearchDTO sdto, HttpSession session, @RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "review") String sort, @RequestParam(defaultValue = "") String namesearch,
			@RequestParam(defaultValue = "0") int checkprice) throws ParseException {

		if (sdto.getCityCode() == null) {
			sdto.setCityCode("");
		}

		List<String> rNlist = new ArrayList<String>();
		if (!(namesearch.equals(""))) {
			rNlist = sdao.rNfindname(sdto.getCityCode(), sdto.getMaxGuest(), namesearch);
			if (rNlist.isEmpty()) {
				ModelAndView mav = new ModelAndView();
				mav.setViewName("search/searchFail");
				mav.addObject("sdto", sdto);
				return mav;
			}
		} else {
			// 1. cityCode, maxGuest -> roomNumber list로
			rNlist = sdao.rNfind(sdto);
		}

		// 2_1. booktable에 없는 roomnumber if == 0 -> 바로 예약 가능한 방으로 분류
		// 2_2. booktable에 있는 roomnumber else -> 날짜 비교를 위한 방으루 분류
		List<String> ableRN = new ArrayList<String>(); // 바로예약가능한방
		List<String> checkRN = new ArrayList<String>(); // 날짜 비교를 위한방
		for (int i = 0; i < rNlist.size(); i++) {
			if (sdao.ablerN(rNlist.get(i).toString()) == 0) {
				ableRN.add(rNlist.get(i).toString());
			} else {
				checkRN.add(rNlist.get(i).toString());
			} // if end
		} // for end

		// 3. 날짜비교로 예약가능한방을 ableRN 리스트로 추가 == 0 인방
		for (int i = 0; i < checkRN.size(); i++) {
			sdto.setRoomNumber(checkRN.get(i).toString());
			if (sdao.datecheck(sdto) == 0) {
				ableRN.add(checkRN.get(i).toString());
			} // if end
		}
		System.out.println("== 예약가능한 방" + ableRN);

		// fee 계산시작
		DecimalFormat fomatter = new DecimalFormat("###,###");
		long fee = 0;
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date ckin = df.parse(sdto.getCk_in());
		Date ckout = df.parse(sdto.getCk_out());

		long diff = ckout.getTime() - ckin.getTime();
		long night = diff / (24 * 60 * 60 * 1000);

		Calendar cld = Calendar.getInstance();
		cld.setTime(ckin);
		int DOW = cld.get(Calendar.DAY_OF_WEEK);// 요일

		List<FeeListDTO> feeList = new ArrayList<FeeListDTO>();
		for (int i = 0; i < ableRN.size(); i++) {
			feeList.add(sdao.feeList(ableRN.get(i).toString()));
			int longcost = feeList.get(i).getLongcost();
			int weekcost = feeList.get(i).getWeekcost();
			int basecost = feeList.get(i).getBasecost();
			if (night >= 7) {
				fee = longcost * night;
			} else {
				switch (DOW) {
				case 1:
					if (night == 6) {
						fee = (weekcost) + (basecost * (night - 1));
					} else {
						fee = basecost * night;
					} // if end
					break;

				case 2:
					if (night == 5) {
						fee = (weekcost) + (basecost * (night - 1));
					} else if (night == 6) {
						fee = (weekcost * 2) + (basecost * (night - 2));
					} else {
						fee = basecost * night;
					}
					break;

				case 3:
					if (night == 4) {
						fee = (weekcost) + (basecost * (night - 1));
					} else if (night == 5) {
						fee = (weekcost * 2) + (basecost * (night - 2));
					} else {
						fee = basecost * night;
					}
					break;

				case 4:
					if (night == 3) {
						fee = (weekcost) + (basecost * (night - 1));
					} else if (night == 4) {
						fee = (weekcost * 2) + (basecost * (night - 2));
					} else {
						fee = basecost * night;
					}
					break;

				case 5:
					if (night == 2) {
						fee = (weekcost) + (basecost * (night - 1));
					} else if (night == 3) {
						fee = (weekcost * 2) + (basecost * (night - 2));
					} else {
						fee = basecost * night;
					}
					break;

				case 6:
					if (night == 1) {
						fee = weekcost;
					} else if (night == 2) {
						fee = (weekcost * 2);
					} else {
						fee = (weekcost * 2) + (basecost * (night - 2));
					}
					break;

				case 7:
					if (night == 1) {
						fee = (weekcost);
					} else {
						fee = (weekcost) + (basecost * (night - 1));
					}
					break;
				}// switch end
			} // if end
			feeList.get(i).setFee(fee);
			feeList.get(i).setFeestr(fomatter.format(fee));
		} // fee 계산끝

		// 조건에 맞는 검색 리스트
		List<SearchlistDTO> list = new ArrayList<SearchlistDTO>();
		for (int i = 0; i < ableRN.size(); i++) {
			list.add(sdao.ableList(ableRN.get(i).toString()));
			list.get(i).setFee(feeList.get(i).getFee());
			list.get(i).setFeestr(feeList.get(i).getFeestr());
		}
		// 가격범위에 따른 데이터 구분
		if (checkprice != 0) {
			if (checkprice == 10) {
				for (int i = 0; i < list.size(); i++) {
					if (list.get(i).getFee() >= 100000) {
						list.remove(i);
						i--;
					}
				}
			} else if (checkprice == 15) {
				for (int i = 0; i < list.size(); i++) {
					if (list.get(i).getFee() < 100000 || list.get(i).getFee() >= 150000) {
						list.remove(i);
						i--;
					}
				}
			} else if (checkprice == 20) {
				for (int i = 0; i < list.size(); i++) {
					if (list.get(i).getFee() < 150000 || list.get(i).getFee() >= 200000) {
						list.remove(i);
						i--;
					}
				}
			} else if (checkprice == 25) {
				for (int i = 0; i < list.size(); i++) {
					if (list.get(i).getFee() < 200000 || list.get(i).getFee() >= 250000) {
						list.remove(i);
						i--;
					}
				}
			} else if (checkprice == 99) {
				for (int i = 0; i < list.size(); i++) {
					if (list.get(i).getFee() < 250000) {
						list.remove(i);
						i--;
					}
				}
			}
		}
		// sort값에 따른 list정렬 시작
		if (sort.equals("feeDESC")) { // 가격 내림차순 ~0
			list.sort(new Comparator<SearchlistDTO>() {
				@Override
				public int compare(SearchlistDTO f1, SearchlistDTO f2) {
					long fee1 = f1.getFee();
					long fee2 = f2.getFee();
					if (fee1 == fee2) {
						return 0;
					} else if (fee2 > fee1) {
						return 1;
					} else {
						return -1;
					}
				}
			});

		} else if (sort.equals("feeASC")) { // 가격 오름차순 0~
			list.sort(new Comparator<SearchlistDTO>() {
				@Override
				public int compare(SearchlistDTO f1, SearchlistDTO f2) {
					long fee1 = f1.getFee();
					long fee2 = f2.getFee();
					if (fee1 == fee2) {
						return 0;
					} else if (fee2 < fee1) {
						return 1;
					} else {
						return -1;
					}
				}
			});
		} else if (sort.equals("review")) { // 리뷰 갯수 내림차순 갯수같을경우 평점 내림차순
			list.sort(new Comparator<SearchlistDTO>() {
				@Override
				public int compare(SearchlistDTO s1, SearchlistDTO s2) {
					int cnt1 = s1.getCnt();
					int cnt2 = s2.getCnt();
					double avg1 = s1.getStarAvg();
					double avg2 = s2.getStarAvg();
					if (cnt1 == cnt2) {
						if (avg1 == avg2) {
							return 0;
						} else if (avg1 > avg2) {
							return 1;
						} else {
							return -1;
						}
					} else if (cnt2 > cnt1) {
						return 1;
					} else {
						return -1;
					} // if end
				}
			});

		} else if (sort.equals("nameDESC")) { // 이름내림차순 ㅎ~1
			list.sort(new Comparator<SearchlistDTO>() {
				@Override
				public int compare(SearchlistDTO s1, SearchlistDTO s2) {
					String name1 = s1.getRoomName();
					String name2 = s2.getRoomName();
					return name2.compareTo(name1);
				}
			});

		} else if (sort.equals("nameASC")) { // 이름 오름차순 1~ㅎ
			list.sort(new Comparator<SearchlistDTO>() {
				@Override
				public int compare(SearchlistDTO s1, SearchlistDTO s2) {
					String name1 = s1.getRoomName();
					String name2 = s2.getRoomName();
					return name1.compareTo(name2);
				}
			});

		} else { // sort에 쓰레기값들어왔을 경우 review순
			list.sort(new Comparator<SearchlistDTO>() {
				@Override
				public int compare(SearchlistDTO s1, SearchlistDTO s2) {
					int cnt1 = s1.getCnt();
					int cnt2 = s2.getCnt();
					double avg1 = s1.getStarAvg();
					double avg2 = s2.getStarAvg();
					if (cnt1 == cnt2) {
						if (avg1 == avg2) {
							return 0;
						} else if (avg1 > avg2) {
							return 1;
						} else {
							return -1;
						}
					} else if (cnt2 > cnt1) {
						return 1;
					} else {
						return -1;
					} // if end
				}
			});
		} // 정렬끝

		// curPage값에 따른 페이징 시작

		int listCnt = list.size() + 1;

		Pagination pagination = new Pagination(listCnt, curPage);
		int start = pagination.getStartIndex();
		int end = pagination.getPageSize() * curPage;

		System.out.println(start);
		System.out.println(end);
		// 5. cartfolder 가져오기

		String uid = (String) session.getAttribute("uid");
		List<CartFolderDTO> cartFolders = new ArrayList<CartFolderDTO>();
		cartFolders.addAll(cartFolderdao.getcartFolders(uid));

		System.out.println(cartFolders);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search/search");
		mav.addObject("list", list);
		mav.addObject("night", night);
		mav.addObject("cartFolders", cartFolders);
		mav.addObject("sort", sort);
		mav.addObject("checkprice", checkprice);
		mav.addObject("pagination", pagination);
		mav.addObject("curPage", curPage);
		mav.addObject("start", start);
		mav.addObject("end", end - 1);
		return mav;
	}// search() end

	@RequestMapping(value = "/searchdetail.do")
	public ModelAndView searchdetail(String roomNumber, @RequestParam(defaultValue = "1") int num) {
		ModelAndView mav = new ModelAndView();
		int endnum = (5 * num);
		num = num + 1;
		RoomHotelDTO dto = sdao.searchdetail(roomNumber);
		
		//방 이미지 리스트
		List<RoomImageDTO> roomImagelist=imdao.room_get_image(roomNumber);
		mav.addObject("roomimage", roomImagelist);
		
		String suid = ihDAO.inquiryHost_getSuid(roomNumber);
		List<InquiryHostDTO> list1 = ihDAO.inquiryHost_list(roomNumber);

		mav.addObject("dto", dto);
		for (int i = 0; i < list1.size(); i++) {
			Date wdate = list1.get(i).getWdate();
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			String Swdate = transFormat.format(wdate);
			Random random = new Random();
			list1.get(i).setSwdate(Swdate);
			list1.get(i).setRandom(random.nextInt(1000));
			if (list1.get(i).getDepth().equals("1")) {
				
				String temp = list1.get(i).getContent();
				temp = "Re : " + temp;
				list1.get(i).setContent(temp);
			}
		}

		System.out.println(list1);

		mav.addObject("list1", list1);
		mav.addObject("suid", suid);
		System.out.println(list1);

		List<ReviewDTO> list = rvdao.rv_list(roomNumber, endnum);
		boolean size = true;
		if (list.size() >= endnum) {
			size = false;
		}
		mav.addObject("list", list);
		mav.addObject("dto", dto);
		mav.addObject("size", size);
		mav.addObject("num", num);

		mav.setViewName("search/searchdetail");
		return mav;
	}

	@RequestMapping(value = "/json.do")
	@ResponseBody
	public ModelAndView jsonTest(@RequestParam String roomNumber, @RequestParam int num) {
		int endnum = (num + 1) * 5;
		RoomHotelDTO dto = sdao.searchdetail(roomNumber);
		List<ReviewDTO> list = rvdao.rv_list(roomNumber, endnum);
		ModelAndView mav = new ModelAndView();
		mav.addObject("num", num);
		mav.addObject("list", list);
		mav.addObject("dto", dto);
		return mav;
	}

}
