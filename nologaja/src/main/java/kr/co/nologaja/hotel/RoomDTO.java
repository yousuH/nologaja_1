package kr.co.nologaja.hotel;

public class RoomDTO {

	private String roomNumber;
	private String roomName;
	private String hotelNumber;
	private String roomImg;
	private String roomInform;
	private int maxGuest;
	private String conv;
	private int baseCost;
	private int weekCost;
	private int longCost;

	public RoomDTO() {

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

	public String getHotelNumber() {
		return hotelNumber;
	}

	public void setHotelNumber(String hotelNumber) {
		this.hotelNumber = hotelNumber;
	}

	public String getRoomImg() {
		return roomImg;
	}

	public void setRoomImg(String roomImg) {
		this.roomImg = roomImg;
	}

	public String getRoomInform() {
		return roomInform;
	}

	public void setRoomInform(String roomInform) {
		this.roomInform = roomInform;
	}

	public int getMaxGuest() {
		return maxGuest;
	}

	public void setMaxGuest(int maxGuest) {
		this.maxGuest = maxGuest;
	}

	public String getConv() {
		return conv;
	}

	public void setConv(String conv) {
		this.conv = conv;
	}

	public int getBaseCost() {
		return baseCost;
	}

	public void setBaseCost(int baseCost) {
		this.baseCost = baseCost;
	}

	public int getWeekCost() {
		return weekCost;
	}

	public void setWeekCost(int weekCost) {
		this.weekCost = weekCost;
	}

	public int getLongCost() {
		return longCost;
	}

	public void setLongCost(int longCost) {
		this.longCost = longCost;
	}

	@Override
	public String toString() {
		return "RoomDTO [roomNumber=" + roomNumber + ", roomName=" + roomName + ", hotelNumber=" + hotelNumber
				+ ", roomImg=" + roomImg + ", roomInform=" + roomInform + ", maxGuest=" + maxGuest + ", conv=" + conv
				+ ", baseCost=" + baseCost + ", weekCost=" + weekCost + ", longCost=" + longCost + "]";
	}
	
	

}// class end
