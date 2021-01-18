package kr.co.nologaja.cart;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class CartDAO implements ICartDAO{

	@Inject //<-사용자가 직접 만들지 않고 스프링에서 생성해서 주입을 시킴
	SqlSession sqlSession;
	
	
	
	@Override
	public List<CartDTO> getcartitems(int ctFolder_num) {
		List<CartDTO> cartitems = sqlSession.selectList("cart.getcartitems", ctFolder_num);
		return cartitems;
	}
	
	
	
	@Override
	public void cartinsert(CartDTO dto) {
		sqlSession.insert("cart.cartinsert", dto);
		
	}



	public void cartdelete(int ct_num) {
		sqlSession.delete("cart.cartdelete", ct_num);
		
	}
	

	public void cartdeleteall(int ctFolder_num) {
		sqlSession.delete("cart.cartdeleteall", ctFolder_num);
		
	}
	
	
	
	
	
}//class end



