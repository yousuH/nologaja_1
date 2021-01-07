package kr.co.nologaja.hotel;

public interface IRoomDAO {

	public void roomins(RoomDTO dto);
	public int roomnumFind(String roomNumber);

}
