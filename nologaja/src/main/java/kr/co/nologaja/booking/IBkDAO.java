package kr.co.nologaja.booking;

import java.util.List;

public interface IBkDAO {
	
	public List<BkDTO> list();
    public void insert(BkDTO dto);
    public BkDTO detail(String bk_num, String uid);
    public List<BkDTO> bklist(String bk_num);
    public void delete(String bk_num);
    public void update(BkDTO dto);
    
}
