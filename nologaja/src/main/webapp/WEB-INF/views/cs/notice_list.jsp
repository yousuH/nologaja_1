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
		<h3>공지사항리스트</h3>
		<div class="container">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<div style="background: #f8f8f8 !important" class="jumbotron"
					style="padding-top:20px;'">
					<table class="table table-bordered">
						<tr class="head">
							<td style="width: 12%">번호</td>
							<td style="width: 68%">제목</td>
							<td style="width: 20%">작성일</td>
						</tr>
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.noticeno}</td>
								<td><a href="notice_detail.do?noticeno=${dto.noticeno}">${dto.title}</a></td>
								<td><fmt:formatDate value="${dto.wdate}"
										pattern="yyyy-MM-dd HH:mm" /></td>
							</tr>
						</c:forEach>
					</table>
					<c:if test="${sessionScope.ugrd eq 'A1' }">
						<input class="btn btn-default" type="button" value="작성하기"	
								onclick="location.href='notice_form.do'">
					</c:if>
				</div>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>
<%@ include file="../footer.jsp"%>