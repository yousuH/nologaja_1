package net.utility;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	
}
