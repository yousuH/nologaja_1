package kr.co.nologaja.member;

import java.util.List;

import javax.servlet.http.HttpSession;


public interface IBuyerDAO {
	public List<BuyerDTO> list();
    public void insert(BuyerDTO dto);
    public BuyerDTO detail(String uid);
    public void delete(String uid);
    public void update(BuyerDTO dto);
    public boolean checkpasswd(String uid, String upw);
    public int duplecateID(String uid);
    public int duplecateEmail(String uemail);
	public boolean blogin(String uid , String upw);
	public String read_bgrd(String uid, String upw);
	public BuyerDTO bfindid(BuyerDTO dto);
	public int bdelete(String uid, String upw);
}
