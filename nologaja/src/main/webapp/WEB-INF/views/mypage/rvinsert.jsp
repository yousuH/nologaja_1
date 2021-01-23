<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="./resources/css/mypage.css">
	
    <!-- 메인내용 -->
	<div class="mp_sidenav">
	  <a href="mypage.do"><strong>예약목록</strong></a>
	  <c:if test="${sessionScope.uid != null }">
	  <a href="cartfolderlist.do">찜한숙소</a>
	  </c:if>
	  <c:if test="${sessionScope.suid != null }">
	  <a href="hotelins.do">숙소등록</a>
	  <a href="hotellist.do">숙소목록</a>
	  </c:if>
	  <a href="updateform.do">회원정보수정</a>
	  <a href="delete.do">회원탈퇴</a>
	  <a href="inquirylist.do">문의내역</a>
	</div>
	
	<div class="mp_main" style="min-height: 500px" >
		<h2>리뷰작성</h2>
		<br>
		<form name="review" id="review" method="post" action="rvinsertproc.do">
		<input type="hidden" name="roomNumber" id="roomNumber" value="${param.roomNumber}">
		<input type="hidden" name="uid" id="uid" value="${sessionScope.uid}">
		<table class="center">
			<tr>
				<th>숙소명/방이름</th>
				<td>
					<input type="text" name="hotelName" id="hotelName" value="${param.hotelName}" readonly>/
					<input type="text" name="roomName" id="roomName" value="${param.roomName}" readonly>
				</td>
			</tr>
			<tr>
				<th>간단후기</th>
				<td><textarea name="content" id="content" rows="9" cols="50" required></textarea></td>
			</tr>
			<tr>
				<th>청결도</th>
				<td><input type="number" name="stars_clean" id="stars_clean" value="0" min="0" max="10" required> / 10</td>
			</tr>
			<tr>
				<th>접근성</th>
				<td><input type="number" name="stars_location" id="stars_location" value="0" min="0" max="10" required> / 10</td>
			</tr>
			<tr>
				<th>가성비</th>
				<td><input type="number" name="stars_costeff" id="stars_costeff" value="0" min="0" max="10" required> / 10</td>
			</tr>
		</table>
		<input type="submit" value="작성완료">
		
	</form>
	
	</div>
   
<%@ include file="../footer.jsp" %>