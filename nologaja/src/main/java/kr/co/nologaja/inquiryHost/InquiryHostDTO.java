package kr.co.nologaja.inquiryHost;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class InquiryHostDTO {
	
	private int inquiryno;
	private String uid;
	private String suid;
	private String title;
	private String content;
	private Date wdate;
	private String roomNumber;
	private String grpno;
	private String depth;
	private String open;
	private String rp_st;
	
	public InquiryHostDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getInquiryno() {
		return inquiryno;
	}

	public void setInquiryno(int inquiryno) {
		this.inquiryno = inquiryno;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getSuid() {
		return suid;
	}

	public void setSuid(String suid) {
		this.suid = suid;
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

	public String getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}

	public String getGrpno() {
		return grpno;
	}

	public void setGrpno(String grpno) {
		this.grpno = grpno;
	}

	public String getDepth() {
		return depth;
	}

	public void setDepth(String depth) {
		this.depth = depth;
	}

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	public String getRp_st() {
		return rp_st;
	}

	public void setRp_st(String rp_st) {
		this.rp_st = rp_st;
	}

	@Override
	public String toString() {
		return "InquiryHostDTO [inquiryno=" + inquiryno + ", uid=" + uid + ", suid=" + suid + ", title=" + title
				+ ", content=" + content + ", wdate=" + wdate + ", roomNumber=" + roomNumber + ", grpno=" + grpno
				+ ", depth=" + depth + ", open=" + open + ", rp_st=" + rp_st + "]";
	}
	
	
}
