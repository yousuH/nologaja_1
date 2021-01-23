package kr.co.nologaja.cs;

import java.util.Date;

public class InquiryDTO {
	private int inquiryno;
	private String id;
	private String title;
	private String content;
	private Date wdate;
	private int grpno;
	private int depth;
	private int totalCount;
	private int page;
	private int countPage;
	private int countList;
	private int totalPage;
	
	
	public InquiryDTO() {
		// TODO Auto-generated constructor stub
	}
	public int getInquiryno() {
		return inquiryno;
	}
	public void setInquiryno(int inquiryno) {
		this.inquiryno = inquiryno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	public int getGrpno() {
		return grpno;
	}
	public void setGrpno(int grpno) {
		this.grpno = grpno;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
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
	@Override
	public String toString() {
		return "InquiryDTO [inquiryno=" + inquiryno + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", wdate=" + wdate + ", grpno=" + grpno + ", depth=" + depth + ", totalCount=" + totalCount
				+ ", page=" + page + ", countPage=" + countPage + ", countList=" + countList + ", totalPage="
				+ totalPage + "]";
	}
	
	
	
}
