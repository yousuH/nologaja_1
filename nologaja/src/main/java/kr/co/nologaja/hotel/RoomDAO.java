package kr.co.nologaja.hotel;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class RoomDAO implements IRoomDAO {

	
	@Inject //<-사용자가 직접 만들지 않고 스프링에서 생성해서 주입을 시킴
	SqlSession sqlSession;
	
	
	@Override
	public void roomins(RoomDTO dto) {
		sqlSession.insert("hotel.roomins",dto);
		
	}
	
	
}//class end 
