package kr.co.nologaja.hotel;

import java.util.List;

import net.utility.HotelListDTO;

public interface IHotelDAO {

	public void hotelins(HotelDTO dto);
	public int hotelnumFind(String hotelNumber);
	public List<HotelListDTO> hotel_list(String suid);
	public HotelDTO hotel_detail(String hotelNumber);
	
}//class end 
