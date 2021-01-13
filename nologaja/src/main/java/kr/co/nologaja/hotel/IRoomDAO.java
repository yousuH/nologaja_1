package kr.co.nologaja.hotel;

import java.util.List;

public interface IRoomDAO {

	public void roomins(RoomDTO dto);
	public int roomnumFind(String roomNumber);
	public List<RoomDTO> room_list(String hotelNumber);
	public RoomDTO room_detail(String roomNumber);
}
