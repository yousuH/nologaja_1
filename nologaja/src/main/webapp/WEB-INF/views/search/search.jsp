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
<!-- searchlist CSS -->
<link rel="stylesheet" href="./resources/css/searchlist.css">
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
								 id="navbarSupportedContent" style="">
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
					<nav class="navbar navbar-expand-lg navbar-light justify-content-between">
				<section class="list_booking_part" style="width: 1400px; margin: aut">
			
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
													<c:if test="${param.cityCode eq 'SE'}">
														<option value="${param.cityCode}" selected>서울</option>
														<option value="BU">부산</option>
														<option value="IN">인천</option>
														<option value="JJ">제주</option>
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
														<option value="JN">전라남도</option>
													</c:if>
													<c:if test="${param.cityCode eq 'BU'}">
														<option value="SE">서울</option>
														<option value="${param.cityCode}" selected>부산</option>
														<option value="IN">인천</option>
														<option value="JJ">제주</option>
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
														<option value="JN">전라남도</option>
													</c:if>
													<c:if test="${param.cityCode eq 'IN'}">
														<option value="SE">서울</option>
														<option value="BU">부산</option>
														<option value="${param.cityCode}" selected>인천</option>
														<option value="JJ">제주</option>
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
														<option value="JN">전라남도</option>
													</c:if>
													<c:if test="${param.cityCode eq 'JJ'}">
														<option value="SE">서울</option>
														<option value="BU">부산</option>
														<option value="IN">인천</option>
														<option value="${param.cityCode}" selected>제주</option>
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
														<option value="JN">전라남도</option>
													</c:if>
													<c:if test="${param.cityCode eq 'SJ'}">
														<option value="SE">서울</option>
														<option value="BU">부산</option>
														<option value="IN">인천</option>
														<option value="JJ">제주</option>
														<option value="${param.cityCode}" selected>세종</option>
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
														<option value="JN">전라남도</option>
													</c:if>
													<c:if test="${param.cityCode eq 'DG'}">
														<option value="SE">서울</option>
														<option value="BU">부산</option>
														<option value="IN">인천</option>
														<option value="JJ">제주</option>
														<option value="SJ">세종</option>
														<option value="${param.cityCode}" selected>대구</option>
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
														<option value="JN">전라남도</option>
													</c:if>
													<c:if test="${param.cityCode eq 'DJ'}">
														<option value="SE">서울</option>
														<option value="BU">부산</option>
														<option value="IN">인천</option>
														<option value="JJ">제주</option>
														<option value="SJ">세종</option>
														<option value="DG">대구</option>
														<option value="${param.cityCode}" selected>대전</option>
														<option value="GJ">광주</option>
														<option value="UL">울산</option>
														<option value="GG">경기도</option>
														<option value="GW">강원도</option>
														<option value="CB">충청북도</option>
														<option value="CN">충청남도</option>
														<option value="GB">경상북도</option>
														<option value="GN">경상남도</option>
														<option value="JB">전라북도</option>
														<option value="JN">전라남도</option>
													</c:if>
													<c:if test="${param.cityCode eq 'GJ'}">
														<option value="SE">서울</option>
														<option value="BU">부산</option>
														<option value="IN">인천</option>
														<option value="JJ">제주</option>
														<option value="SJ">세종</option>
														<option value="DG">대구</option>
														<option value="DJ">대전</option>
														<option value="${param.cityCode}" selected>광주</option>
														<option value="UL">울산</option>
														<option value="GG">경기도</option>
														<option value="GW">강원도</option>
														<option value="CB">충청북도</option>
														<option value="CN">충청남도</option>
														<option value="GB">경상북도</option>
														<option value="GN">경상남도</option>
														<option value="JB">전라북도</option>
														<option value="JN">전라남도</option>
													</c:if>
													<c:if test="${param.cityCode eq 'UL'}">
														<option value="SE">서울</option>
														<option value="BU">부산</option>
														<option value="IN">인천</option>
														<option value="JJ">제주</option>
														<option value="SJ">세종</option>
														<option value="DG">대구</option>
														<option value="DJ">대전</option>
														<option value="GJ">광주</option>
														<option value="${param.cityCode}" selected>울산</option>
														<option value="GG">경기도</option>
														<option value="GW">강원도</option>
														<option value="CB">충청북도</option>
														<option value="CN">충청남도</option>
														<option value="GB">경상북도</option>
														<option value="GN">경상남도</option>
														<option value="JB">전라북도</option>
														<option value="JN">전라남도</option>
													</c:if>
													<c:if test="${param.cityCode eq 'GG'}">
														<option value="SE">서울</option>
														<option value="BU">부산</option>
														<option value="IN">인천</option>
														<option value="JJ">제주</option>
														<option value="SJ">세종</option>
														<option value="DG">대구</option>
														<option value="DJ">대전</option>
														<option value="GJ">광주</option>
														<option value="UL">울산</option>
														<option value="${param.cityCode}" selected>경기도</option>
														<option value="GW">강원도</option>
														<option value="CB">충청북도</option>
														<option value="CN">충청남도</option>
														<option value="GB">경상북도</option>
														<option value="GN">경상남도</option>
														<option value="JB">전라북도</option>
														<option value="JN">전라남도</option>
													</c:if>
													<c:if test="${param.cityCode eq 'GW'}">
														<option value="SE">서울</option>
														<option value="BU">부산</option>
														<option value="IN">인천</option>
														<option value="JJ">제주</option>
														<option value="SJ">세종</option>
														<option value="DG">대구</option>
														<option value="DJ">대전</option>
														<option value="GJ">광주</option>
														<option value="UL">울산</option>
														<option value="GG">경기도</option>
														<option value="${param.cityCode}" selected>강원도</option>
														<option value="CB">충청북도</option>
														<option value="CN">충청남도</option>
														<option value="GB">경상북도</option>
														<option value="GN">경상남도</option>
														<option value="JB">전라북도</option>
														<option value="JN">전라남도</option>
													</c:if>
													<c:if test="${param.cityCode eq 'CB'}">
														<option value="SE">서울</option>
														<option value="BU">부산</option>
														<option value="IN">인천</option>
														<option value="JJ">제주</option>
														<option value="SJ">세종</option>
														<option value="DG">대구</option>
														<option value="DJ">대전</option>
														<option value="GJ">광주</option>
														<option value="UL">울산</option>
														<option value="GG">경기도</option>
														<option value="GW">강원도</option>
														<option value="${param.cityCode}" selected>충청북도</option>
														<option value="CN">충청남도</option>
														<option value="GB">경상북도</option>
														<option value="GN">경상남도</option>
														<option value="JB">전라북도</option>
														<option value="JN">전라남도</option>
													</c:if>
													<c:if test="${param.cityCode eq 'CN'}">
														<option value="SE">서울</option>
														<option value="BU">부산</option>
														<option value="IN">인천</option>
														<option value="JJ">제주</option>
														<option value="SJ">세종</option>
														<option value="DG">대구</option>
														<option value="DJ">대전</option>
														<option value="GJ">광주</option>
														<option value="UL">울산</option>
														<option value="GG">경기도</option>
														<option value="GW">강원도</option>
														<option value="CB">충청북도</option>
														<option value="${param.cityCode}" selected>충청남도</option>
														<option value="GB">경상북도</option>
														<option value="GN">경상남도</option>
														<option value="JB">전라북도</option>
														<option value="JN">전라남도</option>
													</c:if>
													<c:if test="${param.cityCode eq 'GB'}">
														<option value="SE">서울</option>
														<option value="BU">부산</option>
														<option value="IN">인천</option>
														<option value="JJ">제주</option>
														<option value="SJ">세종</option>
														<option value="DG">대구</option>
														<option value="DJ">대전</option>
														<option value="GJ">광주</option>
														<option value="UL">울산</option>
														<option value="GG">경기도</option>
														<option value="GW">강원도</option>
														<option value="CB">충청북도</option>
														<option value="CN">충청남도</option>
														<option value="${param.cityCode}" selected>경상북도</option>
														<option value="GN">경상남도</option>
														<option value="JB">전라북도</option>
														<option value="JN">전라남도</option>
													</c:if>
													<c:if test="${param.cityCode eq 'GN'}">
														<option value="SE">서울</option>
														<option value="BU">부산</option>
														<option value="IN">인천</option>
														<option value="JJ">제주</option>
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
														<option value="${param.cityCode}" selected>경상남도</option>
														<option value="JB">전라북도</option>
														<option value="JN">전라남도</option>
													</c:if>
													<c:if test="${param.cityCode eq 'JB'}">
														<option value="SE">서울</option>
														<option value="BU">부산</option>
														<option value="IN">인천</option>
														<option value="JJ">제주</option>
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
														<option value="${param.cityCode}" selected>전라북도</option>
														<option value="JN">전라남도</option>
													</c:if>
													<c:if test="${param.cityCode eq 'JB'}">
														<option value="SE">서울</option>
														<option value="BU">부산</option>
														<option value="IN">인천</option>
														<option value="JJ">제주</option>
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
														<option value="${param.cityCode}" selected>전라남도</option>
													</c:if>
													</select>
												</div>
												<div class="form_colum">
													<input name="ck_in" id="datepicker_1" placeholder="Check in date" value="${param.ck_in}">
												</div>
												<div class="form_colum">
													<input name= "ck_out" id="datepicker_2" placeholder="Check out date" value="${param.ck_out}">
												</div>
												<div class="form_colum">
													<select class="nc_select" name="maxGuest" id="maxGuest">
													<c:if test="${param.maxGuest == '1'}">
														<option value="${param.maxGuest}" selected>1명</option>
														<option value="2">2명</option>
														<option value="3">3명</option>
														<option value="4">4명</option>
														<option value="5">5명</option>
														<option value="6">6명</option>
													</c:if>
													<c:if test="${param.maxGuest == '2'}">
														<option value="1">1명</option>
														<option value="${param.maxGuest}" selected>2명</option>
														<option value="3">3명</option>
														<option value="4">4명</option>
														<option value="5">5명</option>
														<option value="6">6명</option>
													</c:if>
													<c:if test="${param.maxGuest == '3'}">
														<option value="1">1명</option>
														<option value="2">2명</option>
														<option value="${param.maxGuest}" selected>3명</option>
														<option value="4">4명</option>
														<option value="5">5명</option>
														<option value="6">6명</option>
													</c:if>
													<c:if test="${param.maxGuest == '4'}">
														<option value="1">1명</option>
														<option value="2">2명</option>
														<option value="3">3명</option>
														<option value="${param.maxGuest}" selected>4명</option>
														<option value="5">5명</option>
														<option value="6">6명</option>
													</c:if>
													<c:if test="${param.maxGuest == '5'}">
														<option value="1">1명</option>
														<option value="2">2명</option>
														<option value="3">3명</option>
														<option value="4">4명</option>
														<option value="${param.maxGuest}" selected>5명</option>
														<option value="6">6명</option>
													</c:if>
													<c:if test="${param.maxGuest == '6'}">
														<option value="1">1명</option>
														<option value="2">2명</option>
														<option value="3">3명</option>
														<option value="4">4명</option>
														<option value="5">5명</option>
														<option value="${param.maxGuest}" selected>6명</option>
													</c:if>
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
						</nav>
					</div>
				</div>
			</div>
		</div>		
		
	</header>

<!-- 메인내용 -->

<main style="display: flow-root;">
<div class="middle1">
<div class="sorting_area">
	<div class="sub_list_sort">
		<ul class="sorting_text" style="display: inline-flex;">
		<c:if test="${sort != 'feeDESC' && sort != 'feeASC' }">
			<li class="sortcriteria" style="display: inline;" id="sortprice" onclick="location.href='search.do?cityCode=${param.cityCode }&ck_in=${param.ck_in }&ck_out=${param.ck_out }&maxGuest=${param.maxGuest }&sort=feeASC'">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가격순&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</li>	
		</c:if>
		<c:if test="${sort == 'feeDESC' }">
			<li class="sortcriteria active" style="display: inline;" id="sortprice" onclick="location.href='search.do?cityCode=${param.cityCode }&ck_in=${param.ck_in }&ck_out=${param.ck_out }&maxGuest=${param.maxGuest }&sort=feeASC'">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가격순▼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</li>	
		</c:if>
		<c:if test="${sort == 'feeASC' }">
			<li class="sortcriteria active" style="display: inline;" id="sortprice" onclick="location.href='search.do?cityCode=${param.cityCode }&ck_in=${param.ck_in }&ck_out=${param.ck_out }&maxGuest=${param.maxGuest }&sort=feeDESC'">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가격순▲&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</li>	
		</c:if>		
			<li>|</li>
		<c:if test="${sort != 'nameDESC' && sort != 'nameASC' }">
			<li class="sortcriteria " style="display: inline;" id="sortname" onclick="location.href='search.do?cityCode=${param.cityCode }&ck_in=${param.ck_in }&ck_out=${param.ck_out }&maxGuest=${param.maxGuest }&sort=nameASC'">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름순&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</li>
		</c:if>
		<c:if test="${sort == 'nameDESC' }">
			<li class="sortcriteria active" style="display: inline;" id="sortname" onclick="location.href='search.do?cityCode=${param.cityCode }&ck_in=${param.ck_in }&ck_out=${param.ck_out }&maxGuest=${param.maxGuest }&sort=nameASC'">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름순▼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</li>
		</c:if>
		<c:if test="${sort == 'nameASC' }">
			<li class="sortcriteria active" style="display: inline;" id="sortname" onclick="location.href='search.do?cityCode=${param.cityCode }&ck_in=${param.ck_in }&ck_out=${param.ck_out }&maxGuest=${param.maxGuest }&sort=nameDESC'">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름순▲&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</li>
		</c:if>
			<li>|</li>
		<c:if test="${sort != 'review'}">
			<li class="sortcriteria" style="display: inline;" id="sortgrade" onclick="location.href='search.do?cityCode=${param.cityCode }&ck_in=${param.ck_in }&ck_out=${param.ck_out }&maxGuest=${param.maxGuest }&sort=review'">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;리뷰순&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</li>
		</c:if>
		<c:if test="${sort == 'review' }">
			<li class="sortcriteria active" style="display: inline;" id="sortgrade" onclick="location.href='search.do?cityCode=${param.cityCode }&ck_in=${param.ck_in }&ck_out=${param.ck_out }&maxGuest=${param.maxGuest }&sort=review'">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;리뷰순▼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</li>
		</c:if>
			</ul>
		</div>
	</div>
	</div>
					<div class="filter_area">
			<div class="sub_list_filter_result" style="height: auto;">
				<p>
					<span class="result_num">${fn:length(list) }</span>개의 호텔이 검색되었습니다.
				</p>

				<script type="text/javascript">
				<!--
					// 맵 이미지가 없으면 공간은 잡혀있는 상태로 보여주기 때문에 auto 처리함.
					$(".sub_list_filter_result").height("auto");
				//-->
				</script>

			</div>
			<div class="fixed_filter">
				<div class="sub_list_filter_name">
					<!-- 료칸일 경우 호텔명 료칸명으로 나오도록 수정 by Eli 2019.01.18 2019011415165-->
					<p>
						&nbsp;호텔명 검색
					</p>
					<div class="ft_inputbox active">

						<input type="text" class="search_name" name="search_name"
							onkeyup="javascript:$('#sHotelName').val(this.value);fnEnterSearch();"
							placeholder="호텔명 검색" value="">
					</div>
				</div>
				
				<div class="sub_list_filter_price">
					<form name="FrmPriceRAnge">
						<p>
							<span style="font-size: 15px;">₩</span>&nbsp;가격(1박)
						</p>
						<ul class="price_check">
							<li><input class="pr_checkbox" id="priceRange1"
								type="checkbox" onclick="fnHotelSearch('RATING','1');">
								<label for="priceRange1">₩&nbsp;100,000 미만</label></li>
							<li><input class="pr_checkbox" id="priceRange2"
								type="checkbox" onclick="fnHotelSearch('RATING','1');">
								<label for="priceRange2">₩&nbsp;100,000~149,999</label></li>
							<li><input class="pr_checkbox" id="priceRange3"
								type="checkbox" onclick="fnHotelSearch('RATING','1');">
								<label for="priceRange3">₩&nbsp;150,000~199,999</label></li>
							<li><input class="pr_checkbox" id="priceRange4"
								type="checkbox" onclick="fnHotelSearch('RATING','1');">
								<label for="priceRange4">₩&nbsp;200,000~249,999</label></li>
							<li><input class="pr_checkbox" id="priceRange5"
								type="checkbox" onclick="fnHotelSearch('RATING','1');">
								<label for="priceRange5">₩&nbsp;250,000 이상</label></li>
						</ul>
					</form>
				</div>
			</div>
		</div>
		<div class="incontents_area">
			<div class="sub_list_hotellist">
				<div class="hotellist" style="min-height: 1400px;">
					
					<!-- 호텔 반복 s-->
					<c:forEach var="dto" items="${list}" begin="${start }" end="${end }" varStatus="vs">

						<div class="hotel">
							<div class="hotellist_box">
								<div class="listbox_img">
									<div class="list_img">
										<!-- 이미지 불러오기 -->
										<img style="width: 90%; height: -webkit-fill-available" src="${pageContext.request.contextPath}/resources/img/hotel/${dto.savefile}"/>
									</div>
								</div>
								<!-- 방 이름 -->
								<div class="listbox_title">
									<div class="list_name">
										<p title="${dto.roomName}" class="hotelname" onclick="">
											<a href="searchdetail.do?roomNumber=${dto.roomNumber}&cityCode=${param.cityCode}&ck_in=${param.ck_in}&ck_out=${param.ck_out}&maxGuest=${param.maxGuest}&night=${night}&fee=${dto.feestr}">${dto.roomName}</a>
										</p>
										<!-- 찜한숙소 -->
										<form style="float: right;" method="post">											
											<input type="hidden" id="roomNumber${vs.index}" name="roomNumber" value="${dto.roomNumber}">
											<input type="hidden" id="roomName${vs.index}" name="roomName" value="${dto.roomName}">
											<input type="hidden" id="guests" name="guests" value="${param.maxGuest}">
											<input type="hidden" id="ck_in" name="ck_in" value="${param.ck_in}">
											<input type="hidden" id="ck_out" name="ck_out" value="${param.ck_out}">
											<input type="hidden" id="night" name="night" value="${night}">
											<input type="hidden" id="fee${vs.index}" name="fee" value="${dto.fee}">
												
											<input type="checkbox" id="popup${vs.index }">
											<label for="popup${vs.index }">♡</label>
											<div><!-- 모달창 시작(찜) -->
												<div>
													<label for="popup${vs.index}"><strong>Ⅹ</strong></label>													
													
													<span style="text-align: center;"><strong>목록에 저장하기</strong></span>
													
													<table>
														<tr>
															<td width="100%">숙소목록</td>
														</tr>
														<c:forEach var="cartFolder" items="${cartFolders}" varStatus="vas">
															<tr>
																<td><input type="button" id="btn_cartFolder${vas.index}" name="ctFolder_name" value="${cartFolder.ctFolder_name}" onclick="cartFolder(${vs.index}, ${vas.index})">
																<input type="hidden" id="ctFolder_num${vas.index}" name="ctFolder_num" value="${cartFolder.ctFolder_num}"></td></tr>
														</c:forEach>
													</table>
													
													<div>
														<input type="checkbox" id="popup_${vs.index }">
														<label for="popup_${vs.index }">목록 추가하기</label>
														<div>
															<div>
																<label for="popup_${vs.index }"><strong>Ⅹ</strong></label>
																
																<span style="text-align: center;"><strong>목록 이름 작성하기</strong></span>										
																
																
																<br><input type="text" id="ctFolder_name${vs.index }" name="ctFolder_name" placeholder="이름" value="">
																<br><input type="button" id="btn_ctFolder_name" value="새로 만들기" onclick="btnctFoldername(${vs.index})">
																
															</div>
															<label for="popup_${vs.index }"></label>
														</div>	
													</div>										
												</div><!-- 모달창 끝(찜) -->
												<label for="popup${vs.index }"></label>
											</div>
										</form>
									</div>
									<!-- 별표 이미지 + 총 리뷰점수 + 총리뷰 갯수-->
									<div class="list_grade">
										<img>
										<p>${dto.starAvg}(${dto.cnt })${strat }
										<p>
									</div>

									<!-- 전체주소 -->
									<div class="list_adrs">
										<p class="hoteladdress">${dto.addr1 }&nbsp;&nbsp;&nbsp;</p>
									</div>

									<!-- 가격 -->
									<div class="listbox_price">
										<p style="color: #d11717">Price</p>
										<p class="current_coin" style="color: #d11717">
											KRW&nbsp;&nbsp;<span class="pricevalue" style="color: #d11717">${dto.feestr}</span>
										</p>
									</div>
								</div>

							</div>
						</div>

					</c:forEach>
					<!-- 호텔 반복 끝-->
		            <div class="hotelpage">
		                <c:if test="${pagination.curRange ne 1 }">
		                    <a href="#" onclick="fn_paging(1)">[처음]</a> 
		                </c:if>
		                <c:if test="${pagination.curPage ne 1}">
		                    <a href="#" onclick="fn_paging('${pagination.prevPage }')">[이전]</a> 
		                </c:if>
		                <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
		                    <c:choose>
		                        <c:when test="${pageNum eq  pagination.curPage}">
		                            <span style="font-weight: bold;"><a href="#" onclick="fn_paging('${pageNum }')">${pageNum }</a></span> 
		                        </c:when>
		                        <c:otherwise>
		                            <a href="#" onclick="fn_paging('${pageNum }')">${pageNum }</a> 
		                        </c:otherwise>
		                    </c:choose>
		                </c:forEach>
		                <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
		                    <a href="#" onclick="fn_paging('${pagination.nextPage }')">[다음]</a> 
		                </c:if>
		                <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
		                    <a href="#" onclick="fn_paging('${pagination.pageCnt }')">[끝]</a> 
		                </c:if>
						</div>
		            </div>
	            </div>
            </div>

	</main>
<script src="./resources/js/jquery.js"></script>
<script>
/* $("#btn_ctFolder_name").click(function(){
	var params="";
	params += "ctFolder_name=" + $("#ctFolder_name").val();
	params += "&guests=" + $("#maxGuest").val();
	params += "&ck_in=" + $("#ck_in").val();
	params += "&ck_out=" + $("#ck_out").val();
	params += "&night=" + $("#night").val();
	params += "&totalFee=" + $("#fee").val();
	params += "&roomNumber=" + $("#roomNumber").val();
	params += "&roomName=" + $("#roomName").val();//전달값
	//alert(params);
	
	$.post(
		"addcartfolder_insert.do"  		   		  //요청명령어
		,params 
		, responseProc   				  //콜백함수 
	); // post() end

}); // click() end 
 */
 
function btnctFoldername(i){
	var params="";
	params += "ctFolder_name=" + $("#ctFolder_name"+i).val();
	params += "&guests=" + $("#maxGuest").val();
	params += "&ck_in=" + $("#ck_in").val();
	params += "&ck_out=" + $("#ck_out").val();
	params += "&night=" + $("#night").val();
	params += "&totalFee=" + $("#fee"+i).val();
	params += "&roomNumber=" + $("#roomNumber"+i).val();
	params += "&roomName=" + $("#roomName"+i).val();//전달값
	alert(params);
	
	$.post(
			"addcartfolder_insert.do"  		   		  //요청명령어
			,params 
			, responseProc   				  //콜백함수 
		); // post() end

}

function responseProc(){
	
	//팝업을 display:none 으로 바꿔야함
	$("#popup2").css("display", "none");
	$("#popup").css("display", "none");
	
}//responseProc() end 


/* 
$("#btn_cartFolder").click(function(){
	var params="";
	params += "ctFolder_num=" + $("#ctFolder_num").val();
	params += "&ctFolder_name=" + $("#btn_cartFolder").val();
	params += "&guests=" + $("#maxGuest").val();
	params += "&ck_in=" + $("#ck_in").val();
	params += "&ck_out=" + $("#ck_out").val();
	params += "&night=" + $("#night").val();
	params += "&totalFee=" + $("#fee").val();
	params += "&roomNumber=" + $("#roomNumber").val();
	params += "&roomName=" + $("#roomName").val();//전달값
	alert(params);
	
	$.post(
		"cartinsert.do"  		   		  //요청명령어
		,params 
		, responseProc   				  //콜백함수 
	); // post() end

}); // click() end 
 */
function responseProc2(){
	
	//팝업을 display:none 으로 바꿔야함
	$("#popup").css("display", "none");
}//responseProc() end 
function cartFolder(i, j){
	var params="";
	params += "ctFolder_num=" + $("#ctFolder_num"+j).val();
	params += "&ctFolder_name=" + $("#btn_cartFolder"+j).val();
	params += "&guests=" + $("#maxGuest").val();
	params += "&ck_in=" + $("#ck_in").val();
	params += "&ck_out=" + $("#ck_out").val();
	params += "&night=" + $("#night").val();
	params += "&totalFee=" + $("#fee"+i).val();
	params += "&roomNumber=" + $("#roomNumber"+i).val();
	params += "&roomName=" + $("#roomName"+i).val();//전달값
	alert(params);
	
	$.post(
		"cartinsert.do"  		   		  //요청명령어
		,params 
		, responseProc   				  //콜백함수 
	); // post() end
}
//페이징
function fn_paging(curPage) {
	var param="";
	param += "&cityCode=" + $("#cityCode").val();
	param += "&maxGuest=" + $("#maxGuest").val();
	param += "&ck_in=" + $("#ck_in").val();
	param += "&ck_out=" + $("#ck_out").val();
	param += "&sort=${sort}";
	location.href = "search.do?curPage=" + curPage + param;
	}
</script>

<%@ include file="../footer.jsp"%>