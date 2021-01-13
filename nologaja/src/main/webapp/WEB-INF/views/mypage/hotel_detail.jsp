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
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
				<table class="table table-bordered">
			<tr>
				<td class="head">호텔명</td>
				<td>${dto.hotelName}</td>
			</tr>
			<tr>
				<td class="head">호텔번호</td>
				<td>${dto.hotelNumber}</td>
			</tr>
			<tr>
				<td class="head" style="vertical-align: middle;" >사진</td>
				<td><img style="width: 15%; cursor: pointer;" src="${pageContext.request.contextPath}/resources/img/hotel/${savefile}" onclick="big()" name="pic" id="pic"/></td>           	
			</tr>
			<tr>
				<td class="head">우편번호</td>
				<td>${dto.zipcode}</td>
			</tr>
			<tr>
				<td class="head">주소</td>
				<td>${dto.addr1}</td>
			</tr>
			<tr>
				<td class="head">숙소설명</td>
				<td>${dto.hotelInform}</td>
			</tr>
			<tr>
				<td class="head">방목록</td>
				<td>
					<c:forEach var="dto" items="${list}">
						<a href="room_detail.do?roomNumber=${dto.roomNumber}">${dto.roomName},</a>
					</c:forEach>
				</td>
			</tr>
		</table>
				<input  class="btn btn-default" type="button" value="방추가" onclick="location.href='add_room.do?hotelNumber=${dto.hotelNumber}&hotelName=${dto.hotelName}'">
		</div>
		<div class="col-lg-2"></div>
	</div>	
<script>
function big(){
	var width = document.getElementById("pic").naturalWidth;
	var height = document.getElementById("pic").naturalHeight;
	var src = document.getElementById("pic").src;
	window.open(src,"","width="+width+",height="+height);
}
</script>
<%@ include file="../footer.jsp"%> 