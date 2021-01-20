package kr.co.nologaja.inquiryHost;

import java.util.Date;

public interface IInquiryHostDAO {
	public void inquiryHost_insert(InquiryHostDTO dto);
	public int inquiryHost_getinquiryno(InquiryHostDTO dto);
	public Date inquiryHost_getwdate(int inquiryno);
}
