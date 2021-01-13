<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- 메인내용 -->

<style>

input[id*="popup"]{
	display:none;
}

input[id*="popup"] + label {
	display: inline-block;
	padding: 14px;
	background: #ffcd41;
	border-radius: 100%;
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
	background: rgba(0,0,0,.2);
	z-index: 1;
}







input[id*="popup2"]{
	display:none;
}

input[id*="popup2"] + label {
	display: inline-block;
	padding: 14px;
	background: #ffcd41;
	border-radius: 100%;
	color: #fff;
}

input[id*="popup2"] + label + div {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 100;
}

input[id*="popup2"] + label + div {
	opacity: 0; visibility: hidden;transition:all 1s;
}

input[id*="popup2"]:checked + label + div {
	opacity: 1;visibility: visible;
}

input[id*="popup2"] + label + div > div {
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
}

input[id*="popup2"] + label + div > div > label {
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

input[id*="popup2"] + label + div > label {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0,0,0,.2);
	z-index: 1;
}


</style>



<h3>검색 결과</h3>
<div class="container">
	<div class="col-lg-2"></div>
	<div class="col-lg-8">
		<div style="background: #f8f8f8 !important" class="jumbotron"
			style="padding-top:20px;'">
			<form>
			<input type="hidden" name="ck_in" value="${param.ck_in}">
			<input type="hidden" name="ck_out" value="${param.ck_out}">
			<input type="hidden" name="uid" value="${sessionScope.uid}">
				<table class="table table-bordered">
					<tr class="head">
						<td>roomNumber</td>
						<td>roomName</td>
						<td>hotelNumber</td>
						<td>roomInform</td>
						<td>maxGuest</td>
						<td>conv</td>
						<td>총금액</td>
						<td>체크인</td>
						<td>체크아웃</td>
						<td>찜하기</td>
					</tr>
<h3>검색 결과</h3>
<div class="container">
	<!-- 호텔 반복 s-->
	<c:forEach var="dto" items="${list}">
		<div class="room">
			<div class="roomlist_box">
				<div class="listbox_img">
					<div class="list_img">
						<!-- 이미지 불러오기 -->
						<img>

					</div>
				</div>
				<!-- 방 이름 -->
				<div class="listbox_title">
					<div class="list_name">
						<p title="${dto.roomName}" class="hotelname" onclick=""><a href="">${dto.roomName }</a></p>
					</div>

					<!-- 별표 이미지 + 총 리뷰점수 + 총리뷰 갯수-->
					<div class="list_grade">
						<img>
						<p>${dto.starAvg}(${dto.cnt })
						<p>
					</div>

					<!-- 전체주소 -->
					<div class="list_adrs">
						<p class="hoteladdress">${dto.addr1 }&nbsp;&nbsp;&nbsp;</p>
					</div>

					<!--  살릴지 안살릴지 모르겠음
					<div class="list_review">
						<img src="/img/sub_list/tripadvisor_logo.png"
							alt="tripadvisorlogo"> Review
					</div>
					<div class="list_info" style="left: 140px;">
						<p>
							<i class="fas fa-info-circle"></i>&nbsp;호텔 정보
						</p>
					</div>
					<div class="list_imgview" style="left: 245px;">
						<p>
							<i class="fas fa-image"></i>&nbsp;이미지 보기
						</p>
					</div>
					<div class="list_map">
						<p>
							<i class="fas fa-map-marker-alt"></i>&nbsp;지도 보기
						</p>
					</div>
				</div>
				 -->

					<!-- 가격 -->
					<div class="listbox_price">
						<p>Price</p>
						<p class="current_coin">
							KRW&nbsp;&nbsp;<span class="pricevalue">계산된 가격(${dto.fee })</span>
						</p>
					</div>
				</div>

			</div>
		</div>
		<!-- 호텔 반복 e-->
	</c:forEach>
</div>
</div>


<script>

	function findIdpw(){  
		window.open("findidpw.do", "아이디/비밀번호 찾기", "width=550, height=550");
	}//findIdpw()end

</script>

<%@ include file="../footer.jsp"%>