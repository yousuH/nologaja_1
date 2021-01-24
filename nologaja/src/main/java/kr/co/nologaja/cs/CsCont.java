package kr.co.nologaja.cs;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;






@Controller
public class CsCont {
	
	@Inject
	InquiryDAO idao;
	
	@Inject
	NoticeDAO ndao;
	
	@Inject
	FaqDAO fdao;
	
	public CsCont() {
		System.out.println("==Cs객체생성==");
	}
	
	
	@RequestMapping(value = "/inquiry_list.do")
	public String inquiry_main(Model model, HttpServletRequest req) {
		int page = 1;
		if (req.getParameter("page")!=null) {
			page = Integer.parseInt(req.getParameter("page"));
		}
		int countList = 10;
		int countPage = 5;
		int totalCount = idao.totalCount();
		int totalPage = totalCount / countList; //0 10
		ArrayList<Integer> listPage = new ArrayList<>();
		if (totalCount % countList > 0) {
		    totalPage++;
		}

		if (totalPage < page && totalPage != 0) {
		    page = totalPage;
		}

		int startPage = ((page - 1) / 10) * 10 + 1; //1
		
		int endPage = startPage + countPage - 1; //

		if (endPage > totalPage) {
		    endPage = totalPage;
		}
		
		for(int iCount=startPage; iCount <= endPage; iCount++) {
			listPage.add(iCount);
		}
		model.addAttribute("page", page);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("listPage", listPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		int currentPage = (page-1)*10;
		List<InquiryDTO> list = idao.list(currentPage);
		model.addAttribute("list",list);
		return "cs/inquiry_list";
	}//insert() end
	
	
	//문의사항 폼 불러오기
	@RequestMapping(value = "/inquiry_form.do")
	public ModelAndView inquiry_form(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String ugrd = (String)session.getAttribute("ugrd");
		String suid = (String)session.getAttribute("suid");
		String uid = (String)session.getAttribute("uid");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cs/inquiry_form");
		//일반회원, 판매회원 구분해서 id값 저장
		if (ugrd.equals("C1")) {
			mav.addObject("id", uid);
		} else if(ugrd.equals("B1")){
			mav.addObject("id", suid);
		}
		return mav;
	}//insert() end
	
	//문의사항 작성하기
	@RequestMapping(value = "/inquiry_insert.do")
	public String inquiry_insert(@ModelAttribute InquiryDTO dto, HttpServletRequest req) {
		idao.insert(dto);
		return "redirect:/inquiry_list.do";
	}//insert() end
	
	//문의사항 상세보기
	@RequestMapping(value = "/inquiry_detail.do")
	public ModelAndView inquiry_detail(int inquiryno) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cs/inquiry_detail");
		InquiryDTO dto = idao.detail(inquiryno);
		mav.addObject("id", dto.getId());
		mav.addObject("title", dto.getTitle());
		mav.addObject("inquiryno", dto.getInquiryno());
		mav.addObject("wdate", dto.getWdate());
		mav.addObject("depth", dto.getDepth());
		//content에 담겨져 있는 내용 변환
		String content = dto.getContent();
		content = content.replaceAll(" ", "&nbsp;");//공백
		content = content.replaceAll("\"", "&quot;");
		content = content.replaceAll("'", "&apos;");
		content = content.replaceAll("<", "&lt;");
		content = content.replaceAll(">", "&gt;");
		content = content.replaceAll("\r\n", "<br>");//줄바꿈
		mav.addObject("content", content);
		return mav;
	}//insert() end
	
	//문의사항 수정 폼 불러오기
	@RequestMapping(value = "/inquiry_update.do")
	public ModelAndView inquiry_update(int inquiryno) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cs/inquiry_update");
		InquiryDTO dto = idao.detail(inquiryno);
		mav.addObject("title", dto.getTitle());
		mav.addObject("inquiryno", dto.getInquiryno());
		mav.addObject("id", dto.getId());
		//content에 담겨져 있는 내용 변환
		String content = dto.getContent();
		content = content.replaceAll(" ", "&nbsp;");//공백
		content = content.replaceAll("\"", "&quot;");
		content = content.replaceAll("'", "&apos;");
		content = content.replaceAll("<", "&lt;");
		content = content.replaceAll(">", "&gt;");
		content = content.replaceAll("\r\n", "<br>");//줄바꿈
		mav.addObject("content", content);
		return mav;
		}//insert() end
		
	//문의사항 수정하기
	@RequestMapping(value = "/inquiry_updateproc.do")
	public String inquiry_updateproc(@ModelAttribute InquiryDTO dto) {
		idao.update(dto);
		return "redirect:/inquiry_list.do";
	}//insert() end
	
	//문의사항 삭제하기
	@RequestMapping(value = "/inquiry_delete.do")
	public String inquiry_delete(int inquiryno) {
		idao.delete(inquiryno);
		return "redirect:/inquiry_list.do";
	}//insert() end
	
	//문의사항 댓글폼 불러오기
	@RequestMapping(value="/inquiry_reply")
	public ModelAndView inquiry_reply(int inquiryno) {
		ModelAndView mav = new ModelAndView();
		//부모글의 grpno, depth값 가져옴
		InquiryDTO dto = idao.reply(inquiryno);
		int grpno = dto.getGrpno();
		int depth = dto.getDepth();
		String title = dto.getTitle();
		depth = depth+1;
		mav.setViewName("cs/inquiry_reply");
		mav.addObject("grpno", grpno);
		mav.addObject("depth", depth);
		mav.addObject("title", title);
		return mav;
	}
	
	//문의사항 댓글달기
	@RequestMapping(value = "/inquiry_replyproc")
	public String inquiry_replyproc(InquiryDTO dto) {
		idao.replyproc(dto);
		return "redirect:/inquiry_list.do";
	}
	
	//공지사항 폼 가져오기
	@RequestMapping(value = "/notice_form.do")
	public String notice_form() {
		return "cs/notice_form";
	}//insert() end
	
	//공지사항 작성하기
	@RequestMapping(value = "/notice_insert.do")
	public String notice_insert(@ModelAttribute NoticeDTO dto, HttpServletRequest req) {
		ndao.insert(dto);
		return "redirect:/notice_list.do";
	}//insert() end
		
	//공지사항 목록가져오기
	@RequestMapping(value = "/notice_list.do")
	public String notice_list(Model model, HttpServletRequest req) {
		int page = 1;
		if (req.getParameter("page")!=null) {
			page = Integer.parseInt(req.getParameter("page"));
		}
		int countList = 10;
		int countPage = 5;
		int totalCount = ndao.totalCount();
		int totalPage = totalCount / countList;
		ArrayList<Integer> listPage = new ArrayList<>();
		
		if (totalCount % countList > 0) {
		    totalPage++;
		}

		//작성된 글이 아무것도 없을 때 page값이 0이됨
		//if 조건에 totalPage가 0이 아닐때라는 조건을 추가해줬음
		if (totalPage < page && totalPage != 0) {
		    page = totalPage;
		}

		int startPage = ((page - 1) / 10) * 10 + 1; //1
		
		int endPage = startPage + countPage - 1; //

		if (endPage > totalPage) {
		    endPage = totalPage;
		}
		
		for(int iCount=startPage; iCount <= endPage; iCount++) {
			listPage.add(iCount);
		}
		model.addAttribute("page", page);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("listPage", listPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		int currentPage = (page-1)*10;
		List<NoticeDTO> list = ndao.list(currentPage);
		model.addAttribute("list",list);
		return "cs/notice_list";
	}//insert() end
	
	//공지사항 상세보기
	@RequestMapping(value = "/notice_detail.do")
	public ModelAndView notice_detail(int noticeno) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cs/notice_detail");
		NoticeDTO dto = ndao.detail(noticeno);
		mav.addObject("title", dto.getTitle());
		mav.addObject("noticeno", dto.getNoticeno());
		mav.addObject("wdate", dto.getWdate());
		
		//content에 담겨져 있는 내용 변환
		String content = dto.getContent();
		content = content.replaceAll(" ", "&nbsp;");//공백
		content = content.replaceAll("\"", "&quot;");
		content = content.replaceAll("'", "&apos;");
		content = content.replaceAll("<", "&lt;");
		content = content.replaceAll(">", "&gt;");
		content = content.replaceAll("\r\n", "<br>");//줄바꿈
		mav.addObject("content", content);
		return mav;
	}//insert() end
	
	//공지사항 수정 폼 불러오기
	@RequestMapping(value = "/notice_update.do")
	public ModelAndView notice_update(int noticeno) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cs/notice_update");
		NoticeDTO dto = ndao.detail(noticeno);
		mav.addObject("title", dto.getTitle());
		mav.addObject("noticeno", dto.getNoticeno());

		//content에 담겨져 있는 내용 변환
		String content = dto.getContent();
		content = content.replaceAll(" ", "&nbsp;");//공백
		content = content.replaceAll("\"", "&quot;");
		content = content.replaceAll("'", "&apos;");
		content = content.replaceAll("<", "&lt;");
		content = content.replaceAll(">", "&gt;");
		content = content.replaceAll("\r\n", "<br>");//줄바꿈
		mav.addObject("content", content);
		return mav;
		}//insert() end
	
	//공지사항 수정하기
	@RequestMapping(value = "/notice_updateproc.do")
	public String notice_updateproc(@ModelAttribute NoticeDTO dto) {
		ndao.update(dto);
		return "redirect:/notice_list.do";
	}//insert() end
	
	//공지사항 삭제하기
	@RequestMapping(value = "/notice_delete.do")
	public String notice_delete(int noticeno) {
			ndao.delete(noticeno);
			return "redirect:/notice_list.do";
		}//insert() end

	//FAQ 이동
	@RequestMapping(value = "/faq_list.do")
	public String faq_list(Model model, HttpServletRequest req) {
		int page = 1;
		if (req.getParameter("page")!=null) {
			page = Integer.parseInt(req.getParameter("page"));
		}
		int countList = 10;
		int countPage = 5;
		int totalCount = fdao.totalCount();
		int totalPage = totalCount / countList;
		ArrayList<Integer> listPage = new ArrayList<>();
		
		if (totalCount % countList > 0) {
		    totalPage++;
		}

		//작성된 글이 아무것도 없을 때 page값이 0이됨
		//if 조건에 totalPage가 0이 아닐때라는 조건을 추가해줬음
		if (totalPage < page && totalPage != 0) {
		    page = totalPage;
		}

		int startPage = ((page - 1) / 10) * 10 + 1; //1
		
		int endPage = startPage + countPage - 1; //

		if (endPage > totalPage) {
		    endPage = totalPage;
		}
		
		for(int iCount=startPage; iCount <= endPage; iCount++) {
			listPage.add(iCount);
		}
		model.addAttribute("page", page);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("listPage", listPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		int currentPage = (page-1)*10;
		List<FaqDTO> list = fdao.list(currentPage); 
		model.addAttribute("list",list);
		return "cs/faq_list";
	}//insert() end
	
	//FAQ 폼 가져오기
	@RequestMapping(value = "/faq_form.do")
	public String faq_form() {
		return "cs/faq_form";
	}//insert() end
	
	//FAQ 작성하기
	@RequestMapping(value = "/faq_insert.do")
	public String faq_insert(@ModelAttribute FaqDTO dto, HttpServletRequest req) {
		fdao.insert(dto);
		return "redirect:/faq_list.do";
	}//insert() end
	
	//FAQ 수정폼 가져오기
	@RequestMapping(value = "/faq_update.do")
	public ModelAndView faq_update(int faqno) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cs/faq_update");
		mav.addObject("dto", fdao.detail(faqno));
		return mav;
	}//insert() end
	
	//FAQ 수정하기
		@RequestMapping(value = "/faq_updateproc.do")
		public String faq_updateproc(@ModelAttribute FaqDTO dto) {
			fdao.update(dto);
			return "redirect:/faq_list.do";
		}//insert() end
	
	//FAQ 삭제하기
		@RequestMapping(value = "/faq_delete.do")
		public String faq_delete(int faqno) {
			fdao.delete(faqno);
			return "redirect:/faq_list.do";
		}//insert() end
		
		
		//FAQ 상세보기
		@RequestMapping(value = "/faq_detail.do")
		public ModelAndView faq_detail(int faqno) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("cs/faq_detail");
			FaqDTO dto = fdao.detail(faqno);
			mav.addObject("title", dto.getTitle());
			mav.addObject("faqno", dto.getFaqno());
			//content에 담겨져 있는 내용 변환
			String content = dto.getContent();
			content = content.replaceAll(" ", "&nbsp;");//공백
			content = content.replaceAll("\"", "&quot;");
			content = content.replaceAll("'", "&apos;");
			content = content.replaceAll("<", "&lt;");
			content = content.replaceAll(">", "&gt;");
			content = content.replaceAll("\r\n", "<br>");//줄바꿈
			mav.addObject("content", content);
			return mav;
		}//insert() end	
}
