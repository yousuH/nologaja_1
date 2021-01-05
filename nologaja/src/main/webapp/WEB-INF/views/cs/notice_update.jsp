<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

    <!-- 메인내용 -->
	<div>
		<a href="inquiry.do">문의하기</a>
		<a href="notice.do">공지사항</a>
		<a href="faq.do">FAQ</a>
   	</div>
   	
   	<h3>공지사항 작성</h3>
   	<div class="container">
   		<input type="hidden" name="noticeno" value="${noticeno}"
  		<form class="form-horizontal" name="noticeForm" action="notice_update.do" method="post">
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
        			<button type="submit" class="btn btn-default">입력</button>
        			<button type="reset" class="btn btn-default">초기화</button>
        			<button type="button" class="btn btn-default" onclick="location.href='noticeList.jsp'">목록</button>
      			</div>
    		</div>
  		</form>
	</div>
<%@ include file="../footer.jsp" %>