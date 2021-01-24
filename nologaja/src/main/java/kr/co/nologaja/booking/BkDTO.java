package kr.co.nologaja.booking;

public class BkDTO {
	
	private String bk_num;
	private String ck_in;
	private String ck_out;
	private int night;
	private String hotelName;
	private String roomNumber;
	private String roomName;
	private int maxGuest;
	private String fee;
	private String uid;
	private String request;
	private String pay;
	private String pay_st;
	
	public BkDTO() {}

	public String getBk_num() {
		return bk_num;
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

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public int getMaxGuest() {
		return maxGuest;
	}

	public void setMaxGuest(int maxGuest) {
		this.maxGuest = maxGuest;
	}

	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
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

	public void setBk_num(String bk_num) {
		this.bk_num = bk_num;
	}

	@Override
	public String toString() {
		return "BkDTO [bk_num=" + bk_num + ", ck_in=" + ck_in + ", ck_out=" + ck_out + ", night=" + night
				+ ", hotelName=" + hotelName + ", roomNumber=" + roomNumber + ", roomName=" + roomName + ", maxGuest="
				+ maxGuest + ", fee=" + fee + ", uid=" + uid + ", request=" + request + ", pay=" + pay + ", pay_st="
				+ pay_st + "]";
	}
	
}
