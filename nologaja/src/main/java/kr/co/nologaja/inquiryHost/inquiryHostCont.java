package kr.co.nologaja.inquiryHost;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String Swdate = transFormat.format(wdate);
		
		//답변상태 	제목 	작성자 	작성일
		System.out.println(dto);
		String message = "<div class=\"num\">미답변</div><div class=\"tit\">"+dto.getTitle()+"</div>";
		message+=  "<div class=\"writer\">" + dto.getUid() + "</div><div class=\"date\">" + Swdate + "</div><br>";
		message+=  "<div class=\"content\">"+"-> "+dto.getContent()+"</div>";
		
		resp.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(message);
		out.flush();
		out.close();
	}
	
	@RequestMapping(value = "/inquiry_host_reply.do")
	public void inquiry_host_reply(InquiryHostDTO dto, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws IOException {
		String suid = (String) session.getAttribute("suid");
		String roomNumber = (String)req.getParameter("roomNumber");
		dto.setSuid(suid);
		dto.setRoomNumber(roomNumber);
		dto.setGrpno(dto.getGrpno());
		dto.setDepth(dto.getDepth()+1);
		System.out.println(dto);
		
		//답변 insert
		ihDAO.inquiryHost_reply(dto);
		int inquiryno = ihDAO.inquiryHost_getinquiryno2(dto);
		
		//문의글 작성상태 Y로 업데이트 
		ihDAO.inquiryHost_updateReply(inquiryno);
		
		Date wdate = ihDAO.inquiryHost_getwdate(inquiryno);
		dto.setInquiryno(inquiryno);
		dto.setWdate(wdate);

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String Swdate = transFormat.format(wdate);
		
		//답변상태 	제목 	작성자 	작성일
		String message = "<div class=\"tit2\" style='width: 670px; display: inline-block; text-align: left;'>"+dto.getContent()+"</div><div class=\"writer2\" style='width: 122px; display: inline-block; '>"+suid+"</div><div class=\"date2\" style='width: 183px; display: inline-block;'>"+Swdate+"</div>";
		
		resp.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(message);
		out.flush();
		out.close();
	}
	
}// class end
