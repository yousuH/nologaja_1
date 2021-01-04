package kr.co.nologaja.member;

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


@Controller
public class MemberCont {
	
	@Inject
	BuyerDAO bdao;
	
	@Inject
	SellerDAO sdao;
	
	public MemberCont() {
		System.out.println("==MemberCont()==");
	}
	
	//회원가입 페이지(배너 상의 회원가입 버튼)
	@RequestMapping(value = "/memberform.do")
	   public ModelAndView form() {
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("member/memberform");
	      return mav;
	   }
	
	//회원가입 구매자 dto
	@RequestMapping("/buyerjoin.do")
	public String insert(@ModelAttribute BuyerDTO dto) {
		bdao.insert(dto);
		return "member/login";
	}//insert() end

	//구매자 아이디 체크
	@RequestMapping("/buyerProc.do")
	public void buyerCheckProc(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String uid=req.getParameter("uid");
			int cnt=bdao.duplecateID(uid);
			
			JSONObject json=new JSONObject();
			//key.put(key, value)
			json.put("count", cnt);
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out=resp.getWriter();
			out.println(json.toString());
			out.flush();
			out.close();
			
		}catch (Exception e) {
			System.out.println("아이디 중복확인 쿠키 실패:"+e);
		}//end
	}//buyerProc() end
	
	//구매자 이메일 체크
	@RequestMapping("/buyerEmailProc.do")
	public void buyerEmailCheckProc(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String uemail=req.getParameter("uemail");
			int cnt=bdao.duplecateEmail(uemail);
			
			JSONObject json=new JSONObject();
			//key.put(key, value)
			json.put("count", cnt);
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out=resp.getWriter();
			out.println(json.toString());
			out.flush();
			out.close();
			
		}catch (Exception e) {
			System.out.println("이메일 중복확인 쿠키 실패:"+e);
		}//end
	}//buyerEmailCheckProc() end

	
	//회원가입 판매자 dto
	@RequestMapping("/sellerjoin.do")
	public String insert(@ModelAttribute SellerDTO dto) {
		sdao.insert(dto);
		return "member/login";
	}//insert() end
	
	//판매자 아이디 체크
	@RequestMapping("/sellerProc.do")
	public void sellerCheckProc(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String suid=req.getParameter("suid");
			int cnt=bdao.duplecateID(suid);
			
			JSONObject json=new JSONObject();
			//key.put(key, value)
			json.put("count", cnt);
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out=resp.getWriter();
			out.println(json.toString());
			out.flush();
			out.close();
			
		}catch (Exception e) {
			System.out.println("아이디 중복확인 쿠키 실패:"+e);
		}//end
	}//sellerProc() end
	
	//판매자 이메일 체크
	@RequestMapping("/sellerEmailProc.do")
	public void sellerEmailCheckProc(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String uemail=req.getParameter("uemail");
			int cnt=sdao.duplecateEmail(uemail);
				
			JSONObject json=new JSONObject();
			//key.put(key, value)
			json.put("count", cnt);
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out=resp.getWriter();
			out.println(json.toString());
			out.flush();
			out.close();
				
		}catch (Exception e) {
			System.out.println("이메일 중복확인 쿠키 실패:"+e);
		}//end
	}//sellerEmailCheckProc() end

//---------------------------------------------------------------------------------------------------------------------------------------------
	//로그인페이지로 이동
		@RequestMapping("/login.do")
		   public ModelAndView login() {
		      ModelAndView mav = new ModelAndView();
		      mav.setViewName("member/login");
		      return mav;
	   }
		

		//구매자 로그인처리
		@RequestMapping("/blogin.do")
		public ModelAndView blogin(String uid, String upw, HttpServletRequest request) {
			boolean result = bdao.blogin(uid, upw);
			ModelAndView mav = new ModelAndView();
			if(result==true) {
				String ugrd=bdao.read_bgrd(uid, upw);
				mav.setViewName("index");
				HttpSession session=request.getSession();
				session.setAttribute("uid", uid);
				session.setAttribute("ugrd", ugrd);
				session.setMaxInactiveInterval(20*60*24);
			}else {
				mav.setViewName("member/login");
			}
			return mav;
		}//blogin() end
		
		
		//판매자 로그인처리
		@RequestMapping("/slogin.do")
		public ModelAndView slogin(String suid, String supw, HttpServletRequest request) {
			boolean result = sdao.slogin(suid, supw);
			ModelAndView mav = new ModelAndView();
			if(result==true) {
				String ugrd=sdao.read_sgrd(suid, supw);
				mav.setViewName("index");
				HttpSession session=request.getSession();
				session.setAttribute("suid", suid);
				session.setAttribute("ugrd", ugrd);
				session.setMaxInactiveInterval(20*60*24);
			}else {
				mav.setViewName("member/login");
			}
			return mav;
		}//slogin() end
		
		//로그아웃
		@RequestMapping("/logout.do")
	    public ModelAndView logout(HttpServletRequest request) {
			HttpSession session=request.getSession();
			session.removeAttribute("suid");
			session.removeAttribute("uid");
			ModelAndView mav = new ModelAndView();
		    mav.setViewName("member/login");
		    return mav;
		}
		//회원정보수정 폼 불러오기
		@RequestMapping(value = "updateform.do")
		public ModelAndView update(HttpServletRequest req) {
			HttpSession session = req.getSession();
			String ugrd = (String)session.getAttribute("ugrd");
			System.out.println(ugrd);
		//B1은 판매회원, C1는 일반회원
			if(ugrd.equals("B1")) {
				ModelAndView mav = new ModelAndView();
				mav.setViewName("member/s_updateform");
				String suid = (String)session.getAttribute("suid");
				mav.addObject("dto", sdao.detail(suid));
				mav.addObject("ugrd",ugrd);
				return mav;
			} else if(ugrd.equals("C1")) {
				ModelAndView mav = new ModelAndView();
				mav.setViewName("member/b_updateform");
				String uid = (String)session.getAttribute("uid");
				mav.addObject("dto", bdao.detail(uid));
				mav.addObject("ugrd",ugrd);
				return mav;
			}
			return null;
		}
		
		//회원정보수정하기
		@RequestMapping(value = "updateproc.do")
		public ModelAndView update(@ModelAttribute BuyerDTO bdto, SellerDTO sdto, HttpServletRequest req) {
			HttpSession session = req.getSession();
			String ugrd = (String)session.getAttribute("ugrd");
		//B1은 판매회원, C1는 일반회원
			if(ugrd.equals("B1")) {
				ModelAndView mav = new ModelAndView();
				mav.setViewName("index");
				sdao.update(sdto);
				return mav;
			} else if(ugrd.equals("C1")) {
				ModelAndView mav = new ModelAndView();
				mav.setViewName("index");
				bdao.update(bdto);
				return mav;
			}
			return null;
		}
	
//------------------------------------------------------------------------------------------------------------------------------

}//class end
