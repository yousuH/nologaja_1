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
	
	<div class="mp_main">
		<h2>예약상세목록</h2>
		<br>
		<form name="bkupdate" id="bkupdate" method="post" action="bkupdate.do">
			<input type="hidden" name="roomNumber" id="roomNumber" value="${BkDTO.roomNumber}">
			<input type="hidden" name="uid" id="uid" value="${sessionScope.uid}">
			<input type="hidden" name="bk_num" id="bk_num" value="${dto.bk_num}">
			
			<table class="table table-hover text-center">			
				
					<tr>
						<th>예약번호</th>
						<td>${dto.bk_num}</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${dto.uid}</td>
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
						<th class="text-center">박수</th>
						<td>${dto.night}</td>
					</tr>
					<tr>
						<th class="text-center">요청사항</th>
						<td>${dto.request}</td>
					</tr>
					<tr>
						<th class="text-center">총가격</th>
						<td>${dto.fee}원</td>
					</tr>
					<tr>
						<th class="text-center">결제수단</th>
						<c:choose>
							<c:when test="${dto.pay == '1'}">
								<td>무통장입금</td>
							</c:when>
							<c:when test="${dto.pay == '2'}">
								<td>카드결제</td>
							</c:when>
						</c:choose>
					</tr>
					<tr>
						<th class="text-center">예약상태</th>
						<c:choose>
							<c:when test="${dto.pay_st == 'A'}">
								<td>결제대기</td>
							</c:when>
							<c:when test="${dto.pay_st == 'B'}">
								<td>결제완료</td>
							</c:when>
							<c:when test="${dto.pay_st == 'C'}">
								<td>예약취소완료</td>
							</c:when>
						</c:choose>
					</tr>
					<tr>
						<th class="text-center">요청사항</th>
						<td><strong>${BkDTO.request}</strong></td>
					</tr>
				
				
			</table>
			<c:if test="${sessionScope.uid != null}">
				<input type="button" value="예약취소" onclick="btn_no()">
			</c:if>
			<c:if test="${sessionScope.suid != null}">
				<input type="button" value="예약안받기" onclick="btn_no()">
			</c:if>
			
		</form>
	
	</div>
   
<%@ include file="../footer.jsp" %>