package kr.co.nologaja.cs;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDAO implements IFaqDAO {
	
	@Inject 
	SqlSession sqlSession;
	
	@Override
	public void insert(FaqDTO dto) {
		sqlSession.insert("faq.insert",dto);
		
	}
	
	@Override
	public List<FaqDTO> list() {
		return sqlSession.selectList("faq.list");
	}

	@Override
	public FaqDTO detail(int faqno) {
		return sqlSession.selectOne("faq.detail", faqno);
	}

	@Override
	public void update(FaqDTO dto) {
		sqlSession.update("faq.update",dto);
	}
	
	@Override
	public void delete(int faqno) {
		sqlSession.delete("faq.delete", faqno);
		
	}
}
