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
		<h3>FAQ리스트</h3>
		<div class="container">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<div style="background: #f8f8f8 !important" class="jumbotron"
					style="padding-top:20px;'">
					<table class="table table-bordered">
						<tr class="head">
							<td style="width: 30%">질문</td>
							<td style="width: 70%">답변</td>
						</tr>
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.title}</td>
								<td>${dto.content}</td>
								<td><a href="faq_update.do?faqno=${dto.faqno}">수정</a></td>
								<td><a href="faq_delete.do?faqno=${dto.faqno}">삭제</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>
<%@ include file="../footer.jsp"%>