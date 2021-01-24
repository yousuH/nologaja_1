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
					<form onsubmit="search.do?cityCode=${param.cityCode }&ck_in=${param.ck_in }&ck_out=${param.ck_out }&maxGuest=${param.maxGuest }">
						<input class="search_name" type="text" name="namesearch" id="namesearch" placeholder="" value="">
						<input type="button" value="검색">
					</form>
					</div>
				</div>
				
				<div class="sub_list_filter_price">
					<form name="FrmPriceRAnge">
						<p>
							<span style="font-size: 15px;">₩</span>&nbsp;가격(1박)
						</p>
						<ul class="price_check">
							<li><input class="pr_checkbox" id="priceRange1"
								type="checkbox" onclick="fnHotelSearch('this')" value="10un">
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
			<h1>조건에 맞는 숙소가 없습니다.</h1>
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
	
function fnHotelSearch(box){
	if(box.checked==true){
	alert(box.value);
	}
}

//검색페이지내 호텔이름 상세검색
/* function filter(){

    var value, name, item, i;

    value = document.getElementById("namesearch").value.toUpperCase();
    item = document.getElementsByClassName("hotel");

    for(i=0;i<item.length;i++){
      name = item[i].getElementsByClassName("hotelname");
      if(name[0].innerHTML.toUpperCase().indexOf(value) > -1){
        item[i].style.display = "flex";
      }else{
        item[i].style.display = "none";
      }
    }
  } */
</script>

<%@ include file="../footer.jsp"%>