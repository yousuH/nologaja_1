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
										<form action="hotellist.do">
											<div class="form-row">
												<div class="form_colum" >
													<select class="nc_select" name="cityCode" id="cityCode">
														<option value="" selected>${Hoteldto.cityCode}</option>
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
													<input name="ck_in" id="datepicker_1" placeholder="Check in date">
												</div>
												<div class="form_colum">
													<input name= "ck_out" id="datepicker_2" placeholder="Check out date">
												</div>
												<div class="form_colum">
													<select class="nc_select" name="maxGuest" id="maxGuest">
														<option value="" selected>Person</option>
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
	<%-- 왼쪽 sidebar 상세검색 정도 나와야 하는건가? --%>
	<h2>호텔 상세정보</h2>
	<p>a호텔이라 치자</p>
	<form name="detail" id="detail" method="post" action="booking.do">
		<input type="hidden" name="hotelNumber" id="hotelNumber" value="${hoteldto.hotelNumber}">
		<input type="hidden" name="wido" id="wido" value="${hoteldto.wido}">
		<input type="hidden" name="kyengdo" id="kyengdo" value="${hoteldto.kyengdo}">
		<input type="hidden" name="cityCode" id="cityCode" value="${hoteldto.cityCode}">
		<input type="hidden" name="zipcode" id="zipcode" value="${hoteldto.zipcode}">
		<input type="hidden" name="suid" id="suid" value="${hoteldto.suid}">
		<input type="hidden" name="uid" id="uid" value="${sessionScope.uid}">
		
		<table class="center">
			<tr>
				<th>숙소명/방이름</th>
				<td>
					<input type="text" name="hotelName" id="hotelName" readonly>${hoteldto.hotelName}/
					<input type="text" name="roomName" id="roomName" readonly>${roomdto.roomName}
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="addr1" id="addr1" readonly>${hoteldto.addr1}</td>
				<td><input type="text" name="addr2" id="addr2" readonly>${hoteldto.addr2}</td>
			</tr>
			<tr>
				<th>인원수</th>
				<td><input type="number" name="guests" id="guests" readonly>${roomdto.guests}</td>
			</tr>
			<tr>
				<th>건물유형</th>
				<td><input type="text" name="bdgType" id="bdgType" readonly>${hoteldto.bdgType}</td>
			</tr>
			<tr>
				<th>이미지</th>
				<td>
					<input type="blob" name="hotelIMG" id="hotelIMG" readonly>${hoteldto.hotelIMG}
					<input type="blob" name="roomIMG" id="roomIMG" readonly>${roomdto.roomIMG}
				</td>
			</tr>
			<tr>
				<th>숙소정보</th>
				<td><input type="text" name="hotelInform" id="hotelInform" readonly>${hoteldto.hotelIMG}</td>
			</tr>
			<tr>
				<th>편의시설</th>
				<td><input type="text" name="conv" id="conv" readonly>${roomdto.conv}</td>
			</tr>
			<tr>
				<th>요금정보</th>
				<td>
					<input type="text" name="baseCost" id="baseCost" readonly>평일가격: ${roomdto.baseCost}
					<input type="text" name="weekCost" id="weekCost" readonly>평일가격: ${roomdto.weekCost}
					<input type="text" name="longCost" id="longCost" readonly>평일가격: ${roomdto.longCost}
				</td>
			</tr>
		</table>
	</form>
	
	<script>
	
	</script>

<%@ include file="../footer.jsp" %>