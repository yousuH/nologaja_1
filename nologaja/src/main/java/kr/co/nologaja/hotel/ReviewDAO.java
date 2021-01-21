package kr.co.nologaja.hotel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO implements IReviewDAO{
   
   @Inject //<-사용자가 직접 만들지 않고 스프링에서 생성해서 주입을 시킴
   SqlSession sqlSession;

	@Override
	public List<ReviewDTO> rv_list(String roomNumber, int num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("roomNumber", roomNumber);
		map.put("num", num);
		List<ReviewDTO> list = sqlSession.selectList("hotel.rvlist", map);
		return list;
	}

	@Override
	public void rvins(ReviewDTO dto) {
		sqlSession.insert("hotel.rvins", dto);
	}
	
 
}// class end 