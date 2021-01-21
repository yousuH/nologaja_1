package kr.co.nologaja.hotel;

import org.springframework.stereotype.Repository;

@Repository
public class ReviewDTO {

   private int reviewno;
   private String content;
   private String uid;
   private String roomNumber;
   private String wdate;
   private int stars_clean;
   private int stars_location;
   private int stars_costeff;
   private double stars_avg;

   public ReviewDTO() {}

   public int getReviewno() {
      return reviewno;
   }

   public void setReviewno(int reviewno) {
      this.reviewno = reviewno;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public String getUid() {
      return uid;
   }

   public void setUid(String uid) {
      this.uid = uid;
   }

   public String getRoomNumber() {
      return roomNumber;
   }

   public void setRoomNumber(String roomNumber) {
      this.roomNumber = roomNumber;
   }

   public String getWdate() {
      return wdate;
   }

   public void setWdate(String wdate) {
      this.wdate = wdate;
   }

   public int getStars_clean() {
      return stars_clean;
   }

   public void setStars_clean(int stars_clean) {
      this.stars_clean = stars_clean;
   }

   public int getStars_location() {
      return stars_location;
   }

   public void setStars_location(int stars_location) {
      this.stars_location = stars_location;
   }

   public int getStars_costeff() {
      return stars_costeff;
   }

   public void setStars_costeff(int stars_costeff) {
      this.stars_costeff = stars_costeff;
   }
   
   public double getStars_avg() {
      return stars_avg;
   }
   
   public void setStars_avg(double stars_avg) {
	  this.stars_avg = stars_avg;
   }

@Override
public String toString() {
	return "ReviewDTO [reviewno=" + reviewno + ", content=" + content + ", uid=" + uid + ", roomNumber=" + roomNumber
			+ ", wdate=" + wdate + ", stars_clean=" + stars_clean + ", stars_location=" + stars_location
			+ ", stars_costeff=" + stars_costeff + ", stars_avg=" + stars_avg + "]";
}

}// class end