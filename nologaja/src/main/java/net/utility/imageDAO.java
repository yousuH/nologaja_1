package net.utility;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.nologaja.hotel.RoomDTO;

@Repository
public class imageDAO {
	
	@Inject 
	SqlSession sqlSession;
	
	public void hotel_insert(HotelImageDTO dto) {
		sqlSession.insert("image.hotel_insert", dto);
		
	}
	
	public void room_insert(RoomImageDTO dto) {
		sqlSession.insert("image.room_insert", dto);
		
	}
	
	public List<RoomImageDTO> room_get_image(String roomNumber) {
		return sqlSession.selectList("image.room_get_image", roomNumber);
	}
}
