package kr.co.nologaja.booking;

public class BkDTO {
	
	private String bk_num;
	private String ck_in;
	private String ck_out;
	private String hotelName;
	private String roomNumber;
	private String roonName;
	private int guests;
	private int fee;
	private String uid;
	private String request;
	private String pay;
	private String pay_st;
	
	public BkDTO() {}

	public String getBk_num() {
		return bk_num;
	}

	public void setBk_num(String bk_num) {
		this.bk_num = bk_num;
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

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public String getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}

	public String getRoonName() {
		return roonName;
	}

	public void setRoonName(String roonName) {
		this.roonName = roonName;
	}

	public int getGuests() {
		return guests;
	}

	public void setGuests(int guests) {
		this.guests = guests;
	}

	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public String getPay_st() {
		return pay_st;
	}

	public void setPay_st(String pay_st) {
		this.pay_st = pay_st;
	}

	@Override
	public String toString() {
		return "BkRoomDTO [bk_num=" + bk_num + ", ck_in=" + ck_in + ", ck_out=" + ck_out + ", hotelName=" + hotelName
				+ ", roomNumber=" + roomNumber + ", roonName=" + roonName + ", guests=" + guests + ", fee=" + fee
				+ ", uid=" + uid + ", request=" + request + ", pay=" + pay + ", pay_st=" + pay_st + "]";
	}

}
