<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./resources/css/mypage.css">    
<%@ include file="../header.jsp" %>

    <!-- 메인내용 -->
	<div class="mp_sidenav">
		<a href="inquiry_list.do">문의사항</a>	  
	  	<a href="notice_list.do">공지사항</a>	  	  
	  	<a href="faq_list.do">자주 하는 질문</a>
	</div>
   	
   	<div class="mp_main">
	   	<h3 style="padding-left: 37%">공지사항 수정</h3>
	   	<div class="container">
	  		<form class="form-horizontal" name="noticeForm" action="notice_updateproc.do" method="post">
	  		<input type="hidden" name="noticeno" value="${noticeno}">
	    		<div class="form-group">
	      			<label class="control-label col-sm-2" for="subject">제목 : </label>
	      			<div class="col-sm-10">
						<input type="text" class="form-control ms-1" id="title" name="title" value="${title}">        			
	      			</div>
	    		</div>
	    		<div class="form-group">
	      			<label class="control-label col-sm-2" for="content">내용: </label>
	      			<div class="col-sm-10">
	        			<textarea class="form-control" id="content" name="content" rows="5" cols="30">${content}</textarea>
	      			</div>
	    		</div>
	    		<div class="form-group">        
	    			<div class="col-sm-offset-2 col-sm-10">
	        			<button type="submit" class="btn btn-secondary">입력</button>
	        			<button type="reset" class="btn btn-secondary">초기화</button>
	        			<button type="button" class="btn btn-secondary" onclick="location.href='noticeList.do'">목록</button>
	      			</div>
	    		</div>
	  		</form>
		</div>
	</div>
<%@ include file="../footer.jsp" %>