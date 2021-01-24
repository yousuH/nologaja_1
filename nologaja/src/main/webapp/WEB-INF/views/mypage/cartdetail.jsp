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
		
		<table class="table table-hover text-center">
			<tr>
				<td>숙소명</td>
				<td>인원</td>
				<td>체크인</td>
				<td>체크아웃</td>
				<td>박수</td>
				<td>총금액</td>
				<td>삭제</td>
			</tr>
			
			<c:forEach var="cartitem" items="${cartitems}">
				<tr>
					<td><a href="searchdetail.do?roomNumber=${cartitem.roomNumber}&ck_in=${cartitem.ck_in}&ck_out=${cartitem.ck_out}&maxGuest=${cartitem.guests}&night=${cartitem.night}&fee=${cartitem.totalFee}">${cartitem.roomName}</td>
					<td>${cartitem.guests}</td>
					<td>${cartitem.ck_in}</td>
					<td>${cartitem.ck_out}</td>
					<td>${cartitem.night}</td>
					<td>${cartitem.totalFee}</td>
					<td><input type="button" value="삭제" onclick="location.href='cartdelete.do?ct_num=${cartitem.ct_num}&ctFolder_num=${param.ctFolder_num}'"></td>
				</tr>
			</c:forEach>
			
		</table>
	</div>

</div>


<script>
	
</script>
<%@ include file="../footer.jsp"%>