package net.utility;


public class ImageDTO {
	private int imageno;
	private String safeFile;
	
	public ImageDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getImageno() {
		return imageno;
	}
	public void setImageno(int imageno) {
		this.imageno = imageno;
	}
	public String getSafeFile() {
		return safeFile;
	}
	public void setSafeFile(String saveFile) {
		this.safeFile = saveFile;
	}

	@Override
	public String toString() {
		return "ImageDTO [imageno=" + imageno + ", safeFile=" + safeFile + "]";
	}
	
	
}
