<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
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
	  <a href="updateform.do">회원정보수정</a>
	  <a href="delete.do">회원탈퇴</a>
	  <a href="inquirylist.do"><strong>문의내역</strong></a>
	</div>
	
	<div class="mp_main" style="min-height: 500px" >
		<h2>문의내역</h2>
		<br>
		<form name="inquiryhost_list" id="inquiryhost_list" method="post" action="**">
			
			<table class="table table-hover text-center">
				<thead>
					<tr>
						<th>문의번호</th>
						<th class="text-center">숙소명/방이름</th>
						<th class="text-center">인원수</th>
						<th class="text-center">체크인</th>
						<th class="text-center">체크아웃</th>
						<th class="text-center">총가격</th>
						<th class="text-center">결제수단</th>
						<th class="text-center">결제상태</th>
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
							<td>${BkDTO.fee}원</td>
							<c:choose>
								<c:when test="${BkDTO.pay == '1'}">
									<td>무통장입금</td>
								</c:when>
								<c:when test="${BkDTO.pay == '2'}">
									<td>카드결제</td>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${BkDTO.pay_st == 'A'}">
									<td>결제대기</td>
								</c:when>
								<c:when test="${BkDTO.pay_st == 'B'}">
									<td>결제완료</td>
								</c:when>
								<c:when test="${BkDTO.pay_st == 'C'}">
									<td>예약취소완료</td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</form>
	
	</div>
   
   
   <script>

   
   </script>
<%@ include file="../footer.jsp" %>