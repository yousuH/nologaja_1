<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
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
	  <a href="updateform.do"><strong>회원정보수정</strong></a>
	  <a href="delete.do">회원탈퇴</a>
	  <a href="inquirylist.do">문의내역</a>
	</div>

	<div class="mj_wrap">
            <div class="mj_form-wrap">
            <!-- 일반회원 -->
	                <form id="mj_buyer" action="updateproc.do" class="mj_input-group">
	                    <input type="text" class="mj_input-field" name="uid" id="uid" value="${dto.uid}" placeholder="Enter ID" readonly>
	                    <input type="password" class="mj_input-field" name="upw" id="upw" placeholder="Enter Password" required>
	                    <input type="password" class="mj_input-field" name="reupw" id="reupw" placeholder="Check Password" required>
	                    <input type="text" class="mj_input-field" name="uname" id="uname" value="${dto.uname}" placeholder="Enter Name" required>
	                    <input type="email" class="mj_input-field" name="uemail" id="uemail" value="${dto.uemail}" placeholder="Enter Email" required>
	                    <input type="text" class="mj_input-field" name="upnb" id="upnb" value="${dto.upnb}" placeholder="Enter PhoneNumber" required>
	                    <button class="mj_submit">수정</button>
	                </form>
                <!-- 판매회원 -->
            </div>
        </div>
<%@ include file="../footer.jsp" %>