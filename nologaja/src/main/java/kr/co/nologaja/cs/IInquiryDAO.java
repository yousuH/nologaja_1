package kr.co.nologaja.cs;

import java.util.List;

public interface IInquiryDAO {
	public void insert(InquiryDTO dto);
	public List<InquiryDTO> list();
	public InquiryDTO detail(int inquiryno);
	public void update(InquiryDTO dto);
	public void delete(int inquiryno);
	public InquiryDTO reply(int inquiryno);
	public void replyproc(InquiryDTO dto);
	public void host_insert(InquiryDTO dto);
}
