package kr.co.nologaja.booking;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BkDAO implements IBkDAO {

	@Inject //<-사용자가 직접 만들지 않고 스프링에서 생성해서 주입을 시킴
	SqlSession sqlSession;
	
	@Override
	public List<BkDTO> list(String uid) {
		return sqlSession.selectList("booking.bklist", uid);
	}

	@Override
	public void insert(BkDTO dto) {
		sqlSession.insert("booking.bkinsert", dto);
	}

	@Override
	public BkDTO detail(String bk_num, String uid) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("bk_num", bk_num);
		map.put("uid", uid);
		return sqlSession.selectOne("booking.bkdetail", map);
	}
	
	@Override
	public List<BkDTO> bklist(String bk_num) {
		return sqlSession.selectList("booking.bklist");
	}

	@Override
	public void update(BkDTO dto) {
		sqlSession.update("booking.bkupdate", dto);
	}
	
	@Override
	public List<BkDTO> s_list(String suid) {
		return sqlSession.selectList("booking.s_bklist", suid);
	}
	
	@Override
	public BkDTO s_detail(String bk_num, String suid) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("bk_num", bk_num);
		map.put("suid", suid);
		return sqlSession.selectOne("booking.s_bkdetail", map);
	}
	
}
