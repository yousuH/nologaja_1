package kr.co.nologaja.cs;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class InquiryDTO {
	private int inquiryno;
	private String id;
	private String title;
	private String content;
	private Date wdate;
	private int grpno;
	private int depth;
	
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
	@Override
	public String toString() {
		return "InquiryDTO [inquiryno=" + inquiryno + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", wdate=" + wdate + ", grpno=" + grpno + ", depth=" + depth + "]";
	}
	
	
	
	
}
