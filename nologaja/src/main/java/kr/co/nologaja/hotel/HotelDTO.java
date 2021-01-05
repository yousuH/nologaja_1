package kr.co.nologaja.hotel;

import java.util.Date;

public class HotelDTO {

	private String hotelNumber;
	private String wido;
	private String kyengdo;
	private String hotelName;
	private String cityCode;
	private String zipcode;
	private String addr1;
	private String addr2;
	private String bdgType;
	private String hotelIMG;
	private String hotelInform;
	private String id;
	
	public HotelDTO() {
		
	}

	public String getHotelNumber() {
		return hotelNumber;
	}

	public void setHotelNumber(String hotelNumber) {
		this.hotelNumber = hotelNumber;
	}

	public String getWido() {
		return wido;
	}

	public void setWido(String wido) {
		this.wido = wido;
	}

	public String getKyengdo() {
		return kyengdo;
	}

	public void setKyengdo(String kyengdo) {
		this.kyengdo = kyengdo;
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public String getCityCode() {
		return cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
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

	public String getHotelIMG() {
		return hotelIMG;
	}

	public void setHotelIMG(String hotelIMG) {
		this.hotelIMG = hotelIMG;
	}

	public String getHotelInform() {
		return hotelInform;
	}

	public void setHotelInform(String hotelInform) {
		this.hotelInform = hotelInform;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "HotelDTO [hotelNumber=" + hotelNumber + ", wido=" + wido + ", kyengdo=" + kyengdo + ", hotelName="
				+ hotelName + ", cityCode=" + cityCode + ", zipcode=" + zipcode + ", addr1=" + addr1 + ", addr2="
				+ addr2 + ", bdgType=" + bdgType + ", hotelIMG=" + hotelIMG + ", hotelInform=" + hotelInform + ", id="
				+ id + "]";
	}
	
	
	
}//class end 
