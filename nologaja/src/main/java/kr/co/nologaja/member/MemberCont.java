package kr.co.nologaja.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.management.BadBinaryOpValueExpException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jdk.jfr.MetadataDefinition;
import kr.co.nologaja.member.BuyerDTO;
import net.utility.mail;

@Controller
public class MemberCont {

	@Inject
	BuyerDAO bdao;

	@Inject
	SellerDAO sdao;

	@Inject
	mail mailSending;

	@Inject
	mail mailSending2;

	public MemberCont() {
		System.out.println("==MemberCont()==");
	}

	// 회원가입 페이지(배너 상의 회원가입 버튼)
	@RequestMapping(value = "/memberform.do")
	public ModelAndView form() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberform");
		return mav;
	}

	// 회원가입 구매자 dto
	@RequestMapping("/buyerjoin.do")
	public String insert(@ModelAttribute BuyerDTO dto) {
		bdao.insert(dto);
		return "member/login";
	}// insert() end

	// 구매자 아이디 체크
	@RequestMapping("/buyerProc.do")
	public void buyerCheckProc(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String uid = req.getParameter("uid");
			int cnt = bdao.duplecateID(uid);

			JSONObject json = new JSONObject();
			// key.put(key, value)
			json.put("count", cnt);
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println(json.toString());
			out.flush();
			out.close();

		} catch (Exception e) {
			System.out.println("아이디 중복확인 쿠키 실패:" + e);
		} // end
	}// buyerProc() end

	// 구매자 이메일 체크
	@RequestMapping("/buyerEmailProc.do")
	public void buyerEmailCheckProc(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String uemail = req.getParameter("uemail");
			int cnt = bdao.duplecateEmail(uemail);

			JSONObject json = new JSONObject();
			// key.put(key, value)
			json.put("count", cnt);
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println(json.toString());
			out.flush();
			out.close();

		} catch (Exception e) {
			System.out.println("이메일 중복확인 쿠키 실패:" + e);
		} // end
	}// buyerEmailCheckProc() end

	// 회원가입 판매자 dto
	@RequestMapping("/sellerjoin.do")
	public String insert(@ModelAttribute SellerDTO dto) {
		sdao.insert(dto);
		return "member/login";
	}// insert() end

	// 판매자 아이디 체크
	@RequestMapping("/sellerProc.do")
	public void sellerCheckProc(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String suid = req.getParameter("suid");
			int cnt = sdao.duplecateID(suid);

			JSONObject json = new JSONObject();
			// key.put(key, value)
			json.put("count", cnt);
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println(json.toString());
			out.flush();
			out.close();

		} catch (Exception e) {
			System.out.println("아이디 중복확인 쿠키 실패:" + e);
		} // end
	}// sellerProc() end

	// 판매자 이메일 체크
	@RequestMapping("/sellerEmailProc.do")
	public void sellerEmailCheckProc(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String uemail = req.getParameter("uemail");
			int cnt = sdao.duplecateEmail(uemail);

			JSONObject json = new JSONObject();
			// key.put(key, value)
			json.put("count", cnt);
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println(json.toString());
			out.flush();
			out.close();

		} catch (Exception e) {
			System.out.println("이메일 중복확인 쿠키 실패:" + e);
		} // end
	}// sellerEmailCheckProc() end

//---------------------------------------------------------------------------------------------------------------------------------------------
	// 로그인페이지로 이동
	@RequestMapping("/login.do")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		return mav;
	}

	
	//구매자 로그인처리
	@RequestMapping("/blogin.do")
	public ModelAndView blogin(String uid, String upw, HttpServletRequest request, HttpServletResponse resp) throws Exception {
		boolean result = bdao.blogin(uid, upw);
		ModelAndView mav = new ModelAndView();
		if(result==true) {
			String ugrd=bdao.read_bgrd(uid, upw);
			if(!ugrd.equals("F1")) {
				mav.setViewName("index");
				HttpSession session=request.getSession();
				session.setAttribute("uid", uid);
				session.setAttribute("ugrd", ugrd);
				session.setMaxInactiveInterval(20*60*24);
			}else {
		        resp.setContentType("text/html; charset=UTF-8");
		        PrintWriter out = resp.getWriter();
		        out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
		        out.flush();
				mav.setViewName("member/login");
			}
		}else {
	        resp.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = resp.getWriter();
	        out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
	        out.flush();
			mav.setViewName("member/login");
		}
		return mav;
	}//blogin() end
	
	
	//판매자 로그인처리
	@RequestMapping("/slogin.do")
	public ModelAndView slogin(String suid, String supw, HttpServletRequest request, HttpServletResponse resp) throws Exception {
		boolean result = sdao.slogin(suid, supw);
		ModelAndView mav = new ModelAndView();
		if(result==true) {
			String ugrd=sdao.read_sgrd(suid, supw);
			if(!ugrd.equals("F1")) {
				mav.setViewName("index");
				HttpSession session=request.getSession();
				session.setAttribute("suid", suid);
				session.setAttribute("ugrd", ugrd);
				session.setMaxInactiveInterval(20*60*24);
			}else {
		        resp.setContentType("text/html; charset=UTF-8");
		        PrintWriter out = resp.getWriter();
		        out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
		        out.flush();
				mav.setViewName("member/login");
			}//if end
		}else {
	        resp.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = resp.getWriter();
	        out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
	        out.flush();
			mav.setViewName("member/login");
		}
		return mav;
	}//slogin() end

	// 로그아웃
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("suid");
		session.removeAttribute("uid");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		return mav;
	}

	// 회원정보수정 폼 불러오기
	@RequestMapping(value = "/updateform.do")
	public ModelAndView update(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String ugrd = (String) session.getAttribute("ugrd");
		System.out.println(ugrd);
		// B1은 판매회원, C1는 일반회원
		if (ugrd.equals("B1")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("member/s_updateform");
			String suid = (String) session.getAttribute("suid");
			mav.addObject("dto", sdao.detail(suid));
			mav.addObject("ugrd", ugrd);
			return mav;
		} else if (ugrd.equals("C1")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("member/b_updateform");
			String uid = (String) session.getAttribute("uid");
			mav.addObject("dto", bdao.detail(uid));
			mav.addObject("ugrd", ugrd);
			return mav;
		}
		return null;
	}

	// 회원정보수정하기
	@RequestMapping(value = "/updateproc.do")
	public ModelAndView update(@ModelAttribute BuyerDTO bdto, SellerDTO sdto, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String ugrd = (String) session.getAttribute("ugrd");
		// B1은 판매회원, C1는 일반회원
		if (ugrd.equals("B1")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("index");
			sdao.update(sdto);
			return mav;
		} else if (ugrd.equals("C1")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("index");
			bdao.update(bdto);
			return mav;
		}
		return null;
	}

//------------------------------------------------------------------------------------------------------------------------------

	// 아이디 비밀번호 찾기 페이지
	@RequestMapping(value = "/findidpw.do")
	public ModelAndView findidpw() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/findidpw");
		return mav;
	}

	// 아이디 비밀번호 찾기 결과(일반회원)
	@RequestMapping(value = "/buyerfindid.do")
	public ModelAndView buyerfindid(@ModelAttribute BuyerDTO dto) {
		ModelAndView mav = new ModelAndView();
		BuyerDTO result = bdao.bfindid(dto);

		if (result == null) {
			mav.addObject("msg2", "<p>일치하는 계정을 찾을 수 없습니다.</p>");
			mav.setViewName("member/findidpwresult");
		} else {
			mailSending.mailSending(dto, result);

			mav.addObject("msg1", "<table><tr><th>이름</th><td>" + dto.getUname() + "</td></tr><tr><th>이메일</th><td>"
					+ dto.getUemail() + "</td></tr></table>");
			mav.addObject("msg2", "<p>" + dto.getUemail() + "로 아이디와 비밀번호를 전송하였습니다.</p>");
			mav.setViewName("member/findidpwresult");
			mav.addObject("dto", dto);
		}
		return mav;
	}

	// 아이디 비밀번호 찾기 결과(판매회원)
	@RequestMapping(value = "/sellerfindid.do")
	public ModelAndView sellerfindid(@ModelAttribute SellerDTO dto) {
		ModelAndView mav = new ModelAndView();
		SellerDTO result = sdao.sfindid(dto);

		if (result == null) {
			mav.addObject("msg2", "<p>일치하는 계정을 찾을 수 없습니다.</p>");
			mav.setViewName("member/findidpwresult");
		} else {
			mailSending.mailSending2(dto, result);

			mav.addObject("msg1", "<table><tr><th>이름</th><td>" + dto.getUname() + "</td></tr><tr><th>이메일</th><td>"
					+ dto.getUemail() + "</td></tr></table>");
			mav.addObject("msg2", "<p>" + dto.getUemail() + "로 아이디와 비밀번호를 전송하였습니다.</p>");
			mav.setViewName("member/findidpwresult");
			mav.addObject("dto", dto);
		}
		return mav;
	}

	// 회원탈퇴페이지로 이동
	@RequestMapping("/delete.do")
	public ModelAndView delete() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/memDelForm");
		return mav;
	}

	// 구매자 회원 탈퇴
		@RequestMapping("/bdelete.do")
		public ModelAndView bdelete(HttpServletRequest req, HttpSession session) {
			ModelAndView mav = new ModelAndView();			

			// 세션영역에 있는 세션변수값 가져오기
			// session.setAttribute("uid", uid);
			String uid = (String) session.getAttribute("uid");
			String upw = (String) req.getParameter("upw");
			
			int cnt=bdao.bdelete(uid, upw); //회원탈퇴성공 1, 실패0
			if(cnt==0) {
				//회원탈퇴가 성공하지 못했다면
				mav.setViewName("mypage/memDelForm");
				mav.addObject("cnt", cnt);
			}else {
				// 회원탈퇴가 성공되었다면...세션에 있는 모든 변수가 삭제
				session.removeAttribute("uid");
				session.removeAttribute("ugrd");
				session.setMaxInactiveInterval(0);
				mav.setViewName("index");
			}//if end
			return mav;
		}// ndelete() end
		
		// 판매자 회원탈퇴
		@RequestMapping("/sdelete.do")
		public ModelAndView sdelete(HttpServletRequest req,HttpSession session) {
			ModelAndView mav = new ModelAndView();
			
			String suid = (String) session.getAttribute("suid");
			String supw = (String) req.getParameter("supw");
			
			int cnt=sdao.sdelete(suid,supw);
			if(cnt==0) {
				//회원탈퇴가 성공하지 못했다면
				mav.setViewName("mypage/memDelForm");
				mav.addObject("cnt", cnt);
			}else {				
			session.removeAttribute("suid");
			session.removeAttribute("ugrd");
			session.setMaxInactiveInterval(0);			
			mav.setViewName("index");
			}
			return mav;
		}// sdelete() end

}// class end
