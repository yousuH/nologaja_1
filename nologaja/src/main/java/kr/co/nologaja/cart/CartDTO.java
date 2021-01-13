package kr.co.nologaja.cart;

public class CartDTO {
	
	private int ct_num;
	private String uid;
	private String roomNumber;
	private int guests;
	private String ck_in;
	private String ck_out;
	private int night;
	private int totalFee;
	private int ctFolder_num;
	private String ctFolder_name;
	
	
	public CartDTO() {
		
	}


	public int getCt_num() {
		return ct_num;
	}


	public void setCt_num(int ct_num) {
		this.ct_num = ct_num;
	}


	public String getUid() {
		return uid;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}


	public String getRoomNumber() {
		return roomNumber;
	}


	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}


	public int getGuests() {
		return guests;
	}


	public void setGuests(int guests) {
		this.guests = guests;
	}


	public String getCk_in() {
		return ck_in;
	}


	public void setCk_in(String ck_in) {
		this.ck_in = ck_in;
	}


	public String getCk_out() {
		return ck_out;
	}


	public void setCk_out(String ck_out) {
		this.ck_out = ck_out;
	}


	public int getNight() {
		return night;
	}


	public void setNight(int night) {
		this.night = night;
	}


	public int getTotalFee() {
		return totalFee;
	}


	public void setTotalFee(int totalFee) {
		this.totalFee = totalFee;
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


	@Override
	public String toString() {
		return "CartDTO [ct_num=" + ct_num + ", uid=" + uid + ", roomNumber=" + roomNumber + ", guests=" + guests
				+ ", ck_in=" + ck_in + ", ck_out=" + ck_out + ", night=" + night + ", totalFee=" + totalFee
				+ ", ctFolder_num=" + ctFolder_num + ", ctFolder_name=" + ctFolder_name + "]";
	}
	
	
	
	
	

	
	
	
	
	
}//class end 
