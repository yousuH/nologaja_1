package kr.co.nologaja.cs;

public class FaqDTO {
	private int faqno;
	private String title;
	private String content;
	
	public FaqDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getFaqno() {
		return faqno;
	}
	public void setFaqno(int faqno) {
		this.faqno = faqno;
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
		return "FaqDTO [faqno=" + faqno + ", title=" + title + ", content=" + content + "]";
	}
	
	
}
