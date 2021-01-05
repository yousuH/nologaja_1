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
</div>
<h3>공지사항리스트</h3>
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
<%@ include file="../footer.jsp"%>