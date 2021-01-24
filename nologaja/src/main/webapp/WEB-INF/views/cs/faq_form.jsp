<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="./resources/css/mypage.css">
    <!-- 메인내용 -->
   	<div class="mp_sidenav">
		<a href="inquiry_list.do">예약목록</a>	  
	  	<a href="notice_list.do">장바구니</a>	  	  
	  	<a href="faq_list.do">숙소등록</a>
	</div>
   	<!-- 
   	
   	 -->
   	<div class="mp_main">
	   	<h3 style="padding-left: 37%">FAQ 작성</h3>
	   	<div class="container">
	  		<form class="form-horizontal" action="faq_insert.do" method="post">
	    		<div class="form-group">
	      			<label class="control-label col-sm-2" for="title">제목 : </label>
	      			<div class="col-sm-10">
						<input type="text" class="form-control ms-1" id="title" name="title" placeholder="Enter title">        			
	      			</div>
	    		</div>
	    		<div class="form-group">
	      			<label class="control-label col-sm-2" for="content">내용: </label>
	      			<div class="col-sm-10">
	        			<textarea class="form-control" id="content" name="content" rows="5" cols="30" placeholder="Enter content"></textarea>
	      			</div>
	    		</div>
	    		<div class="form-group">        
	    			<div class="col-sm-offset-2 col-sm-10">
	        			<button type="submit" class="btn btn-secondary">입력</button>
	        			<button type="reset" class="btn btn-secondary">초기화</button>
	        			<button type="button" class="btn btn-secondary" onclick="location.href='faq_list.do'">목록</button>
	      			</div>
	    		</div>
	  		</form>
		</div>
	</div>
<%@ include file="../footer.jsp" %>