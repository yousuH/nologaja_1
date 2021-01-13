<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Nologaja</title>
<link rel="icon" href="./resources/img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="./resources/css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="./resources/css/owl.carousel.min.css">
<!-- themify CSS -->
<link rel="stylesheet" href="./resources/css/themify-icons.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="./resources/css/flaticon.css">
<!-- fontawesome CSS -->
<link rel="stylesheet" href="./resources/fontawesome/css/all.min.css">
<!-- magnific CSS -->
<link rel="stylesheet" href="./resources/css/magnific-popup.css">
<link rel="stylesheet" href="./resources/css/gijgo.min.css">
<!-- niceselect CSS -->
<link rel="stylesheet" href="./resources/css/nice-select.css">
<!-- slick CSS -->
<link rel="stylesheet" href="./resources/css/slick.css">
<!-- style CSS -->
<link rel="stylesheet" href="./resources/css/style2.css">
<!-- login CSS -->
<link rel="stylesheet" href="./resources/css/login.css">
<!-- memberjoin CSS -->
<link rel="stylesheet" href="./resources/css/memberjoin.css">


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
</head>
<body>
	<!-- header -->
	<header class="list_main_menu">
		<div class="main_menu_iner">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-12">
						<nav class="navbar navbar-expand-lg navbar-light justify-content-between">
							<a class="navbar-brand" href="home.do">
								<img src="./resources/img/logo1.png" alt="logo">
							</a>
							<button class="navbar-toggler" type="button"
									data-toggle="collapse" data-target="#navbarSupportedContent"
									aria-controls="navbarSupportedContent" aria-expanded="false"
									aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>
							<div class="collapse navbar-collapse main-menu-item justify-content-end"
								 id="navbarSupportedContent">
								<ul class="navbar-nav">
									<c:choose>
										<c:when test="${sessionScope.uid == null && sessionScope.suid ==null}">
											<li class="nav-item"><a class="nav-link" href="login.do">로그인</a></li>
											<li class="nav-item"><a class="nav-link" href="memberform.do">회원가입</a></li>
										</c:when>

										<c:otherwise>
											<c:choose>
												<c:when test="${sessionScope.uid != null}">
													<li class="nav-item">
														<span>${sessionScope.uid}님이 로그인 중 입니다. 등급:${sessionScope.ugrd }</span>
													</li>
												</c:when>
												<c:otherwise>
													<li class="nav-item">
														<span>${sessionScope.suid}님이 로그인 중 입니다.등급:${sessionScope.ugrd }</span>
													</li>
												</c:otherwise>
											</c:choose>
											<li class="nav-item"><a class="nav-link" href="logout.do">로그아웃</a></li>
											<li class="nav-item"><a class="nav-link" href="mypage.do">마이페이지</a></li>
										</c:otherwise>
										
									</c:choose>
									<li class="nav-item"><a class="nav-link" href="inquiry_list.do">고객센터</a></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>		
		<section class="list_booking_part">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="booking_content">
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="hotel"
									role="tabpanel" aria-labelledby="hotel-tab">
									<div class="booking_form">
										<form action="search.do">
											<div class="form-row">
												<div class="form_colum" >
													<select class="nc_select" name="cityCode" id="cityCode">
														<option value="${param.cityCode }" selected></option>
														<option value="SE">서울</option>
														<option value="BU">부산</option>
														<option value="IN">인천</option>
														<option value="SJ">세종</option>
														<option value="DG">대구</option>
														<option value="DJ">대전</option>
														<option value="GJ">광주</option>
														<option value="UL">울산</option>
														<option value="GG">경기도</option>
														<option value="GW">강원도</option>
														<option value="CB">충청북도</option>
														<option value="CN">충청남도</option>
														<option value="GB">경상북도</option>
														<option value="GN">경상남도</option>
														<option value="JB">전라북도</option>
														<option value="JB">전라남도</option>
													</select>
												</div>
												<div class="form_colum">
													<input name="ck_in" id="datepicker_1" placeholder="Check in date" value="${param.ck_in }">
												</div>
												<div class="form_colum">
													<input name= "ck_out" id="datepicker_2" placeholder="Check out date" value="${param.ck_out }">
												</div>
												<div class="form_colum">
													<select class="nc_select" name="maxGuest" id="maxGuest">
														<option value="${param.maxGuest }" selected>Person</option>
														<option value="1">1명</option>
														<option value="2">2명</option>
														<option value="3">3명</option>
														<option value="4">4명</option>
														<option value="5">5명</option>
														<option value="6">6명</option>
													</select>
												</div>
												<div class="form_btn">
													<button class="btn_1">search</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</header>

<!-- 메인내용 -->




<h3>검색 결과</h3>
<div style="width: 12%; height: 1000px; position: absolute; " >hello</div>
	<!-- 호텔 반복 s-->
	<div style="right:12%; position: static;">
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



<script>

	function findIdpw(){  
		window.open("findidpw.do", "아이디/비밀번호 찾기", "width=550, height=550");
	}//findIdpw()end

</script>

<%@ include file="../footer.jsp"%>