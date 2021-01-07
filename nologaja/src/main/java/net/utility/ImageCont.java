package net.utility;

import java.io.File;
import java.io.IOException;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
public class ImageCont {
	
	@Inject
	imageDAO idao;
	
	
	
	@RequestMapping(value="image.do")
	public String image() {
		return "image2";
	}
	
	@RequestMapping(value = "requestupload.do")
    public String requestupload1(MultipartHttpServletRequest mtfRequest) {
//        String src = mtfRequest.getParameter("src");
        MultipartFile mf = mtfRequest.getFile("file");

        String path = "/Users/moon/git/nologaja_1/nologaja/src/main/webapp/resources/img/front/";

        String originFileName = mf.getOriginalFilename(); // 원본 파일 명
        
        String safeFile = path + System.currentTimeMillis() + originFileName;
//      저장 될 파일 명
        String saveFIle = safeFile.substring(safeFile.lastIndexOf("/")+1);
        idao.insert(saveFIle);
        

        try {
            mf.transferTo(new File(safeFile));
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "redirect:/image.do";
    }
	@RequestMapping(value="imageproc.do")
	public String imageproc() {
		return "imageproc";
	}
	
//	 @RequestMapping(value = "requestupload2")
//	    public String requestupload2(MultipartHttpServletRequest mtfRequest) {
//	        List<MultipartFile> fileList = mtfRequest.getFiles("file");
//	        String src = mtfRequest.getParameter("src");
//	        System.out.println("src value : " + src);
//
//	        String path = "C:\\image\\";
//
//	        for (MultipartFile mf : fileList) {
//	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
//	            long fileSize = mf.getSize(); // 파일 사이즈
//
//	            System.out.println("originFileName : " + originFileName);
//	            System.out.println("fileSize : " + fileSize);
//
//	            String safeFile = path + System.currentTimeMillis() + originFileName;
//	            try {
//	                mf.transferTo(new File(safeFile));
//	            } catch (IllegalStateException e) {
//	                // TODO Auto-generated catch block
//	                e.printStackTrace();
//	            } catch (IOException e) {
//	                // TODO Auto-generated catch block
//	                e.printStackTrace();
//	            }
//	        }
//
//	        return "redirect:/";
//	    }



}//class
