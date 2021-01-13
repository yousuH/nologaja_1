package kr.co.nologaja.cart;

public class CartFolderDTO {
	
	private int ctFolder_num;
	private String ctFolder_name;
	private String uid;
	
	
	public CartFolderDTO() {
		
	}


	public int getCtFolder_num() {
		return ctFolder_num;
	}


	public void setCtFolder_num(int ctFolder_num) {
		this.ctFolder_num = ctFolder_num;
	}


	public String getCtFolder_name() {
		return ctFolder_name;
	}


	public void setCtFolder_name(String ctFolder_name) {
		this.ctFolder_name = ctFolder_name;
	}


	public String getUid() {
		return uid;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}


	@Override
	public String toString() {
		return "CartFolderDTO [ctFolder_num=" + ctFolder_num + ", ctFolder_name=" + ctFolder_name + ", uid=" + uid
				+ "]";
	}
	
	
	
	

	
	
	
	
	
}//class end 
