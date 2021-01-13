package kr.co.nologaja.cart;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.nologaja.member.BuyerDTO;

@Repository
public class CartFolderDAO implements ICartFolderDAO{

	@Inject //<-사용자가 직접 만들지 않고 스프링에서 생성해서 주입을 시킴
	SqlSession sqlSession;
	
	@Override
	public List<CartFolderDTO> getcartFolders(String uid) {
		List<CartFolderDTO> cartFolders = sqlSession.selectList("cart.getcartFolders", uid);
		return cartFolders;
	}

	
	@Override
	public void addcartfolder(CartFolderDTO dto) {
		sqlSession.insert("cart.addcartfolder", dto);
		
	}
	
	
	
	
}//class end



