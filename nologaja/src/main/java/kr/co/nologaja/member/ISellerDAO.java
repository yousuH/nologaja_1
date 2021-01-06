package kr.co.nologaja.member;

import java.util.List;

public interface ISellerDAO {

	public List<SellerDTO> list();
    public void insert(SellerDTO dto);
    public SellerDTO detail(String suid);
    public void delete(String suid);
    public void update(SellerDTO dto);
    public boolean checkpasswd(String suid, String supw);
    public int duplecateID(String suid);
    public int duplecateEmail(String suid);
    public boolean slogin(String suid , String supw);
    public String read_sgrd(String suid, String supw);
	public SellerDTO sfindid(SellerDTO dto);
	public SellerDTO sdelete(String suid);

}
