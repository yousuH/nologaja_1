<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="./resources/css/mypage.css">

<!-- 메인내용 -->
<div class="mp_sidenav">
	<a href="mypage.do">예약목록</a>
	<c:if test="${sessionScope.uid != null }">
		<a href="bookingcart.do">장바구니</a>
	</c:if>
	<c:if test="${sessionScope.suid != null }">
		<a href="hotelins.do">숙소등록</a>
		<a href="hotellist.do"><strong>숙소목록</strong></a>
	</c:if>
		<a href="updateform.do">회원정보수정</a> 
		<a href="delete.do">회원탈퇴</a> 
		<a href="inquirylist.do">문의내역</a>
</div>

<div class="mp_main">
	<h2>숙소목록</h2>
	<div class="container">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<!-- MypageCont -->
			<table class="table">
				<tr>
					<td></td>
           			<td>호텔이름</td>
           			<td>호텔넘버</td>		
           		</tr>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td><img style="width: 15%" src="${pageContext.request.contextPath}/resources/img/hotel/${dto.savefile}" onclick="big()" name="pic" id="pic" /></td>           			
                	<td><a href="hotel_detail.do?hotelNumber=${dto.hotelNumber}&savefile=${dto.savefile}">${dto.hotelName}</a></td>
                	<td><a href="hotel_detail.do?hotelNumber=${dto.hotelNumber}&savefile=${dto.savefile}">${dto.hotelNumber}</a></td>
           		</tr>
			</c:forEach>
			</table>
		</div>
		<div class="col-lg-1"></div>
	</div>
</div>


<script>
	
</script>
<%@ include file="../footer.jsp"%>