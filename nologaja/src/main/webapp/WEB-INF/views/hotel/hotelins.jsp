<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="./resources/css/mypage.css">

<!-- 메인내용 -->
<!-- 메인내용 -->
	<div class="mp_sidenav">
	  <a href="mypage.do">예약목록</a>
	  <c:if test="${sessionScope.uid != null }">
	  <a href="cartfolderlist.do">찜한숙소</a>
	  </c:if>
	  <c:if test="${sessionScope.suid != null }">
	  <a href="hotelins.do"><strong>숙소등록</strong></a>
	  <a href="hotellist.do">숙소목록</a>
	  </c:if>
	  <a href="updateform.do">회원정보수정</a>
	  <a href="delete.do">회원탈퇴</a>
	  <a href="inquirylist.do">문의내역</a>
	</div>

<div class="mp_main">
	<form name="hotelinsform" action="roomins.do" enctype="multipart/form-data" method="post">
		<input type="hidden" name="suid" id="suid" value="${sessionScope.suid}">
		<input type="hidden" name="wido" id="wido" value="">
		<input type="hidden" name="gyengdo" id="gyengdo" value="">
		<input type="hidden" name="CityCode" id="CityCode" value="">
		<input type="hidden" name="hotelNumber" id="hotelNumber" value="1234">
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
						<select class="nc_select" id="bdgType" name="bdgType" required>
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
		<input type="submit" value="다음">


	</form>
</div>


<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=e17caeb73a6defc5fc28f9e0e2c27306&libraries=services"></script>

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
						var geocoder = new daum.maps.services.Geocoder();
						var y= '';
						var x= '';
						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById('sample6_address').value = addr;
						var arr=addr.substr(0, 2);;
						var CityCode='';
						switch (arr){
						    case '서울' :
						        CityCode='SE';
						        break;
						    case '부산' :
						    	CityCode='BU';
						        break;
						    case '세종' :    
						    	CityCode='SJ';
						    	break;
						    case '제주' :
						    	CityCode='JJ';
						        break;
						    case '인천' :
						    	CityCode='IN';
						        break;
						    case '대구' :
						    	CityCode='DG';
						        break;
						    case '대전' :
						    	CityCode='DJ';
						        break;
						    case '광주' :
						    	CityCode='GJ';
						        break;
						    case '울산' :
						    	CityCode='UL';
						        break;
						    case '경기' :
						    	CityCode='GG';
						        break;
						    case '강원' :
						    	CityCode='GW';
						        break;
						    case '충북' :
						    	CityCode='CB';
						        break;
						    case '충남' :
						    	CityCode='CN';
						        break;
						    case '경북' :
						    	CityCode='GB';
						        break;
						    case '경남' :
						    	CityCode='GN';
						        break;
						    case '전북' :
						    	CityCode='JB';
						        break;
						    case '전남' :
						    	CityCode='JN';
						        break;
					        
						}
						document.getElementById('CityCode').value = CityCode;
						geocoder.addressSearch(addr, function(results, status) {
		                    // 정상적으로 검색이 완료됐으면
		                    if (status === daum.maps.services.Status.OK) {

		                        var result = results[0]; //첫번째 결과의 값을 활용

		                        // 해당 주소에 대한 좌표를 받아서
		                        var coords = new daum.maps.LatLng(result.y, result.x);
		                        // 지도를 보여준다.
		                        document.getElementById('wido').value =  result.y;
		                        document.getElementById('gyengdo').value = result.x;
		                    }
		                });
						// 커서를 상세주소필드로 이동한다.
						document.getElementById('addr2').focus();
					}
		}).open();
	}


</script>

<%@ include file="../footer.jsp"%>
