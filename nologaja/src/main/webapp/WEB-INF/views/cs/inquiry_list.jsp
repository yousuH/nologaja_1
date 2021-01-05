<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../header.jsp"%>

<!-- 메인내용 -->
<div>
	<a href="inquiry_list.do">문의하기</a> <a href="notice_list.do">공지사항</a> <a
		href="faq_list.do">FAQ</a> <a href="inquiry_form.do">문의사항작성</a> <a
		href="notice_form.do">공지사항작성</a> <a href="faq_form.do">FAQ작성</a>
</div>
<h3>공지사항리스트</h3>
<div class="container">
	<div class="col-lg-2"></div>
	<div class="col-lg-8">
		<div style="background: #f8f8f8 !important" class="jumbotron"
			style="padding-top:20px;'">
			<table class="table table-bordered">
				<tr class="head">
					<td style="width: 12%">번호</td>
					<td style="width: 43%">제목</td>
					<td style="width: 25%">작성자</td>
					<td style="width: 20%">작성일</td>
				</tr>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.inquiryno}</td>
						<td>${dto.title}</td>
						<td>${dto.id}</td>
						<td><fmt:formatDate value="${dto.wdate}"
								pattern="yyyy-MM-dd HH:mm" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="col-lg-2"></div>
</div>
<%@ include file="../footer.jsp"%>