package kr.co.nologaja.search;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class SearchDAO implements ISearchDAO {

	@Inject //<-사용자가 직접 만들지 않고 스프링에서 생성해서 주입을 시킴
	SqlSession sqlSession;

	// 검색조건에 맞는 roomNumber 찾아오기
	@Override
	public List<String> rNfind(SearchDTO sdto) {
		List<String> roomNuber = sqlSession.selectList("search.rnfind", sdto);
		return roomNuber;
	}
	
	@Override
	public int ablerN(String roomNumber) {
		int cnt = sqlSession.selectOne("search.ablerN", roomNumber);
		return cnt;
	}
	
	@Override
	public int datecheck(SearchDTO sdto) {
		int cnt = sqlSession.selectOne("search.datecheck", sdto);
		return cnt;
	}
	
	@Override
	public SearchlistDTO ableList(String roomNumber) {
		SearchlistDTO rdto=sqlSession.selectOne("search.ablelist", roomNumber);
		return rdto;
	}
	
	@Override
	public RoomHotelDTO searchdetail(String roomNumber) {
		RoomHotelDTO dto = sqlSession.selectOne("search.detail", roomNumber);
		return dto;
	}
	
	@Override
	public FeeListDTO feeList(String roomNumber) {
		// TODO Auto-generated method stub
		FeeListDTO fdto=sqlSession.selectOne("search.feelist", roomNumber);
		return fdto;
	}
	@Override
	public List<String> rNfindname(String cityCode, int maxGuest, String namesearch) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("code", cityCode);
		map.put("maxGuest", maxGuest);
		map.put("name", namesearch);
		List<String> roomNuber = sqlSession.selectList("search.rnfindname", map);
		return roomNuber;
	}

	
}//class end 
