package kr.co.nologaja.hotel;

import java.util.List;

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
	
	@Override
	public int roomnumFind(String roomNumber) {
		int cnt = sqlSession.selectOne("hotel.roomnumFind", roomNumber);
		return cnt;
	}

	@Override
	public List<RoomDTO> room_list(String hotelNumber) {
		return sqlSession.selectList("hotel.room_list", hotelNumber);
	}

	@Override
	public RoomDTO room_detail(String roomNumber) {
		return sqlSession.selectOne("hotel.room_detail", roomNumber);
	}
	
}//class end 
