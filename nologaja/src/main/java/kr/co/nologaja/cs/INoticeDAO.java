package kr.co.nologaja.cs;

import java.util.List;


public interface INoticeDAO {
	public void insert(NoticeDTO dto);
	public List<NoticeDTO> list(int currentPage);
	public NoticeDTO detail(int noticeno);
	public void update(NoticeDTO dto);
	public void delete(int noticeno);
	public int totalCount();
}
