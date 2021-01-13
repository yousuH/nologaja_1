package kr.co.nologaja.hotel;

import org.springframework.stereotype.Repository;

@Repository
public class HotelDTO {

	private String hotelNumber;
	private String wido;
	private String gyengdo;
	private String hotelName;
	private String cityCode;
	private String zipcode;
	private String addr1;
	private String addr2;
	private String bdgType;
	private String hotelInform;
	private String suid;

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

	public String getGyengdo() {
		return gyengdo;
	}

	public void setGyengdo(String gyengdo) {
		this.gyengdo = gyengdo;
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

	@Override
	public String toString() {
		return "HotelDTO [hotelNumber=" + hotelNumber + ", wido=" + wido + ", gyengdo=" + gyengdo + ", hotelName="
				+ hotelName + ", cityCode=" + cityCode + ", zipcode=" + zipcode + ", addr1=" + addr1 + ", addr2="
				+ addr2 + ", bdgType=" + bdgType + ", hotelInform=" + hotelInform + ", suid=" + suid + "]";
	}

}// class end
