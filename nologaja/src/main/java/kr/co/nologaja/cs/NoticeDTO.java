package kr.co.nologaja.cs;

import java.util.Date;

public class NoticeDTO {
	private int noticeno;
	private Date wdate;
	private String title;
	private String content;
	
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

	@Override
	public String toString() {
		return "NoticeDTO [noticeno=" + noticeno + ", wdate=" + wdate + ", title=" + title + ", content=" + content
				+ "]";
	}
	
	
	
	
}
