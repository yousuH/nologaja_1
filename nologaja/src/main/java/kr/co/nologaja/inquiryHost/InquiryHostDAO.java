package kr.co.nologaja.inquiryHost;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import net.utility.HotelListDTO;

@Repository
public class InquiryHostDAO implements IInquiryHostDAO{
	@Inject //<-사용자가 직접 만들지 않고 스프링에서 생성해서 주입을 시킴
	SqlSession sqlSession;
	
	@Override
	public void inquiryHost_insert(InquiryHostDTO dto) {
		sqlSession.insert("inquiryHost.insert", dto);
	}
	
	@Override
	public int inquiryHost_getinquiryno(InquiryHostDTO dto) {
		return sqlSession.selectOne("inquiryHost.getinquiryno", dto);
	}
	
	@Override
	public Date inquiryHost_getwdate(int inquiryno) {
		return sqlSession.selectOne("inquiryHost.getwdate", inquiryno);
	}
	
	@Override
	public List<InquiryHostDTO> inquiryHost_list(String roomNumber) {
		return sqlSession.selectList("inquiryHost.list", roomNumber);
	}
	
	@Override
	public String inquiryHost_getSuid(String roomNumber) {
		String hotelNumber = roomNumber.substring(0,roomNumber.lastIndexOf("_"));
		return sqlSession.selectOne("inquiryHost.getSuid", hotelNumber);
	}
	
	@Override
	public void inquiryHost_reply(InquiryHostDTO dto) {
		sqlSession.insert("inquiryHost.reply", dto);
	}
	
	@Override
	public int inquiryHost_getinquiryno2(InquiryHostDTO dto) {
		return sqlSession.selectOne("inquiryHost.getinquiryno2", dto);
	}
	
	@Override
	public void inquiryHost_updateReply(int grpno) {
		sqlSession.update("inquiryHost.updateReply", grpno);
	}

	public List<InquiryHostDTO> inquiryhost_list(String suid) {
		return sqlSession.selectList("inquiryHost.inquiryhost_list", suid);
	}
	
	
	
}
