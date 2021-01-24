package kr.co.nologaja.inquiryHost;

import java.util.Date;
import java.util.List;

import kr.co.nologaja.hotel.HotelDTO;

public interface IInquiryHostDAO {
	public void inquiryHost_insert(InquiryHostDTO dto);
	public int inquiryHost_getinquiryno(InquiryHostDTO dto);
	public Date inquiryHost_getwdate(int inquiryno);
	public List<InquiryHostDTO> inquiryHost_list(String roomNumber);
	public String inquiryHost_getSuid(String roomNumber);
	public void inquiryHost_reply(InquiryHostDTO dto);
	public int inquiryHost_getinquiryno2(InquiryHostDTO dto);
	public void inquiryHost_updateReply(int inquiryno);
	public List<HotelDTO> inquiryHost_hotelNumber(String suid);
	public List<InquiryHostDTO> inquiryHost_getInquiry(String hotelNumber);
	public List<InquiryHostDTO> inquiryhost_list(String suid);
	public List<InquiryHostDTO> inquiryhost_list2(String uid);
	public String getRoomName(String roomNumber);
	public List<InquiryHostDTO> getIHset(int grpno);
}
