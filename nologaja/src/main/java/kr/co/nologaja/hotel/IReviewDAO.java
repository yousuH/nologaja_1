package kr.co.nologaja.hotel;

import java.util.List;
import java.util.Map;

public interface IReviewDAO {
	public List<ReviewDTO> rv_list(String roomNumber, int num);
	public void rvins(ReviewDTO dto);

}
