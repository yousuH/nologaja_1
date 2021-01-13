<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="./resources/css/mypage.css">

    <!-- 메인내용 -->
	<div class="mp_sidenav">
	  <a href="mypage.do"><strong>예약목록</strong></a>
	  <c:if test="${sessionScope.uid != null }">
	  <a href="bookingcart.do">장바구니</a>
	  </c:if>
	  <c:if test="${sessionScope.suid != null }">
	  <a href="hotelins.do">숙소등록</a>
	  <a href="hotellist.do">숙소목록</a>
	  </c:if>
	  <a href="updateform.do">회원정보수정</a>
	  <a href="delete.do">회원탈퇴</a>
	  <a href="inquirylist.do">문의내역</a>
	</div>
	
	<div class="mp_main">
		<h2>예약목록</h2>
		<form name="bklist" id="bklist" method="post" action="bklist.do">
			<input type="hidden" name="roomNumber" id="roomNumber" value="${BkDTO.roomNumber}">
			<input type="hidden" name="uid" id="uid" value="${sessionScope.uid}">
			
			<table class="table table-hover text-center">			
				
					<tr>
						<th>예약번호</th>
						<td>${dto.bk_num}</td>
					</tr>
					<tr>
						<th class="text-center">숙소명/방이름</th>
						<td>${dto.hotelName}/${dto.roomName}</td>
					</tr>
					<tr>
						<th class="text-center">인원수</th>
						<td>${dto.maxGuest}</td>
					</tr>
					<tr>
						<th class="text-center">체크인</th>
						<td>${dto.ck_in}</td>
					</tr>
					<tr>
						<th class="text-center">체크아웃</th>
						<td>${dto.ck_out}</td>
					</tr>
					<tr>
						<th class="text-center">총가격</th>
						<td>${dto.fee}</td>
					</tr>
					<tr>
						<th class="text-center">결제수단</th>
						<td>${dto.pay}</td>
					</tr>
				
				
			</table>
			<input type="button" value="예약취소">
			
		</form>
	
	</div>
   
   
   <script>

   
   </script>
<%@ include file="../footer.jsp" %>