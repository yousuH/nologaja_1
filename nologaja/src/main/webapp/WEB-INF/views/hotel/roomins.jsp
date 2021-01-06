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
	font-size: 20px;
	color: #818181;
	display: block;
}

.sidenav a:hover {
	color: #f1f1f1;
}

.main {
	margin-left: 160px; /* Same as the width of the sidenav */
	font-size: 15px; /* Increased text to enable scrolling */
	padding: 0px 10px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 15px;
	}
}
</style>

<!-- 메인내용 -->
<div class="sidenav">
	<a href="mypage.do">예약목록</a> <a href="hotelins.do"><strong>숙소등록</strong></a>
	<a href="hotellist.do">숙소목록</a> <a href="updateform.do">회원정보수정</a> <a
		href="delete.do">회원탈퇴</a> <a href="inquirylist.do">문의내역</a>
</div>

<div class="main">
	<form name="hotelinsform" method="get" action="hotelroominspro.do"
		enctype="multipart/form-data">
		<h2>방등록</h2>

		<br>
		<table>

			<tr>
				<td><label for="hotelName">숙소이름</label></td>
				<td><input type="text" name="hotelName" id="hotelName"
					value="${hoteldto.hotelName}" readonly><br> <br></td>
			</tr>

			<tr>
				<td><label for="roomName">방이름</label></td>
				<td><input type="text" name="roomName" id="roomName"
					placeholder="방이름을 입력해주세요." required><br> <br></td>
			</tr>

			<tr>
				<td><label for="roomInform">방소개</label></td>
				<td><textarea rows="9" cols="50" required></textarea></td>
			</tr>

			<tr>
				<td><label for="maxGuest">최대인원</label></td>
				<td>
					<div class="maxGuest">
						<select class="nc_select" required>
							<option selected>최대숙박인원</option>
							<option value="2">2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
							<option value="5">5명</option>
							<option value="6">6명</option>
						</select>
					</div> <br> <br>
				</td>
			</tr>

			<tr>
				<td><label for="conv">편의시설</label></td>
				<td><input type="checkbox" name="conv" value="KC">주방 <input
					type="checkbox" name="conv" value="HT">난방 <input
					type="checkbox" name="conv" value="WS">세탁기
			</tr>


			<tr>
				<td><label for="baseCost">평일가격</label></td>
				<td><input type="number" name="baseCost" id="baseCost"
					placeholder="평일가격을 입력해주세요." required>원<br>
					<br></td>
			</tr>

			<tr>
				<td><label for="weekCost">주말가격</label></td>
				<td><input type="number" name="weekCost" id="weekCost"
					placeholder="주말가격을 입력해주세요." required>원<br> <br></td>
			</tr>

			<tr>
				<td><label for="longCost">장기숙박가격</label></td>
				<td><input type="number" name="longCost" id="longCost"
					placeholder="장기숙박 할인 가격을 입력해주세요." required>원<br> <br></td>
			</tr>



		</table>

		<input type="submit" value="등록">


	</form>
</div>


<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById('sample6_address').value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('addr2').focus();
					}
				}).open();
	}

	
</script>
<%@ include file="../footer.jsp"%>