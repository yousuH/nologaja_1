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
				<td class="head">방이름</td>
				<td>${dto.roomName}</td>
			</tr>
			<tr>
				<td class="head">방번호</td>
				<td>${dto.roomNumber}</td>
			</tr>
			<tr>
				<td class="head" style="vertical-align: middle;" >사진</td>
				<td>
					<c:forEach var="list" items="${list}">
						<img style="width: 15%; cursor: pointer;" src="${pageContext.request.contextPath}/resources/img/room/${list.saveFile}" onclick="big()" name="pic" id="pic"/>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td class="head">방설명</td>
				<td>${dto.roomInform}</td>
			</tr>
			<tr>
				<td class="head">최대인원</td>
				<td>${dto.maxGuest}</td>
			</tr>
			<tr>
				<td class="head">편의시설</td>
				<td>${dto.conv}</td>
			</tr>
			<tr>
				<td class="head">기본가격</td>
				<td>${dto.baseCost}</td>
			</tr>
			<tr>
				<td class="head">주말가격</td>
				<td>${dto.weekCost}</td>
			</tr>
			<tr>
				<td class="head">장기투숙</td>
				<td>${dto.longCost}</td>
			</tr>
		</table>
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