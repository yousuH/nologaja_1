package kr.co.nologaja.cart;

import java.util.List;

public interface ICartFolderDAO {

	List<CartFolderDTO> getcartFolders(String uid);

	void addcartfolder(CartFolderDTO dto);
	
	
	

}
