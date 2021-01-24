package kr.co.nologaja.search;

public class FeeListDTO {
	private String roomNumber;
	private long fee;
	private String feestr;
	private int basecost;
	private int longcost;
	private int weekcost;
	
	public FeeListDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public String getFeestr() {
		return feestr;
	}
	public void setFeestr(String feestr) {
		this.feestr = feestr;
	}
	public String getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}
	public long getFee() {
		return fee;
	}
	public void setFee(long fee) {
		this.fee = fee;
	}
	public int getBasecost() {
		return basecost;
	}
	public void setBasecost(int basecost) {
		this.basecost = basecost;
	}
	public int getLongcost() {
		return longcost;
	}
	public void setLongcost(int longcost) {
		this.longcost = longcost;
	}
	public int getWeekcost() {
		return weekcost;
	}
	public void setWeekcost(int weekcost) {
		this.weekcost = weekcost;
	}

	@Override
	public String toString() {
		return "FeeListDTO [roomNumber=" + roomNumber + ", fee=" + fee + ", feestr=" + feestr + ", basecost=" + basecost
				+ ", longcost=" + longcost + ", weekcost=" + weekcost + "]";
	}
	
	
	
}
