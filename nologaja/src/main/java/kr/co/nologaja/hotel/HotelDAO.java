package kr.co.nologaja.hotel;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import net.utility.HotelListDTO;

@Repository
public class HotelDAO implements IHotelDAO{
	
	@Inject //<-사용자가 직접 만들지 않고 스프링에서 생성해서 주입을 시킴
	SqlSession sqlSession;
	
	@Override
	public void hotelins(HotelDTO dto) {
		sqlSession.insert("hotel.hotelins", dto);
	}
	
	@Override
	public int hotelnumFind(String hotelNumber) {
		int cnt = sqlSession.selectOne("hotel.hotelnumFind", hotelNumber);
		return cnt;
		
	}

	@Override
	public List<HotelListDTO> hotel_list(String suid) {
		return sqlSession.selectList("hotel.hotel_list", suid);
	}
	
	@Override
	public HotelDTO hotel_detail(String hotelNumber) {
		return sqlSession.selectOne("hotel.hotel_detail", hotelNumber);
	}
}// class end 
