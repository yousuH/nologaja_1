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

	@Override
	public InquiryDTO detail(int inquiryno) {
		return sqlSession.selectOne("inquiry.detail", inquiryno);
	}

	@Override
	public void update(InquiryDTO dto) {
		sqlSession.update("inquiry.update", dto);
	}

	@Override
	public void delete(int inquiryno) {
		sqlSession.delete("inquiry.delete", inquiryno);
	}
	
	@Override
	public InquiryDTO reply(int inquiryno) {
		return sqlSession.selectOne("inquiry.reply", inquiryno);
	}
	
	@Override
	public void replyproc(InquiryDTO dto) {
		sqlSession.insert("inquiry.replyproc", dto);
		
	}
	
}
