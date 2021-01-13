package kr.co.nologaja.booking;

import java.util.List;


public interface ISearchDAO {

	public List<String> rNfind(SearchDTO sdto);
	public int ablerN(String roomNumber);
	public int datecheck(SearchDTO sdto);
	public bkRoomDTO ableList(String roomNumber);

}
