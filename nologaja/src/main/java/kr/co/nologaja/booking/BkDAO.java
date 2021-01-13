package kr.co.nologaja.booking;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BkDAO implements IBkDAO {

	@Inject //<-사용자가 직접 만들지 않고 스프링에서 생성해서 주입을 시킴
	SqlSession sqlSession;
	
	@Override
	public List<BkDTO> list() {
		return sqlSession.selectList("booking.bklist");
	}

	@Override
	public void insert(BkDTO dto) {
		sqlSession.insert("booking.bkinsert", dto);
	}

	@Override
	public BkDTO detail(String bk_num) {
		return sqlSession.selectOne("booking.bkdetail", bk_num);
	}
	
	@Override
	public List<BkDTO> bklist(String bk_num) {
		return sqlSession.selectList("booking.bklist");
	}

	@Override
	public void delete(String bk_num) {
		sqlSession.delete("member.bkdelete", bk_num);
	}

	@Override
	public void update(BkDTO dto) {
		sqlSession.update("member.bkupdate", dto);
	}
	
}
