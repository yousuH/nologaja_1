package kr.co.nologaja.booking;

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
		List<String> roomNuber = sqlSession.selectList("booking.rnfind", sdto);
		return roomNuber;
	}
	
	@Override
	public int ablerN(String roomNumber) {
		int cnt = sqlSession.selectOne("booking.ablerN", roomNumber);
		return cnt;
	}
	
	@Override
	public int datecheck(SearchDTO sdto) {
		int cnt = sqlSession.selectOne("booking.datecheck", sdto);
		return cnt;
	}
	
	@Override
	public bkRoomDTO ableList(String roomNumber) {
		bkRoomDTO rdto=sqlSession.selectOne("booking.ablelist", roomNumber);
		return rdto;
	}
	
}//class end 
