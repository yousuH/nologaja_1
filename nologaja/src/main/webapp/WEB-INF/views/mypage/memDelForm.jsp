<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<style>
body {
	font-family: "Lato", sans-serif;
}

.sidenav {
	width: 160px;
	position: absolute;
	z-index: 5;
	top: 70px;
	left: 0;
	overflow-x: hidden;
	padding-top: 20px;
}

.sidenav a {
	padding: 6px 8px 6px 16px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
}

.sidenav a:hover {
	color: #f1f1f1;
}

.main {
	margin-left: 160px; /* Same as the width of the sidenav */
	font-size: 28px; /* Increased text to enable scrolling */
	padding: 0px 10px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}
</style>

<!-- 메인내용 -->
<div class="sidenav">
	<a href="mypage.do">예약목록</a> <a href="hotelins.do">숙소등록</a> <a
		href="hotellist.do">숙소목록</a> <a href="updateform.do">회원정보수정</a> <a
		href="delete.do">회원탈퇴</a> <a href="inquirylist.do">문의내역</a>
</div>

<div class="main">
	<div style="height: 400px">
	<h2>회원탈퇴</h2>
	<p>비밀번호를 입력해주세요</p>
	<c:choose>
	<c:when test="${sessionScope.uid !=null }">
	<form id="delform" name="delform" action="bdelete.do">
		<p>uid</p>
	</c:when>
	<c:otherwise>
	<form id="delform" name="delform" action="sdelete.do">
		<p>suid</p>
	</c:otherwise>
	</c:choose>
		<!-- 비밂번호 일치하면 submit 되게 
		<input type="password" id="pw" name="pw" required>
		-->
		<input type="submit" value="회원탈퇴">
	</form>
	</div>
</div>


<script>

   
   </script>
<%@ include file="../footer.jsp"%>