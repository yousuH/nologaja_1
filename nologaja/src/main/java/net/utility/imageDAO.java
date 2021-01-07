package net.utility;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class imageDAO {
	
	@Inject 
	SqlSession sqlSession;
	
	public void insert(String saveFile) {
		sqlSession.insert("image.insert", saveFile);
		
	}
	
}
