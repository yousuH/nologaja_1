package kr.co.nologaja.search;

public class SearchlistDTO {

	private String roomNumber;
	private String roomName;
	private double starAvg = 0;
	private int cnt;
	private String addr1;
	private String hotelNumber;
	private String savefile;
	private String hotelName;
	private long fee;
	private String feestr;

	public SearchlistDTO() {

	}
	
	public String getFeestr() {
		return feestr;
	}

	public void setFeestr(String feestr) {
		this.feestr = feestr;
	}

	public long getFee() {
		return fee;
	}

	public void setFee(long fee) {
		this.fee = fee;
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

	public double getStarAvg() {
		return starAvg;
	}

	public void setStarAvg(double starAvg) {
		this.starAvg = starAvg;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getHotelNumber() {
		return hotelNumber;
	}

	public void setHotelNumber(String hotelNumber) {
		this.hotelNumber = hotelNumber;
	}


	public String getSavefile() {
		return savefile;
	}

	public void setSavefile(String savefile) {
		this.savefile = savefile;
	}
	

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	@Override
	public String toString() {
		return "SearchlistDTO [roomNumber=" + roomNumber + ", roomName=" + roomName + ", starAvg=" + starAvg + ", cnt="
				+ cnt + ", addr1=" + addr1 + ", hotelNumber=" + hotelNumber + ", savefile=" + savefile + ", hotelName="
				+ hotelName + ", fee=" + fee + ", feestr=" + feestr + "]";
	}



	

}// class end
