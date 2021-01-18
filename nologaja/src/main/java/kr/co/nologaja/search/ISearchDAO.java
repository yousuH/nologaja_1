package kr.co.nologaja.search;

import java.util.List;


public interface ISearchDAO {

	public List<String> rNfind(SearchDTO sdto);
	public int ablerN(String roomNumber);
	public int datecheck(SearchDTO sdto);
	public SearchlistDTO ableList(String roomNumber);
	public RoomHotelDTO searchdetail(String roomNumber);
	public FeeListDTO feeList(String roomNumber);


}
