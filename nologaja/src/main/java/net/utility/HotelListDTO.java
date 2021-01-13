package net.utility;

public class HotelListDTO {
	private String hotelName;
	private String hotelNumber;
	private String savefile;
	
	public HotelListDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
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

	@Override
	public String toString() {
		return "HotelListDTO [hotelName=" + hotelName + ", hotelNumber=" + hotelNumber + ", savefile=" + savefile + "]";
	}
	
	
}
