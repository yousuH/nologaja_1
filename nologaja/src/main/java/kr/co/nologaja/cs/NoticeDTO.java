package kr.co.nologaja.cs;

import java.util.Date;

public class NoticeDTO {
	private int noticeno;
	private Date wdate;
	private String title;
	private String content;
	private int totalCount;
	private int page;
	private int countPage;
	private int countList;
	private int totalPage;
	private int startPage;
	private int endPage;
	
	
	public NoticeDTO() {
		// TODO Auto-generated constructor stub
	}


	public int getNoticeno() {
		return noticeno;
	}


	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}


	public Date getWdate() {
		return wdate;
	}


	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getTotalCount() {
		return totalCount;
	}


	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}


	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
	}


	public int getCountPage() {
		return countPage;
	}


	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}


	public int getCountList() {
		return countList;
	}


	public void setCountList(int countList) {
		this.countList = countList;
	}


	public int getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	@Override
	public String toString() {
		return "NoticeDTO [noticeno=" + noticeno + ", wdate=" + wdate + ", title=" + title + ", content=" + content
				+ ", totalCount=" + totalCount + ", page=" + page + ", countPage=" + countPage + ", countList="
				+ countList + ", totalPage=" + totalPage + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}

	
	
	
	
}
