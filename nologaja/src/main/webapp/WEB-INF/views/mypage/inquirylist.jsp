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

	<c:if test="${sessionScope.suid !=null }">
 	<select name="jump" onchange="location.href=this.value" class="form-select" aria-label="Default select example">
 	<option selected="selected">선택하세요</option>
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
	</c:if>
	<c:if test="${sessionScope.uid !=null }">
		<form name="inquiryhost_list" id="inquiryhost_list" method="post" action="**">

			<table class="table table-hover text-center">
				<thead>
					<tr>
						<th class="text-center">숙소명</th>
						<th class="text-center">답변상태</th>
						<th class="text-center">제목</th>
						<th class="text-center">작성일</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="IHlist" items="${IHlist}">
						<tr>
							<td>${IHlist.roomName}</td>
							<c:choose>
								<c:when test="${IHlist.rp_st eq 'Y'}">
									<td>답변완료</td>
								</c:when>
								<c:when test="${IHlist.rp_st eq 'N'}">
									<td>미답변</td>
								</c:when>
							</c:choose>
							<td><a href="ihdetail.do?grpno=${IHlist.grpno}">${IHlist.title}</td>
							<td>${IHlist.swdate}</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</form>
	</c:if>

</div>


<script>
	
</script>
<%@ include file="../footer.jsp"%>