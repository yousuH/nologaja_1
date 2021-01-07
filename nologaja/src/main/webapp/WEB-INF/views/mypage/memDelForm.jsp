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
	  <a href="hotellist.do">숙소목록</a>
	  </c:if>
	  <a href="updateform.do">회원정보수정</a>
	  <a href="delete.do"><strong>회원탈퇴</strong></a>
	  <a href="inquirylist.do">문의내역</a>
	</div>

<div class="mp_main">
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
		<input type="password" name="upw" id="upw" placeholder="비밀번호" required>
		<input type="submit" value="회원탈퇴" onclick="if( confirm('정말 회원탈퇴를하시겠습니까?') ){ href='bdelete.do?uid=${bdao.uid }'}">	
	</form>
	</div>
</div>


<script>

   
   </script>
<%@ include file="../footer.jsp"%>