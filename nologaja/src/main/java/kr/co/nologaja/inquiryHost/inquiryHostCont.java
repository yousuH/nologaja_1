package kr.co.nologaja.inquiryHost;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class inquiryHostCont {
	
	@Inject
	InquiryHostDAO ihDAO;
	
	@Inject
	InquiryHostDTO ihDTO;
	

	public inquiryHostCont() {
		System.out.println("==inquiryHostCont객체생성==");
	}

	@RequestMapping(value = "/inquiry_host.do")
	public void inquiry_host(InquiryHostDTO dto, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws IOException {
		String uid = (String) session.getAttribute("uid");
		String roomNumber = (String)req.getParameter("roomNumber");
		dto.setUid(uid);
		dto.setRoomNumber(roomNumber);
		
		
		
		ihDAO.inquiryHost_insert(dto);
		int inquiryno = ihDAO.inquiryHost_getinquiryno(dto);
		Date wdate = ihDAO.inquiryHost_getwdate(inquiryno);
		dto.setInquiryno(inquiryno);
		dto.setWdate(wdate);
		
		
		
		//답변상태 	제목 	작성자 	작성일
		System.out.println(dto);
		String message = "<tr><td>미답변</td><td>" + dto.getTitle() + "</td>";
		message+=  "<td>" + dto.getUid() + "</td><td>" + dto.getWdate() + "</td>";
		message+=  "</tr><tr>"+"<td colspan=\"4\">"+dto.getContent()+"</td></tr>";
		
		resp.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(message);
		out.flush();
		out.close();
	}

}// class end
