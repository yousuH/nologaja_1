package kr.co.nologaja.cs;

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
	
	//고객센터 이동
	@RequestMapping(value = "/inquiry_list.do")
	public String inquiry_main(Model model) {
		List<InquiryDTO> list = idao.list();
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
		mav.addObject("ugrd", ugrd);
		//일반회원, 판매회원 구분해서 id값 저장
		if (suid==null) {
			mav.addObject("id", uid);
		} else if(uid==null){
			mav.addObject("id", suid);
		}
		return mav;
	}//insert() end
	
	//문의사항 작성하기
	@RequestMapping(value = "/inquiry_insert.do")
	public ModelAndView inquiry_insert(@ModelAttribute InquiryDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cs/inquiry_list");
		idao.insert(dto);
		return mav;
	}//insert() end
	
	
	
	//공지사항 폼 가져오기
	@RequestMapping(value = "/notice_form.do")
	public String notice_form() {
		return "cs/notice_form";
	}//insert() end
	
	//공지사항 작성하기
	@RequestMapping(value = "/notice_insert.do")
	public ModelAndView notice_insert(@ModelAttribute NoticeDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cs/notice_list");
		ndao.insert(dto);
		return mav;
	}//insert() end
		
	//공지사항 목록가져오기
	@RequestMapping(value = "/notice_list.do")
	public String notice_list(Model model) {
		List<NoticeDTO> list = ndao.list();
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
	public ModelAndView notice_updateproc(int noticeno) {
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
	
	//공지사항 삭제하기
	@RequestMapping(value = "/notice_delete.do")
	public ModelAndView notice_delete(int noticeno) {
			ModelAndView mav = new ModelAndView();
			ndao.delete(noticeno);
			mav.setViewName("cs/notice_list");
			return mav;
		}//insert() end

	//FAQ 이동
	@RequestMapping(value = "/faq_list.do")
	public String faq_list(Model model) {
		List<FaqDTO> list = fdao.list();
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
	public ModelAndView faq_insert(@ModelAttribute FaqDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cs/faq_list");
		fdao.insert(dto);
		return mav;
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
		public ModelAndView faq_updateproc(@ModelAttribute FaqDTO dto) {
			ModelAndView mav = new ModelAndView();
			fdao.update(dto);
			mav.setViewName("cs/faq_list");
			return mav;
		}//insert() end
	
	//FAQ 삭제하기
		@RequestMapping(value = "/faq_delete.do")
		public ModelAndView faq_delete(int faqno) {
			ModelAndView mav = new ModelAndView();
			fdao.delete(faqno);
			mav.setViewName("cs/faq_list");
			return mav;
		}//insert() end
}
