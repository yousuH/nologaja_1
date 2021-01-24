package kr.co.nologaja.cs;

import java.util.List;


public interface IFaqDAO {
	public void insert(FaqDTO dto);
	public List<FaqDTO> list(int currentPage);
	public FaqDTO detail(int faqno);
	public void update(FaqDTO dto);
	public void delete(int faqno);
	public int totalCount();
}
