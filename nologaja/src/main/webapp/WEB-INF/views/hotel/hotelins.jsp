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
	<form name="hotelinsform" action="roomins.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="id" id="id" value="${sessionScope.suid}">
		<h2>숙소등록</h2>
		<br>
		<table>

			<tr>
				<td><label for="hotelName">숙소이름</label></td>
				<td><input type="text" name="hotelName" id="hotelName"
					placeholder="숙소이름을 입력해주세요." required><br> <br></td>
			</tr>

			<tr>
				<td><label for="hotelIMG">대표이미지</label></td>
				<td><input type="file" id="hotelIMG" name="hotelIMG" required><br>
					<br></td>
			</tr>

			<tr>
				<td><label for="zipcode">우편번호</label></td>
				<td><input type="text" id="sample6_postcode" name="zipcode"
					placeholder="우편번호" readonly><br> <br></td>
			</tr>

			<tr>
				<td><label for="addr1">주소 </label></td>
				<td><input type="text" id="sample6_address" name="addr1"
					placeholder="주소를 입력해주세요." required> 
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<br></td>
			</tr>

			<tr>
				<td><label for="addr2">상세주소</label></td>
				<td><input type="text" name="addr2" id="addr2"
					placeholder="상세주소를 입력해주세요." required><br> <br></td>
				
			</tr>

			<tr>
				<td><label for="bdgType">건물유형</label></td>
				<td>
					<div class="bdgType">
						<select class="nc_select">
							<option selected>건물유형을 선택하세요</option>
							<option value="AP">아파트</option>
							<option value="PN">펜션</option>
							<option value="HS">주택</option>
							<option value="SH">상가</option>
						</select>
					</div> <br> <br>
				</td>
			</tr>

			<tr>
				<td><label for="hotelInform">숙소설명</label></td>
				<td><input type="text" name="hotelInform" id="hotelInform"
					placeholder="숙소설명문을 입력해주세요." required><br> <br></td>
			</tr>



		</table>
		
		<div id="map" name="map" style="width:100%;height:350px;"></div>

		<input type="submit" value="다음">


	</form>
</div>


<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e17caeb73a6defc5fc28f9e0e2c27306&libraries=services"></script>

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
	
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(addr1, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
	
</script>
<%@ include file="../footer.jsp"%>