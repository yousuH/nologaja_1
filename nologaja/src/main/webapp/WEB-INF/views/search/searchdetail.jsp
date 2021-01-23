
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

main {
	margin: auto;
	max-width: 1400px;
}

.namenphoto {
	grid-area: namenphoto;
}

.detail {
	grid-area: detail;
}

.book {
	grid-area: book;
	width: max-content;
	margin: auto;
}

.review {
	grid-area: review;
}

.inquire {
	grid-area: inquire;
}

.grid-container {
	display: grid;
	grid-template-areas: 'namenphoto namenphoto namenphoto'
		'detail detail book' 'review review review' 'inquire inquire inquire';
	grid-gap: 10px;
	padding-left: 40px;
	padding-right: 40px;
}

.grid-container>div {
	padding: 20px 0;
}

input[id*="popup"] {
	display: none;
}

input[id*="popup"]+label {
	display: inline-block;
	padding: 14px;
	background: #ffcd41;
	border-radius: 100%;
	color: #fff;
}

input[id*="popup"]+label+div {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 100;
}

input[id*="popup"]+label+div {
	opacity: 0;
	visibility: hidden;
}

input[id*="popup"]:checked+label+div {
	opacity: 1;
	visibility: visible;
}

input[id*="popup"]+label+div>div {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 500px;
	height: 300px;
	background: #fff;
	border-radius: 5%;
	z-index: 2;
	text-align: center;
	align-content: center;
}

input[id*="popup"]+label+div>div>label {
	position: absolute;
	top: 0%;
	left: 0%;
	transform: translate(-40%, -40%);
	padding: 12px;
	color: #fff;
	background: #dd5347;
	border-radius: 100%;
	z-index: 1;
}

input[id*="popup"]+label+div>label {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, .2);
	z-index: 1;
}

input[id*="popup2"] {
	display: none;
}

input[id*="popup2"]+label {
	display: inline-block;
	padding: 14px;
	background: #ffcd41;
	border-radius: 100%;
	color: #fff;
}

input[id*="popup2"]+label+div {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 100;
}

input[id*="popup2"]+label+div {
	opacity: 0;
	visibility: hidden;
}

input[id*="popup2"]:checked+label+div {
	opacity: 1;
	visibility: visible;
}

input[id*="popup2"]+label+div>div {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 500px;
	height: 300px;
	background: #fff;
	border-radius: 5%;
	z-index: 2;
	text-align: center;
	align-content: center;
}

input[id*="popup2"]+label+div>div>label {
	position: absolute;
	top: 0%;
	left: 0%;
	transform: translate(-40%, -40%);
	padding: 12px;
	color: #fff;
	background: #dd5347;
	border-radius: 100%;
	z-index: 1;
}

input[id*="popup2"]+label+div>label {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, .2);
	z-index: 1;
}

/* 문의사항 게시판 */
a {
	text-decoration: none;
	color: inherit;
}

.board_list_wrap {
	padding: 50px;
}

.board_list_head, .board_list_body .item {
	padding: 10px 0;
	font-size: 0;
}

.board_list_head {
	border-top: 2px solid green;
	border-bottom: 1px solid #ccc;
}

.board_list_body .item {
	border-bottom: 1px solid #ccc;
}

.board_list_head>div, .board_list_body .item>div {
	display: inline-block;
	text-align: center;
	font-size: 14px;
}

.board_list_head>div {
	font-weight: 600;
}

.board_list .num {
	width: 10%;
}

.board_list .tit {
	width: 55%;
}

.board_list_body div.tit {
	text-align: left;
}

.board_list_body div.tit a:hover {
	text-decoration: underline;
}

.board_list .writer {
	width: 10%;
}

.board_list .date {
	width: 15%;
}

.board_list .content {
	padding-left: 10%;
}

/* paging */
.paging {
	margin-top: 30px;
	text-align: center;
}

.paging a {
	display: inline-block;
	vertical-align: middle;
}

.paging a.bt {
	width: 30px;
	height: 30px;
	background-color: #ccc;
	background-image: url(../img/page_bt.png);
	background-repeat: no-repeat;
	border-radius: 100px;
	text-indent: -1000px;
	overflow: hidden;
}

.paging a.bt:hover {
	background-color: #999;
}

.paging a.first {
	background-position: 10px -40px;
}

.paging a.prev {
	margin-right: 5px;
	background-position: 10px 10px;
}

.paging a.next {
	margin-left: 5px;
	background-position: -40px 10px;
}

.paging a.last {
	background-position: -40px -40px;
}

.paging a.num {
	margin: 0 5px;
}

.paging a.num.on {
	color: green;
}

.paging a.num:hover {
	text-decoration: underline;
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
						<nav
							class="navbar navbar-expand-lg navbar-light justify-content-between">
							<a class="navbar-brand" href="home.do"> <img
								src="./resources/img/logo1.png" alt="logo">
							</a>
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>
							<div
								class="collapse navbar-collapse main-menu-item justify-content-end"
								id="navbarSupportedContent" style="">
								<ul class="navbar-nav">
									<c:choose>
										<c:when
											test="${sessionScope.uid == null && sessionScope.suid ==null}">
											<li class="nav-item"><a class="nav-link" href="login.do">로그인</a></li>
											<li class="nav-item"><a class="nav-link"
												href="memberform.do">회원가입</a></li>
										</c:when>

										<c:otherwise>
											<c:choose>
												<c:when test="${sessionScope.uid != null}">
													<li class="nav-item"><span>${sessionScope.uid}님이
															로그인 중 입니다. 등급:${sessionScope.ugrd }</span></li>
												</c:when>
												<c:otherwise>
													<li class="nav-item"><span>${sessionScope.suid}님이
															로그인 중 입니다.등급:${sessionScope.ugrd }</span></li>
												</c:otherwise>
											</c:choose>
											<li class="nav-item"><a class="nav-link"
												href="logout.do">로그아웃</a></li>
											<li class="nav-item"><a class="nav-link"
												href="mypage.do">마이페이지</a></li>
										</c:otherwise>

									</c:choose>
									<li class="nav-item"><a class="nav-link"
										href="inquiry_list.do">고객센터</a></li>
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
													<c:if test="${param.cityCode eq ''}">
														<option value="${param.cityCode}" selected>전체</option>
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
														<option value="JN">전라남도</option>
													</c:if>
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
													<c:if test="${param.maxGuest == '0'}">
														<option value="0">전체</option>
														<option value="1">1명</option>
														<option value="2">2명</option>
														<option value="3">3명</option>
														<option value="4">4명</option>
														<option value="5">5명</option>
														<option value="6">6명</option>
													</c:if>
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
	<main>
		<div class="grid-container">
			<div class="namenphoto">
				<!--  방제목, 주소  -->
				<div>
					<div>
						<h1>${dto.roomName}</h1>
						<input type="hidden" id="roomNumber" value="${dto.roomNumber}">
						<span><a href="" class="">${dto.addr1}</a></span><br> <br>
					</div>
				</div>
				<!--호텔이미지-->
				<img class="" alt=""
					src="${pageContext.request.contextPath}/resources/img/hotel/${dto.hsavefile}">
			</div>

			<div class="detail">
				<!--호텔정보-->

				<div>
					<span>국무총리 또는 행정각부의 장은 소관사무에 관하여 법률이나 대통령령의 위임 또는 직권으로 총리령
						또는 부령을 발할 수 있다. 모든 국민은 고문을 받지 아니하며, 형사상 자기에게 불리한 진술을 강요당하지 아니한다.</span>
				</div>
				<br>
				<!--편의시설-->
				<div>
					<span>${dto.conv} </span>
				</div>
			</div>











			<!-- ㅇㅖ약하기 -->
			<div class="book">
				<div
					style="border: 1px solid black; border-radius: 5%; text-align: center;">
					<table style="border: 1px; border-radius: 5%; padding: 5px;">
						<tr style="height: 75px;">
							<th style="width: 150px;"><span>체크인</span><br> <span>${param.ck_in}</span></th>
							<th style="width: 150px;"><span>체크아웃</span><br> <span>${param.ck_out}</span></th>
						</tr>
						<tr style="height: 75px;">
							<td colspan="2"><span>인원수</span><br> <span>${param.maxGuest}</span></td>
						</tr>
					</table>
					<c:if test="${sessionScope.uid != null }">
						<input type="submit" value="예약하기"
							style="width: 85%; padding: 10px;"
							onclick="location.href='booking.do?roomNumber=${dto.roomNumber}&night=${param.night}&hotelName=${dto.hotelName}&roomName=${dto.roomName}&maxGuest=${param.maxGuest}&ck_in=${param.ck_in}&ck_out=${param.ck_out}&fee=${param.fee}&pay=${param.pay}'">
						<br>
						<br>
					</c:if>
					<c:if test="${sessionScope.uid == null }">
						<input type="submit" value="예약하기"
							style="width: 85%; padding: 10px;"
							onclick="location.href='login.do'">
						<br>
						<br>
					</c:if>
					<c:if test="${sessionScope.suid != null }">
						<input type="submit" value="예약하기"
							style="width: 85%; padding: 10px;"
							onclick="location.href='mypage.do'">
						<br>
						<br>
					</c:if>
					<span>총 가격 : </span><span>${param.fee}원</span>
				</div>
			</div>
			<div class="review">review</div>



			<!-- 호스트 문의하기  -->
			<c:if test="${sessionScope.uid ne null }">
				<div class="inquire">
					<input type="checkbox" id="popup"> <label for="popup"
						style="cursor: pointer;">호스트에게 문의하기</label>
					<div id="modalClose">
						<div>
							<label for="popup"></label>
							<div>
								<form name="inquiryForm" action="inquiry_host.do">
									<div style="padding: 10px">
										<input style="width: 95%;" type="text" name="title" id="title"
											placeholder="제목">
									</div>
									<div style="padding: 10px">
										<textarea style="width: 95%; height: 200px;" name="content"
											id="content" placeholder="내용"></textarea>
									</div>
									<div>
										<input type="button" id="inquiry_submit" value="등록하기">
									</div>
								</form>
							</div>
						</div>
						<label for="popup"></label>
					</div>
				</div>
			</c:if>

			<!-- 호스트 문의하기 게시판 -->

			<div class="board_list_wrap">
				<div class="board_list">
					<div class="board_list_head">
						<div class="num">답변상태</div>
						<div class="tit">제목</div>
						<div class="writer">글쓴이</div>
						<div class="date">작성일</div>
					</div>
					<div class="board_list_body">
						<div class="item" id="result"></div>
					</div>
					<div class="board_list_body">
						<div class="item">
							<c:choose>
								<c:when test="${list eq null}">
									<div class="num"></div>
									<div class="tit"></div>
									<div class="writer"></div>
									<div class="date"></div>
								</c:when>
								<c:when test="${!empty list}">
									<c:forEach var="list" items="${list}">
										<c:choose>
											<c:when test="${list.rp_st eq 'N' }">
												<div class="num">미답변</div>
											</c:when>
											<c:otherwise>
												<c:if test="${list.depth == 0 }">
													<div class="num">답변완료</div>
												</c:if>
											</c:otherwise>
										</c:choose>
										<c:if test="${list.depth == 0 }">
											<div class="tit">
												<a href="#">${list.title}</a>
											</div>
											<div class="writer">${list.uid}</div>
											<div class="date">${list.swdate}</div>
											<br>
										</c:if>
										<div class="iqContent"
											style="padding-left: 10%; min-width: 1043px; text-align: left;">
											<br> <span>${list.content}</span>
											<c:if
												test="${sessionScope.suid eq suid && list.rp_st eq 'N'}">
												<input type="checkbox" id="popup2${list.random}">
												<label for="popup2${list.random}"
													style="cursor: pointer; position: relative; float: right;">답변쓰기</label>
												<div id="modalClose2${list.random}">
													<div>
														<div>
															<form name="inquiryForm" action="inquiry_host_reply.do">
																<input type="hidden" id="grpno${list.random}"
																	name="grpno" value="${list.grpno}"> <input
																	type="hidden" id="depth" name="depth"
																	value="${list.depth}">
																<div style="padding: 10px">
																	<textarea style="width: 95%; height: 200px;"
																		name="content" id="replyContent${list.random}"
																		placeholder="답변"></textarea>
																</div>
																<div>
																	<input type="button" value="등록하기"
																		onclick="replyInsert(${list.random})">
																</div>
															</form>
														</div>
													</div>
													<label for="popup2${list.random}"></label>
												</div>
											</c:if>
										</div>
										<c:if test="${list.rp_st eq 'N'}">
											<br>

											<div id="replyContent2${list.random}" class="replyContent2"
												style="width: 1220px;"></div>
										</c:if>
										<br>
									</c:forEach>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
				<div class="paging">
					<a href="#" class="bt first">처음 페이지</a> <a href="#" class="bt prev">이전
						페이지</a> <a href="#" class="num on">1</a> <a href="#" class="num">2</a>
					<a href="#" class="num">3</a> <a href="#" class="bt next">다음
						페이지</a> <a href="#" class="bt last">마지막 페이지</a>
				</div>
			</div>




		</div>
		<div class="book" >
			<div style="border: 1px solid black; border-radius: 5%; text-align: center;">
				<table style="border: 1px; border-radius: 5%; padding: 5px;">
					<tr style="height: 75px;">
						<th style="width: 150px;">
							<span>체크인</span><br><span>${param.ck_in}</span>
						</th>
						<th style="width: 150px;">
							<span>체크아웃</span><br><span>${param.ck_out}</span>
						</th>
					</tr>
					<tr style="height: 75px;">
						<td colspan="2">
							<span>인원수</span><br><span>${param.maxGuest}</span>
						</td>
					</tr>
				</table>
				<c:if test="${sessionScope.uid != null }">
	               <input type="submit" value="예약하기" style="width: 85%; padding: 10px;"
	                        onclick="location.href='booking.do?roomNumber=${dto.roomNumber}&night=${param.night}&hotelName=${dto.hotelName}&roomName=${dto.roomName}&cityCode=${param.cityCode}&maxGuest=${param.maxGuest}&ck_in=${param.ck_in}&ck_out=${param.ck_out}&fee=${param.fee}&pay=${param.pay}'"><br><br>
	            </c:if>
	            <c:if test="${sessionScope.uid == null }">
	               <input type="submit" value="예약하기" style="width: 85%; padding: 10px;"
	                        onclick="location.href='login.do'"><br><br>
	            </c:if>
	            <c:if test="${sessionScope.suid != null }">
	               <input type="submit" value="예약하기" style="width: 85%; padding: 10px;"
	                        onclick="location.href='mypage.do'"><br><br>
	            </c:if>
	            <span>총 가격 : </span><span>${param.fee}원</span>
         </div>
      </div>
      	<div class="review">
      	<h3>&nbsp;&nbsp;&nbsp;리뷰</h3>
      	<h4>총평점 : ${param.stars_avg }</h4><br>
				<table class="table table-hover text-center">
					<thead>
						<tr>
							<th class="text-center">아이디</th>
							<th class="text-center">작성일자</th>
							<th class="text-center" style="min-width: 600px; max-width: 600px;">내용</th>
							<th class="text-center">청결도</th>
							<th class="text-center">접근성</th>
							<th class="text-center">가성비</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="rvdto" items="${list}" varStatus="status">
							<tr>
								<td>${rvdto.uid}</td>
								<td>${rvdto.wdate}</td>
								<td>${rvdto.content}</td>
								<td>${rvdto.stars_clean} / 10</td>
								<td>${rvdto.stars_location} / 10</td>
								<td>${rvdto.stars_costeff} / 10</td>
							</tr>
						</c:forEach>
						<c:if test="${size }">
						<tr><td colspan="6"><div>마지막 리뷰 입니다.</div></td></tr>
						</c:if>
						<tr id='addbtn'><td colspan="6"><div class="btns"><a href="searchdetail.do?roomNumber=${dto.roomNumber }&num=${num}&ck_in=${param.ck_in}&ck_out=${param.ck_out}&maxGuest=${param.maxGuest}&night=${param.night }&fee=${param.fee}&cityCode=${parma.cityCode}&stars_avg=${param.stars_avg }" class="btn btn-primary">더보기</a></div></td></tr>
						       <%--  <tr id='addbtn'><td colspan="5"><div class="btns"><a href="javascript:moreList('${dto.roomNumber }', '${num }');" class="btn btn-primary">더보기</a></div></td></tr> --%>
					</tbody>
				</table>
				<br>
<!-- 				<div id="more_btn_div" align="center">
					<hr>
						<a id="more_btn_a" href="javascript:moreContent('more_list', 5);">
							더보기[more]
						</a>
					<hr>
				</div> -->
			</div>
   </div>
   </main>
</body>
<script src="./resources/js/jquery.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script>

/* function moreContetn(id, cnt){
	
	var list_length = $("#"+id+" tr").length-1;
	var aname = id + "_btn";
	var callLength = list_length;
	
	$('#startCount').val(callLength);
	$('#viewCount').val(cnt);
	
	$.ajax({
		type	:	"post",
		url		:	"/getMoreContents_ajax.do",
		data	:	$('#searchTxtForm').serialize(),
		dataType:	"json",
		success :   function(result){
						if(result.resultCnt > 0){
							var list = result.resultList;
							if(rvdto.content != '') {
								$('#' + aname).attr('href', "javascript:moreContent('"+id+"', "+cnt+");");
									getMoreList(list);
							}else{
								$("#"+id+"_div").remove();
							}//if end
						}else{
							}
						}
		});
	
	function getMoreList(list){
		
		var content = "";
		var length = list.length;
		for(i=0; i<list.length; i++){
			var rvdto = list[i];
			if(rvdto.content != ''){
				content += "<tr>";
				content += "<td>"+rvdto.uid+"</td>";
				content += "<td>"+rvdto.wdate+"</td>";
				content += "<td>"+rvdto.content+"</td>";
				content += "<td>"+rvdto.stars_clean+"</td>";
				content += "<td>"+rvdto.stars_location+"</td>";
				content += "<td>"+rvdto.stars_costeff+"</td>";
				content += "</tr>";
			}
		}
		$("#more_list tr:last").after(content);
	}
} */
	
/* function moreList(roomNumber, num){
	var num1 = num;
	
    $.ajax({

        url : "json.do",

        type : "POST",

        cache : false,

        data  : {roomNumber : roomNumber,
        	     num : num1},
        
        dataType : 'json'
    
    });
}; */
  
  	$("#inquiry_submit").click(function() {
		var params = "";
		params += "title=" + $("#title").val();
		params += "&content=" + $("#content").val();//전달값
		params += "&roomNumber=" + $("#roomNumber").val();

		$.post("inquiry_host.do" //요청명령어
		, params, responseProc2 //콜백함수 
		); // post() end

	}); // click() end 

	function responseProc2(result) {

		//팝업을 display:none 으로 바꿔야함
		/* $("#result").empty(); */
		alert(result);
		$("#result").html(result);
		$("#result").show();
 		$("#modalClose").css("display", "none");
	}//responseProc() end
	
	
		
	function replyInsert(i) {
		
		var params ="";
		params += "title=reply";
		params += "&content=" + $("#replyContent"+i).val();//전달값
		params += "&roomNumber=" + $("#roomNumber").val();
		params += "&grpno=" + $("#grpno"+i).val();
		params += "&depth=" + $("#depth").val();
		params += "&randomno=" + i;
		$.post("inquiry_host_reply.do", params, responseProc3, "json"); // post() end
		
	}

	function responseProc3(result) {

		//팝업을 display:none 으로 바꿔야함
		/* $("#result").empty(); */
		var randomno = eval(result.randomno);
		$("#replyContent2"+randomno).html(result.message);
		$("#replyContent2"+randomno).show();
 		$("#modalClose2"+randomno).css("display", "none");
	}//responseProc() end
	
	
	$(document).ready(function(){
		/* $(".item").find(".iqContent").hide(); */
		
		$(".item .tit a").click(function() {            
            $(this).toggleClass("selected");
            //클릭된 나 자신을 제외한 나머리 링크들은 slected 클래스를 무조건 제거
            $(".item .tit a").not(this).removeClass("selected"); 

            // 펼칠 내용 영역 선택
            var target = $(this).parents(".item").find(".iqContent");

            // 나머지 내용 영역을 선택
            var other = $(".item .tit a").not(this).parents(".item").find(".iqContent");

            // 애니메이션으로 열고 닫기 처리
            target.slideToggle(600);
            other.slideUp(600);
            
            // 링크 페이지 이동 중지
            return false;
        });
    });

</script>




<%@ include file="../footer.jsp"%>

