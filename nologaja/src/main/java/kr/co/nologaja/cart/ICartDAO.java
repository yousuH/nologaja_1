package kr.co.nologaja.cart;

import java.util.List;

public interface ICartDAO {

	List<CartDTO> getcartitems(int ctFolder_num);
	
	

}
