<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="./resources/css/mypage.css">


<style>

input[id*="popup"]{
	display:none;
}

input[id*="popup"] + label {
	display: inline-block;
	padding: 10px;
	background: #ffcd41;
	border-radius: 2%;
	color: #fff;
}

input[id*="popup"] + label + div {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 100;
}

input[id*="popup"] + label + div {
	opacity: 0; visibility: hidden;transition:all 1s;
}

input[id*="popup"]:checked + label + div {
	opacity: 1;visibility: visible;
}

input[id*="popup"] + label + div > div {
	position: absolute;
	top: 50%;
	left: 50%;
	transform:translate(-50%, -50%);
	width: 500px;
	height: 300px;
	background: #fff;
	border-radius: 5%;
	z-index: 2;
	text-align: center;
	align-content: center;
	padding-top: 60px;
}

input[id*="popup"] + label + div > div > label {
	position: absolute;
	top: 0%;
	left: 0%;
	transform:translate(-40%,-40%);
	padding: 12px;
	color : #fff;
	background: #dd5347;
	border-radius: 100%;
	z-index: 1;
}

input[id*="popup"] + label + div > label {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0,0,0,.5);
	z-index: 1;
}

</style>


<!-- 메인내용 -->
<div class="mp_sidenav">
	<a href="mypage.do">예약목록</a>
	<c:if test="${sessionScope.uid != null }">
		<a href="cartfolderlist.do"><strong>찜한숙소</strong></a>
	</c:if>
	<c:if test="${sessionScope.suid != null }">
		<a href="hotelins.do">숙소등록</a>
		<a href="hotellist.do">숙소목록</a>
	</c:if>
	<a href="updateform.do">회원정보수정</a> <a href="delete.do">회원탈퇴</a> <a
		href="inquirylist.do">문의내역</a>
</div>




<!-- 메인내용 -->
<div class="mp_main">

<h2>저장 목록</h2>
	<div>
		<form id="ctfolderform" name="ctfolderform" action="addcartfolder.do" method="post">
				<!-- 찜한숙소 --> 
				<input type="checkbox" id="popup"> 
				<label for="popup">목록 만들기</label>
				<div>
					<div>
						<label for="popup"><strong>Ⅹ</strong></label> 
						<span>목록 만들기</span><br><br><br>
						
						<input type="hidden" name="uid" id="uid" value="${sessionScope.uid}">
						<input type="text" name="ctFolder_name" id="ctFolder_name" placeholder="이름">
						<br><br>
						<input type="submit" value="저장" style="width: 90%">

					</div>
					<label for="popup"></label>
				</div>
		</form>


		<c:forEach var="cartFolder" items="${cartFolders}">
			<div>
				<a href="cartdetail.do?ctFolder_num=${cartFolder.ctFolder_num}">${cartFolder.ctFolder_name}</a>
			</div>
		</c:forEach>


	</div>
</div>

<%@ include file="../footer.jsp"%>