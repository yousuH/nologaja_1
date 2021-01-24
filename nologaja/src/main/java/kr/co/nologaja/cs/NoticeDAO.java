package kr.co.nologaja.cs;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO implements INoticeDAO{
	@Inject //<-사용자가 직접 만들지 않고 스프링에서 생성해서 주입을 시킴
	SqlSession sqlSession;
	
	@Override
	public void insert(NoticeDTO dto) {
		sqlSession.insert("notice.insert", dto);
		
	}
	
	@Override
	public List<NoticeDTO> list(int currentPage) {
		return sqlSession.selectList("notice.list", currentPage);
	}
	
	@Override
	public void delete(int noticeno) {
		sqlSession.delete("notice.delete", noticeno);
		
	}
	
	@Override
	public NoticeDTO detail(int noticeno) {
		return sqlSession.selectOne("notice.detail", noticeno);
	}
	
	@Override
	public void update(NoticeDTO dto) {
		sqlSession.update("notice.update", dto);
		
	}
	
	@Override
	public int totalCount() {
		return sqlSession.selectOne("notice.totalCount");
	}
}
