<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="./resources/css/mypage.css">

<!-- 메인내용 -->
<div class="mp_sidenav">
	<a href="mypage.do">예약목록</a>
	<c:if test="${sessionScope.uid != null }">
		<a href="cartfolderlist.do"><strong>찜한숙소</strong></a>
	</c:if>
	<c:if test="${sessionScope.suid != null }">
		<a href="hotelins.do">숙소등록</a>
		<a href="hotellist.do">숙소목록</a>
	</c:if>
	<a href="updateform.do">회원정보수정</a> <a href="delete.do">회원탈퇴</a> <a
		href="inquirylist.do">문의내역</a>
</div>

<div class="mp_main">
	<div>

		<table border="1px">
			<tr>
				<td>ct_num</td>
				<td>roomNumber</td>
				<td>guests</td>
				<td>ck_in</td>
				<td>ck_out</td>
				<td>night</td>
				<td>totalFee</td>
				<td>ctFolder_name</td>
				<td>ctFolder_num</td>
			</tr>

			<c:forEach var="cartitem" items="${cartitems}">
				<tr>
					<td>${cartitem.ct_num}</td>
					<td>${cartitem.roomNumber}</td>
					<td>${cartitem.guests}</td>
					<td>${cartitem.ck_in}</td>
					<td>${cartitem.ck_out}</td>
					<td>${cartitem.night}</td>
					<td>${cartitem.totalFee}</td>
					<td>${cartitem.ctFolder_name}</td>
					<td>${cartitem.ctFolder_num}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</div>


<script>
	
</script>
<%@ include file="../footer.jsp"%>