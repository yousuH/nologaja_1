package kr.co.nologaja.cs;

import java.util.List;

public interface IInquiryDAO {
	public void insert(InquiryDTO dto);
	public List<InquiryDTO> list();
}
