package kr.co.nologaja.search;

public class RoomHotelDTO {

	private String roomNumber;
	private String roomName;
	private String hotelNumber;
	private String hotelName;
	private String roomInform;
	private int maxGuest;
	private String zipcode;
	private String wido;
	private String gyengdo;
	private String addr1;
	private String addr2;
	private String bdgType;
	private String hotelInform;
	private String suid;
	private String rsavefile;
	private String hsavefile;
	private String conv;
	
	public RoomHotelDTO() {
		// TODO Auto-generated constructor stub
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
	public String getHotelNumber() {
		return hotelNumber;
	}
	public void setHotelNumber(String hotelNumber) {
		this.hotelNumber = hotelNumber;
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
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getWido() {
		return wido;
	}
	public void setWido(String wido) {
		this.wido = wido;
	}
	public String getGyengdo() {
		return gyengdo;
	}
	public void setGyengdo(String gyengdo) {
		this.gyengdo = gyengdo;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getBdgType() {
		return bdgType;
	}
	public void setBdgType(String bdgType) {
		this.bdgType = bdgType;
	}
	public String getHotelInform() {
		return hotelInform;
	}
	public void setHotelInform(String hotelInform) {
		this.hotelInform = hotelInform;
	}
	public String getSuid() {
		return suid;
	}
	public void setSuid(String suid) {
		this.suid = suid;
	}
	public String getRsavefile() {
		return rsavefile;
	}
	public void setRsavefile(String rsavefile) {
		this.rsavefile = rsavefile;
	}
	public String getHsavefile() {
		return hsavefile;
	}
	public void setHsavefile(String hsavefile) {
		this.hsavefile = hsavefile;
	}
	
	public String getConv() {
		return conv;
	}
	public void setConv(String conv) {
		this.conv = conv;
	}
	@Override
	public String toString() {
		return "RoomHotelDTO [roomNumber=" + roomNumber + ", roomName=" + roomName + ", hotelNumber=" + hotelNumber
				+ ", roomInform=" + roomInform + ", maxGuest=" + maxGuest + ", zipcode=" + zipcode + ", wido=" + wido
				+ ", gyengdo=" + gyengdo + ", addr1=" + addr1 + ", addr2=" + addr2 + ", bdgType=" + bdgType
				+ ", hotelInform=" + hotelInform + ", suid=" + suid + ", rsavefile=" + rsavefile + ", hsavefile="
				+ hsavefile + ", conv=" + conv + "]";
	}

}
