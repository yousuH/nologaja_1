<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="./resources/css/mypage.css">

    <!-- 메인내용 -->
	<div class="mp_sidenav">
	  <a href="mypage.do"><strong>예약목록</strong></a>
	  <c:if test="${sessionScope.uid != null }">
	  <a href="cartfolderlist.do">장바구니</a>
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
		<br>
		<form name="bklist" id="bklist" method="post" action="bkdetail.do">
			<input type="hidden" name="roomNumber" id="roomNumber" value="${BkDTO.roomNumber}">
			<input type="hidden" name="uid" id="uid" value="${sessionScope.uid}">
			
			<table class="table table-hover text-center">
				<thead>
					<tr>
						<th>예약번호</th>
						<th class="text-center">숙소명/방이름</th>
						<th class="text-center">인원수</th>
						<th class="text-center">체크인</th>
						<th class="text-center">체크아웃</th>
						<th class="text-center">총가격</th>
						<th class="text-center">결제수단</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="BkDTO" items="${list}">
						<tr>
							<td><a href="bkdetail.do?bk_num=${BkDTO.bk_num}">${BkDTO.bk_num}</td>
							<td>
								${BkDTO.hotelName}/${BkDTO.roomName}
							</td>
							<td>${BkDTO.maxGuest}</td>
							<td>${BkDTO.ck_in}</td>
							<td>${BkDTO.ck_out}</td>
							<td>${BkDTO.fee}</td>
							<td>${BkDTO.pay}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</form>
	
	</div>
   
   
   <script>

   
   </script>
<%@ include file="../footer.jsp" %>