<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="./resources/css/mypage.css">

<!-- 메인내용 -->
<div class="mp_sidenav">
	<a href="mypage.do">예약목록</a>
	<c:if test="${sessionScope.uid != null }">
		<a href="cartfolderlist.do">찜한숙소</a>
	</c:if>
	<c:if test="${sessionScope.suid != null }">
		<a href="hotelins.do">숙소등록</a>
		<a href="hotellist.do">숙소목록</a>
	</c:if>
	<a href="updateform.do">회원정보수정</a> <a href="delete.do">회원탈퇴</a> <a
		href="inquirylist.do"><strong>문의내역</strong></a>
</div>

<div class="mp_main" style="min-height: 500px">
	<h2>문의내역</h2>
	<br>

			
 	<select name="jump" onchange="location.href=this.value" class="form-select" aria-label="Default select example">
 	<c:forEach var="list" items="${list}">
 		<option value="inquirylist.do?hotelNumber=${list.hotelNumber}">${list.hotelName}</option>
 	</c:forEach>
	</select>				
 		<table class="table table-hover text-center">
				<thead>
					<tr>
						<th class="text-center">문의자</th>
						<th class="text-center">제목</th>
						<th class="text-center">작성일</th>
						<th class="text-center">답변상태</th>
					</tr>
				</thead>
				
				<tbody>
						<c:forEach var="list2" items="${list2}">
						<tr>
								<td>${list2.uid}</td>
								<td>
									${list2.title}
								</td>
								<td><fmt:formatDate value="${list2.wdate}"
									pattern="yyyy-MM-dd HH:mm" /></td>
								<c:choose>
									<c:when test="${list2.rp_st eq 'Y'}">
										<th class="text-center">답변O&nbsp;&nbsp;<a href="searchdetail.do?roomNumber=${list2.roomNumber}">이동하기</a></th>
									</c:when>
									<c:when test="${list2.rp_st eq 'N'}">
										<th class="text-center">답변X&nbsp;&nbsp;<a href="searchdetail.do?roomNumber=${list2.roomNumber}">이동하기</a></th>
									</c:when>
								</c:choose>
						</tr>
						</c:forEach>
				</tbody>
			</table>
	
	
	
</div>


<script>
	
</script>
<%@ include file="../footer.jsp"%>