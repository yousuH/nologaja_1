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
	<%-- 왼쪽 sidebar 상세검색 정도 나와야 하는건가? --%>
	<h2>예약정보</h2>
	<br>
	<p>다음 정보를 확인해 주세요</p>
	<form name="booking" id="booking" method="post" action="bookingproc.do">
		방번호 : <input type="text" name="roomNumber" id="roomNumber" value="SEAP0001_01">
		아이디 : <input type="text" name="uid" id="uid" value="${sessionScope.uid}">
		박수 : <input type="text" name="night" id="night">
		
		<table class="center">
			<tr>
				<th>숙소명/방이름</th>
				<td>
					<input type="text" name="hotelName" id="hotelName">
				</td>
				<td>
					<input type="text" name="roomName" id="roomName">
				</td>
			</tr>
			<tr>
				<th>인원수</th>
				<td><input type="number" name="maxGuest" id="maxGuest"></td>
			</tr>
			<tr>
				<th>체크인</th>
				<td><input type="text" name="ck_in" id="ck_in"></td>
			</tr>
			<tr>
				<th>체크아웃</th>
				<td><input type="text" name="ck_out" id="ck_out"></td>
			</tr>
			<tr>
				<th>총합계</th>
				<td><input type="number" name="fee" id="fee"></td>
			</tr>
			<tr>
				<th>결제수단</th>
				<td>
					<select name="pay" id="pay" onclick="pay_send()">
						<option value="" selected>결제수단을 선택하세요</option>
						<option value="1">무통장입금</option>
						<option value="2">카드결제</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>요청사항</th>
				<td><textarea type="text" name="request" id="request" rows="9" cols="50"></textarea></td>
			</tr>
		</table>
		<input type="submit" value="예약완료">
		
	</form>
	
	<!-- 
	<form name="booking" id="booking" method="post" action="bookingproc.do">
		<input type="hidden" name="roomNumber" id="roomNumber" value="${param.roomNumber}">
		<input type="hidden" name="uid" id="uid" value="${sessionScope.uid}">
		<input type="hidden" name="night" id="night" value="${night}">
		
		<table class="center">
			<tr>
				<th>숙소명/방이름</th>
				<td>
					<input type="text" name="hotelName" id="hotelName" value="${param.hotelName}" readonly>/
					<input type="text" name="roomName" id="roomName" value="${param.roomName}" readonly>
				</td>
			</tr>
			<tr>
				<th>인원수</th>
				<td><input type="number" name="maxGuest" id="maxGuest" value="${param.maxGuest}" readonly></td>
			</tr>
			<tr>
				<th>체크인</th>
				<td><input type="number" name="ck_in" id="ck_in" value="${param.ck_in}" readonly></td>
			</tr>
			<tr>
				<th>체크아웃</th>
				<td><input type="number" name="ck_out" id="ck_out" value="${param.ck_out}" readonly></td>
			</tr>
			<tr>
				<th>총합계</th>
				<td><input type="number" name="fee" id="fee" value="${param.fee}" readonly></td>
			</tr>
			<tr>
				<th>결제수단</th>
				<td>
					<select name="pay" id="pay" onclick="pay_send()">
						<option value="" selected>결제수단을 선택하세요</option>
						<option value="1">무통장입금</option>
						<option value="2">카드결제</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>요청사항</th>
				<td><textarea type="text" name="request" id="request" rows="9" cols="50"></textarea></td>
			</tr>
		</table>
		<input type="submit" value="예약완료">
		
	</form>
	 -->
	<script>
	
	</script>

<%@ include file="../footer.jsp" %>