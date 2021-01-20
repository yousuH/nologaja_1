package kr.co.nologaja.inquiryHost;

import java.util.Date;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
}
