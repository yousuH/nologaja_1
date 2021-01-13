package net.utility;

import org.springframework.stereotype.Repository;

@Repository
public class RoomImageDTO {
	private int imageno;
	private String saveFile;
	private String roomNumber;
	
	
	public RoomImageDTO() {
		// TODO Auto-generated constructor stub
	}


	public int getImageno() {
		return imageno;
	}


	public void setImageno(int imageno) {
		this.imageno = imageno;
	}


	public String getSaveFile() {
		return saveFile;
	}


	public void setSaveFile(String saveFile) {
		this.saveFile = saveFile;
	}


	public String getRoomNumber() {
		return roomNumber;
	}


	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}


	
	
}
