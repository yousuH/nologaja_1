<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Date today = new Date ( );
	Date tomorrow = new Date ( today.getTime ( ) + (long) ( 1000 * 60 * 60 * 24 ) );
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	String tdy = df.format(today);
	
%>
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
		<h2>예약목록</h2>
		<br>
		
		<c:if test="${sessionScope.uid != null}">
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
						<th class="text-center">결제상태</th>
						<th class="text-center">리뷰작성</th>
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
							<%--리뷰작성완료시 리뷰수정 삭제버튼 출력 --%>
							<c:set var="today" value="<%=tdy %>" />
							<c:choose>				
							<c:when test="${BkDTO.pay_st == 'B'}">
								<c:choose>
									<c:when test="${BkDTO.ck_out < today }">
								<td><a href="rvinsert.do?roomNumber=${BkDTO.roomNumber}&hotelName=${BkDTO.hotelName}&roomName=${BkDTO.roomName}">리뷰작성</a>
									</c:when>
								<c:otherwise>
									<td>퇴실이후에 작성가능</td>
								</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<td>퇴실이후에 작성가능</td>
							</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</form>
		</c:if>
		<c:if test="${sessionScope.suid != null}">
		<form name="bklist" id="bklist" method="post" action="bkdetail.do">
			<input type="hidden" name="roomNumber" id="roomNumber" value="${BkDTO.roomNumber}">
			<input type="hidden" name="suid" id="suid" value="${sessionScope.suid}">
			
			<table class="table table-hover text-center">
				<thead>
					<tr>
						<th>예약번호</th>
						<th class="text-center">아이디</th>
						<th class="text-center">숙소명/방이름</th>
						<th class="text-center">인원수</th>
						<th class="text-center">체크인</th>
						<th class="text-center">체크아웃</th>
						<th class="text-center">총가격</th>
						<th class="text-center">결제상태</th>
						<th class="text-center">요청사항</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="BkDTO" items="${list}">
						<c:if test="${BkDTO.ck_in != null}">
							<tr>
								<td><a href="bkdetail.do?bk_num=${BkDTO.bk_num}">${BkDTO.bk_num}</td>
								<td>${BkDTO.uid}</td>
								<td>
									${BkDTO.hotelName}/${BkDTO.roomName}
								</td>
								<td>${BkDTO.maxGuest}</td>
								<td>${BkDTO.ck_in}</td>
								<td>${BkDTO.ck_out}</td>
								<td>${BkDTO.fee}원</td>
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
								<td><strong>${BkDTO.request}</strong></td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			
		</form>
		</c:if>
	
	</div>
   
<%@ include file="../footer.jsp" %>