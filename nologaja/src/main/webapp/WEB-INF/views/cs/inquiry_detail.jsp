<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../header.jsp"%>

<!-- 메인내용 -->
<div>
	<a href="inquiry.do">문의하기</a> <a href="notice.do">공지사항</a> <a
		href="faq.do">FAQ</a>
</div>


<div class="container">
	<div class="col-lg-2"></div>
	<div class="col-lg-8">
		<div style="background: #f8f8f8 !important" class="jumbotron"
			style="padding-top:20px;'">
			<table class="table table-bordered">
				<tr>
					<td class="head">번호</td>
					<td style="text-align: left;">${inquiryno}</td>
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
					<td><fmt:formatDate value="${wdate}"
								pattern="yyyy-MM-dd HH:mm" /></td>
					
				</tr>
			</table>

			<input class="btn btn-default" type="button" value="수정"
				onclick="location.href='inquiry_update.do?inquiryno=${inquiryno}'">
			<input class="btn btn-default" type="button" value="삭제"	
				onclick="location.href='inquiry_delete.do?inquiryno=${inquiryno}'">
			<input class="btn btn-default" type="button" value="답변"	
					onclick="location.href='inquiry_reply.do?inquiryno=${inquiryno}'">
			<button class="btn btn-default" type="button"
				onclick="location.href='noticeList.jsp'">목록</button>
		</div>
	</div>
	<div class="col-lg-2"></div>
</div>
<%@ include file="../footer.jsp"%>