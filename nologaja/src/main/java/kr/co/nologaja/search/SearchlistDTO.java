package kr.co.nologaja.search;

public class SearchlistDTO {

	private String roomNumber;
	private String roomName;
	private double starAvg;
	private int cnt;
	private String addr1;
	private int basecost;
	private int weekcost;
	private int longcost;
	private String hotelNumber;
	private String fee;
	private String savefile;
	private String hotelName;

	public SearchlistDTO() {

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

	public int getBasecost() {
		return basecost;
	}

	public void setBasecost(int basecost) {
		this.basecost = basecost;
	}

	public int getWeekcost() {
		return weekcost;
	}

	public void setWeekcost(int weekcost) {
		this.weekcost = weekcost;
	}

	public int getLongcost() {
		return longcost;
	}

	public void setLongcost(int longcost) {
		this.longcost = longcost;
	}

	public String getHotelNumber() {
		return hotelNumber;
	}

	public void setHotelNumber(String hotelNumber) {
		this.hotelNumber = hotelNumber;
	}

	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
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
				+ cnt + ", addr1=" + addr1 + ", basecost=" + basecost + ", weekcost=" + weekcost + ", longcost="
				+ longcost + ", hotelNumber=" + hotelNumber + ", fee=" + fee + ", savefile=" + savefile + ", hotelName="
				+ hotelName + "]";
	}



	

}// class end
