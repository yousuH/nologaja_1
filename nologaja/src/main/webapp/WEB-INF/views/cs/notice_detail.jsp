<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<link rel="stylesheet" href="./resources/css/mypage.css">	
<%@ include file="../header.jsp"%>

<!-- 메인내용 -->
	<div class="mp_sidenav">
		<a href="inquiry_list.do">문의사항</a>	  
	  	<a href="notice_list.do">공지사항</a>	  	  
	  	<a href="faq_list.do">자주 하는 질문</a>
	</div>

	<div class="mp_main">
		<div class="container">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<div style="background: #f8f8f8 !important" class="jumbotron"
					style="padding-top:20px;'">
					<table class="table table-bordered">
						<tr>
							<td class="head">번호</td>
							<td style="text-align: left;">${noticeno}</td>
						</tr>
						<tr>
							<td class="head">제목</td>
							<td style="text-align: left;">${title}</td>
						</tr>
						<tr>
							<td style="vertical-align: middle; height: 300px;" class="head">내용</td>
							<td style="text-align: left;">${content}</td>
						</tr>
						<tr>
							<td class="head">작성일</td>
							<td><fmt:formatDate value="${wdate}" pattern="yyyy-MM-dd HH:mm" /></td>
							
						</tr>
					</table>
					<c:if test="${sessionScope.ugrd eq 'A1' }">
						<input class="btn btn-default" type="button" value="수정"
							onclick="location.href='notice_update.do?noticeno=${noticeno}'">
						<input class="btn btn-default" type="button" value="삭제"	
							onclick="location.href='notice_delete.do?noticeno=${noticeno}'">
					</c:if>
					<button class="btn btn-default" type="button"
						onclick="location.href='notice_list.do'">목록</button>
				</div>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>
<%@ include file="../footer.jsp"%>