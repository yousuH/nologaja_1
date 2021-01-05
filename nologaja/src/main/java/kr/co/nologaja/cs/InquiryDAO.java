package kr.co.nologaja.cs;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class InquiryDAO implements IInquiryDAO{
	@Inject 
	SqlSession sqlSession;
	
	@Override
	public void insert(InquiryDTO dto) {
		sqlSession.insert("inquiry.insert",dto);
		
	}
	
	@Override
	public List<InquiryDTO> list() {
		return sqlSession.selectList("inquiry.list");
	}
	
}
