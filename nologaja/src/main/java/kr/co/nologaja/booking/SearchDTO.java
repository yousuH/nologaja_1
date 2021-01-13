package kr.co.nologaja.booking;



public class SearchDTO {
	private int maxGuest;
	private String cityCode;
	private String ck_in;
	private String ck_out;
	private String roomNumber;
	
	public SearchDTO() {
		
	}

	public int getMaxGuest() {
		return maxGuest;
	}

	public void setMaxGuest(int maxGuest) {
		this.maxGuest = maxGuest;
	}

	public String getCityCode() {
		return cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
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

	public String getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}

	@Override
	public String toString() {
		return "SearchDTO [maxGuest=" + maxGuest + ", cityCode=" + cityCode + ", ck_in=" + ck_in + ", ck_out=" + ck_out
				+ ", roomNumber=" + roomNumber + "]";
	}



}
