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
		<h3 style="padding-left: 29%">공지사항 상세보기</h3>
		<div class="container">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<div style="background: #f8f8f8 !important" class="jumbotron"
					style="padding-top:20px;'">
					<table class="table table-bordered">
						<tr>
							<th style="text-align: center;" scope="col" class="table-secondary">번호</th>
							<td style="text-align: left;">${noticeno}</td>
						</tr>
						<tr>
							<th style="text-align: center;" scope="col" class="table-secondary">제목</th>
							<td style="text-align: left;">${title}</td>
						</tr>
						<tr>
							<th style="vertical-align: middle; height: 300px; text-align: center;" class="table-secondary" scope="col">내용</th>
							<td style="text-align: left;">${content}</td>
						</tr>
						<tr>
							<th style="text-align: center;" scope="col" class="table-secondary">작성일</th>
							<td><fmt:formatDate value="${wdate}" pattern="yyyy-MM-dd HH:mm" /></td>
							
						</tr>
					</table>
					<c:if test="${sessionScope.ugrd eq 'A1' }">
						<input class="btn btn-secondary" type="button" value="수정"
							onclick="location.href='notice_update.do?noticeno=${noticeno}'">
						<input class="btn btn-secondary" type="button" value="삭제"	
							onclick="location.href='notice_delete.do?noticeno=${noticeno}'">
					</c:if>
					<button class="btn btn-secondary" type="button"
						onclick="location.href='notice_list.do'">목록</button>
				</div>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>
<%@ include file="../footer.jsp"%>