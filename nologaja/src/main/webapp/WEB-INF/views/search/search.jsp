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

.incontents_area{
	position:relative;
	left:50%;
	margin-left:-300px;
	width:900px;
	height:auto;
	float:left;
}
.sub_list_hotellist{
	width:100%;
	height:auto;
}
.hotellist{
	position:relative;
	width:900px;
	height:auto;
}
.hotel{
	position:relative;
	width:100%;
	height:auto;
}
.hotellist_box{
	position:relative;
	width:100%;
	height:176px;
	background-color:#FFF;
	border-top:dotted 1px #d7d7d7;
	color:#444444;
}
.listbox_img{
	position:absolute;
	left:0;
	width:216px;
	height:156.5px;
	padding-top:19.5px;
}
.listbox_title{
	position:absolute;
	left:216px;
	width:454px;
	height:156.5px;
	padding-top:19.5px;
}
.list_name{
	width: 430px;
	height: 30px;
	font-size: 20px;
	letter-spacing: -0.5px;
	cursor: pointer;
}
.list_name p{
	white-space:nowrap;
	overflow:hidden;
	text-overflow:ellipsis;
	font-weight:700;
	padding-top: 2px;
}
/* 2018.08.24 kang 호텔등급 변경 시작 */

.list_grade{
	position: relative;
	top: 0;
	display: inline-block;
	width: auto;
	height: 22px;
	margin-top: 2px;
}
.list_grade span{
	position: relative;
	top: 0;
	left: 0;
	line-height: 22px;
	font-size: 13px;
	margin-right: 3px;
}
.hotelgrade{
	position: relative;
	top: 0;
	padding: 0;
	margin: 0;
	vertical-align: middle;
	margin-right: 10px;
}
.list_icon{
	position: relative;
	top: 0;
	display: inline-block;
	width: auto;
	height: 22px;
	font-size: 12px;
	line-height: 22px;
	color: #fff;
	margin-top: 2px;
	font-family: 'NanumSquareRound', sans-serif;
}
/* ico style */

.list_ico01{
	width: auto;
	background-color:#3cb878;
	border:solid 1px #3cb878;
	padding:0px 3px;
	margin-right:2px;
	font-weight: 600;
}
.list_ico02{
	width: auto;
	background-color:#b53735;
	border:solid 1px #b53735;
	padding:0px 3px;
	margin-right:2px;
	font-weight: 600;
}

.list_ico03{
	width: auto;
	background-color:#173390;
	border:solid 1px #173390;
	padding:0px 3px;
	margin-right:2px;
	font-weight: 600;
}

.list_ico04{
	width: auto;
	/*border:solid 1px #4c3188; 2019041811069 kay */
	background-color:#fff;
	color:#444444;
	padding:0px 3px;
	margin-right:2px;
	font-weight: 600;
}


/**/

.list_adrs{
	position:relative;
	left:0;
	width:400px;
	height:22px;
	font-size:13px;
}

.list_adrs p{
	white-space:nowrap;
	overflow:hidden;
	text-overflow:ellipsis;
}

/* 2018.08.24 kang 호텔등급 변경 끝 */

.list_review{
	position:absolute;
	left:0;
	bottom:14px;
	width:auto;
	height:14px;
	padding:4px 6px;
	border-radius:3px;
	font-size:10.5px;
	color:#09af89;
	float:right;
}
.list_review img{
	float:left;
	margin-right:5px;
}
.list_info{
	position:absolute;
	left:170px;
	bottom:15px;
	width:auto;
	height:22px;
	text-align:center;
}
.list_imgview{
	position:absolute;
	left:260px;
	bottom:15px;
	width:auto;
	height:22px;
	text-align:center;
}
.list_map{
	position:absolute;
	left:355px;
	bottom:15px;
	width:auto;
	height:22px;
	text-align:center;
}
.list_info p,.list_imgview p,.list_map p{
	font-size:13px;
	font-weight:500;
	padding:2px 6px;
	border-radius:3px;
}
.listbox_price{
	position:absolute;
	top:0;
	left:500px;
	width:180px;
	height:176px;
	color:#d11717;
	padding:20px 25px;
	background-color:#f5f5f5;
	cursor:pointer;
}

.listbox_price p{
	position:relative;
	top:0;
	font-size:14px;
	text-align:right;
}
.listbox_price .current_coin{
	font-size:16px;
	font-weight:500;
}

/* 2018.08.24 kang 가격 폰트 수정 시작 */
.listbox_price .pricevalue{
	font-size:22px;
	font-weight:600;
	font-family: Tahoma, Verdana, sans-serif;
	letter-spacing: -0.5px;
}

.hotelpage{
	margin-top:55px;
	margin-bottom:150px;
	position:relative;
	width:900px;
	height:60px;
}

/* 2018.08.24 kang 페이지 네비 레이아웃 수정 시작 */
.page_navi{
	position:relative;
	left: 50%;
	transform: translate(-50%,0);
	bottom:0px;
	width:auto;
	height:22px;
	font-weight:500;
	color:#444444;
	text-align: center;
}
/* 2018.08.24 kang 페이지 네비 레이아웃 수정 끝 */

.page_navi td{
	width:20px;
	padding:0px 2px 0px 2px;
	text-align:center;
}
.page_navi td img{
	cursor:pointer;
}
.page_navi td span{
	display:block;
	width:20px;
	height:20px;
	float:left;
	border-radius:3px;
	cursor:pointer;
}
.pagenumber.active{
	background-color:#e6e6e6;
}

.no_result{
	position:relative;
	width:100%;
	height:103px;
	text-align:center;
	border-top:solid 1px #d8d8d8;
	border-bottom:solid 1px #d8d8d8;
	font-size:15px;
	margin-bottom:1300px;
	padding-top:70px;
}

.filter_area{
	position:relative;
	left:50%;
	margin-left:-600px;
	width:300px;
	height:1410px;
	float:left;
}

.filter_origin{
	position:relative;
	top:0;
	left:0;
}
.sub_list_filter_result{
	width:100%;
	height:156px;
}
.sub_list_filter_title{
	width:240px;
	height:48px;
	border-top:solid 1px #d7d7d7;
}
.sub_list_filter_name{
	width:240px;
	height:81px;
	padding-top:10px;
}
.sub_list_filter_location{
	width:240px;
	height:76px;
	padding-top:10px;
	border-top:dotted 1px #d7d7d7;
}
.sub_list_filter_price{
	width:240px;
	height:180px;
	padding-top:10px;
	border-top:dotted 1px #d7d7d7;
}
.sub_list_filter_grade{
	width:240px;
	height:118px;
	padding-top:10px;
	border-top:dotted 1px #d7d7d7;
}
.sub_list_filter_convention{
	width:240px;
	height:293px;
	padding-top:10px;
	border-top:dotted 1px #d7d7d7;
}
.sub_list_filter_banner{
	width:240px;
	height:372px;
	border-top:solid 1px #d7d7d7;
}
.sub_list_filter_nav{
	display:none;
	position:fixed;
	top:80px;
	left:50%;
	margin-left:-600px;
	width:200px;
	height:30px;
	background-color:#f4b225;
	border:0;
	border-radius:5px;
	color:#fff;
	text-align:center;
	line-height:30px;
	cursor:pointer;
	box-shadow:0 3px 3px #d3d3d3;
}
.fitfixed{
	position:fixed;
	top:110px;
	left:50%;
	margin-left:-600px;
	animation: fadein .5s;
    -moz-animation: fadein .5s;
    -webkit-animation: fadein .5s; 
    -o-animation: fadein .5s;
}
@keyframes fadein {
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-moz-keyframes fadein { 
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-webkit-keyframes fadein {
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-o-keyframes fadein { 
    from {
        opacity:0;
    }
    to {
        opacity: 1;
    }
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
													<section class="list_booking_part" style="width: 1000px; margin: aut">
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
						</nav>
					</div>
				</div>
			</div>
		</div>		
		
	</header>

<!-- 메인내용 -->

<main style="min-height: 1400px">


<h3 align="center" style="padding-top: 15px; padding-bottom: 15px;">검색 결과</h3>
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
					<c:forEach var="dto" items="${list}">

						<div class="hotel">
							<div class="hotellist_box">
								<div class="listbox_img">
									<div class="list_img">
										<!-- 이미지 불러오기 -->
										<img style="width: 15%" src="${pageContext.request.contextPath}/resources/img/hotel/${dto.savefile}"/>
									</div>
								</div>
								<!-- 방 이름 -->
								<div class="listbox_title">
									<div class="list_name">
										<p title="${dto.roomName}" class="hotelname" onclick="">
											<a href="searchdetail.do?roomNumber=${dto.roomNumber }&ck_in=${param.ck_in}&ck_out=${param.ck_out}&maxGuest=${param.maxGuest}&night=${night}&fee=${dto.fee}">${dto.roomName }</a>
										</p>
										<!-- 찜한숙소 -->
										<form style="float: right;" method="post">											
											<input type="hidden" id="roomNumber" name="roomNumber" value="${dto.roomNumber}">
											<input type="hidden" id="guests" name="guests" value="${param.maxGuest}">
											<input type="hidden" id="ck_in" name="ck_in" value="${param.ck_in}">
											<input type="hidden" id="ck_out" name="ck_out" value="${param.ck_out}">
											<input type="hidden" id="night" name="night" value="${night}">
											<input type="hidden" id="fee" name="fee" value="${fee}">
												
											<input type="checkbox" id="popup">
											<label for="popup">♡</label>
											<div><!-- 모달창 시작(찜) -->
												<div>
													<label for="popup"><strong>Ⅹ</strong></label>													
													
													<span style="text-align: center;"><strong>목록에 저장하기</strong></span>
													
													<table>
														<tr>
															<td width="100%">숙소목록</td>
														</tr>
														<c:forEach var="cartFolder" items="${cartFolders}">
															<tr>
																<td><input type="button" id="btn_cartFolder" name="ctFolder_name" value="${cartFolder.ctFolder_name}">
																<input type="hidden" id="ctFolder_num" name="ctFolder_num" value="${cartFolder.ctFolder_num}"></td></tr>
														
														</c:forEach>
													</table>
													
													<div>
														<input type="checkbox" id="popup2">
														<label for="popup2">목록 추가하기</label>
														<div>
															<div>
																<label for="popup2"><strong>Ⅹ</strong></label>
																
																<span style="text-align: center;"><strong>목록 이름 작성하기</strong></span>										
																
																
																<br><input type="text" id="ctFolder_name" name="ctFolder_name" placeholder="이름" value="">
																<br><input type="button" id="btn_ctFolder_name" value="새로 만들기">
																
															</div>
															<label for="popup2"></label>
														</div>	
													</div>										
												</div><!-- 모달창 끝(찜) -->
												<label for="popup"></label>
											</div>
										</form>
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

									<!-- 가격 -->
									<div class="listbox_price">
										<p style="color: #d11717">Price</p>
										<p class="current_coin" style="color: #d11717">
											KRW&nbsp;&nbsp;<span class="pricevalue" style="color: #d11717">${dto.fee }</span>
										</p>
									</div>
								</div>

							</div>
						</div>

					</c:forEach>
					<!-- 호텔 반복 끝-->
					<div class="hotelpage">
						<table class="page_navi">
							<tr>

								<td><span class="pagenumber active">1</span></td>

								<td><span class="pagenumber"><a
										style="display: inline-block; height: 20px; width: 20px;"
										href="Javascript:fnHotelSearch('RATING','2','','','DESC');">2</a></span></td>

								<td><span class="pagenumber"><a
										style="display: inline-block; height: 20px; width: 20px;"
										href="Javascript:fnHotelSearch('RATING','3','','','DESC');">3</a></span></td>

								<td><span class="pagenumber"><a
										style="display: inline-block; height: 20px; width: 20px;"
										href="Javascript:fnHotelSearch('RATING','4','','','DESC');">4</a></span></td>

								<td><span class="pagenumber"><a
										style="display: inline-block; height: 20px; width: 20px;"
										href="Javascript:fnHotelSearch('RATING','5','','','DESC');">5</a></span></td>

								<td><span class="pagenumber"><a
										style="display: inline-block; height: 20px; width: 20px;"
										href="Javascript:fnHotelSearch('RATING','6','','','DESC');">6</a></span></td>

								<td><span class="pagenumber"><a
										style="display: inline-block; height: 20px; width: 20px;"
										href="Javascript:fnHotelSearch('RATING','7','','','DESC');">7</a></span></td>

								<td><span class="pagenumber"><a
										style="display: inline-block; height: 20px; width: 20px;"
										href="Javascript:fnHotelSearch('RATING','8','','','DESC');">8</a></span></td>

								<td><span class="pagenumber"><a
										style="display: inline-block; height: 20px; width: 20px;"
										href="Javascript:fnHotelSearch('RATING','9','','','DESC');">9</a></span></td>

							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>


	</main>
<script src="./resources/js/jquery.js"></script>
<script>
$("#btn_ctFolder_name").click(function(){
	var params="";
	params += "ctFolder_name=" + $("#ctFolder_name").val();
	params += "&guests=" + $("#maxGuest").val();
	params += "&ck_in=" + $("#ck_in").val();
	params += "&ck_out=" + $("#ck_out").val();
	params += "&night=" + $("#night").val();
	params += "&totalFee=" + $("#fee").val();
	params += "&roomNumber=" + $("#roomNumber").val();  //전달값
	//alert(params);
	
	$.post(
		"addcartfolder_insert.do"  		   		  //요청명령어
		,params 
		, responseProc   				  //콜백함수 
	); // post() end

}); // click() end 


function responseProc(){
	
	//팝업을 display:none 으로 바꿔야함
	$("#popup2").css("display", "none");
	$("#popup").css("display", "none");
	
}//responseProc() end 



$("#btn_cartFolder").click(function(){
	var params="";
	params += "ctFolder_num=" + $("#ctFolder_num").val();
	params += "&ctFolder_name=" + $("#btn_cartFolder").val();
	params += "&guests=" + $("#maxGuest").val();
	params += "&ck_in=" + $("#ck_in").val();
	params += "&ck_out=" + $("#ck_out").val();
	params += "&night=" + $("#night").val();
	params += "&totalFee=" + $("#fee").val();
	params += "&roomNumber=" + $("#roomNumber").val();  //전달값
	alert(params);
	
	$.post(
		"cartinsert.do"  		   		  //요청명령어
		,params 
		, responseProc   				  //콜백함수 
	); // post() end

}); // click() end 

function responseProc2(){
	
	//팝업을 display:none 으로 바꿔야함
	$("#popup").css("display", "none");
}//responseProc() end 

</script>

<%@ include file="../footer.jsp"%>