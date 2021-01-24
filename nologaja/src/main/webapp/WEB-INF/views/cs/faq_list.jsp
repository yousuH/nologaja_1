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
		<h3 style="padding-left: 37%">FAQ리스트</h3>
		<div class="container">
			<div class="col-lg-2"></div>
			<div class="col-lg-10">
				<div style="background: #f8f8f8 !important" class="jumbotron"
					style="padding-top:20px;'">
					<table class="table table-bordered">
						<tr class="head">
							<th scope="col" style="text-align: center;">Nologaja! 자주 하는 질문</th>
						</tr>
						<c:forEach var="dto" items="${list}">
							<tr>
								<td><a href="faq_detail.do?faqno=${dto.faqno}">Q.${dto.title}</a></td>
							</tr>
						</c:forEach>
						<tr>
							<td style="text-align: center;">
								<c:if test="${startPage > 1}">
									<a href=?page=1">처음</a>
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
								</c:if>
								<c:if test="${endPage < totalPage}">
									<a href="?page=${totalPage}">끝</a>
								</c:if>
							</td>
						</tr>
					</table>
					<c:if test="${sessionScope.ugrd eq 'A1' }">
						<input class="btn btn-secondary" type="button" value="작성하기"	
								onclick="location.href='faq_form.do'">
					</c:if>
				</div>
			</div>
			<div class="col-lg-1"></div>
		</div>
	</div>
<%@ include file="../footer.jsp"%>