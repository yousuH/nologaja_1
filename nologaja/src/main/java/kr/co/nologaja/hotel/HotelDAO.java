package kr.co.nologaja.hotel;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class HotelDAO implements IHotelDAO{
	
	@Inject //<-사용자가 직접 만들지 않고 스프링에서 생성해서 주입을 시킴
	SqlSession sqlSession;
	
	
	@Override
	public void hotelins(HotelDTO dto) {
		sqlSession.insert("hotel.hotelins",dto);
		
	}
	

}// class end 
