package kr.co.nologaja.booking;

import java.util.List;

public interface IBkDAO {
	
	public List<BkDTO> list();
    public void insert(BkDTO dto);
    public BkDTO detail(BkDTO bk_num);
    public void delete(String bk_num);
    public void update(BkDTO dto);
    
}
