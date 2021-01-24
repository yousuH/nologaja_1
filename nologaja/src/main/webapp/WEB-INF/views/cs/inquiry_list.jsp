<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="./resources/css/mypage.css">

<!-- 메인내용 -->
<!-- <div>
	<a href="inquiry_list.do">문의하기</a> <a href="notice_list.do">공지사항</a> <a
		href="faq_list.do">FAQ</a> <a href="inquiry_form.do">문의사항작성</a>  <a href="faq_form.do">FAQ작성</a>
</div> -->
	<div class="mp_sidenav">
		<a href="inquiry_list.do">문의사항</a>	  
	  	<a href="notice_list.do">공지사항</a>	  	  
	  	<a href="faq_list.do">자주 하는 질문</a>
	</div>
	
	<div class="mp_main">
		<h3 style="padding-left: 37%">문의사항 목록</h3>
		<div class="container">
			<div class="col-lg-2"></div>
			<div class="col-lg-10">
				<div style="background: #f8f8f8 !important" class="jumbotron"
					style="padding-top:20px;'">
					<table class="table table-bordered" style="text-align: center;">
							<tr class="head table-secondary">
								<th scope="col" style="width: 10%">번호</th>
								<th scope="col" style="width: 55%">제목</a></th>
								<th scope="col" style="width: 15%">작성자</th>
								<th scope="col" style="width: 20%">작성일</th>
							</tr>
							<c:forEach var="dto" items="${list}">
									<tr>
										<td>${dto.inquiryno}</td>
										<td style="text-align: left;"><a href="inquiry_detail.do?inquiryno=${dto.inquiryno}">${dto.title}</a></td>
										<td>${dto.id}</td>
										<td><fmt:formatDate value="${dto.wdate}"
												pattern="yyyy-MM-dd HH:mm" /></td>
									</tr>
							</c:forEach>
							<tr>
								<td colspan="4">
									<c:if test="${startPage > 1}">
										<a href="?page=1">처음</a>
									</c:if>
									<c:if test="${page > 1}">
										<a href="?page=${page-1}">이전</a>
									</c:if>	
									<c:forEach var="listPage" items="${listPage}">
										<c:choose>
											<c:when test="${listPage eq page}">
												<span><b>${listPage}</b></span>
											</c:when>
											<c:otherwise>
												<span>${listPage}</span>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${page < totalPage}">
										<a href="?page=${page+1}">다음</a>
										<!-- <input type="button" onclick="location='inquiry_list.do?page=2'"> -->
										
									</c:if>
									<c:if test="${endPage < totalPage}">
										<a href="?page=${totalPage}">끝</a>
									</c:if>
								</td>
							</tr>
					</table>
					
					<c:choose>
						<c:when test="${sessionScope.ugrd eq 'C1' or sessionScope.ugrd eq 'B1'}">
							<input type="button" class="btn btn-secondary" onclick="location='inquiry_form.do'" value="작성하기">
						</c:when>
					</c:choose>
				</div>
			</div>
			<div class="col-lg-1"></div>
		</div>
	</div>
<%@ include file="../footer.jsp"%>