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

.grid-container {
	display: grid;
	grid-template-areas: 'namenphoto namenphoto namenphoto'
		'detail detail book' 'review review review';
	grid-gap: 10px;
	padding-left: 40px;
	padding-right: 40px;
}

.grid-container>div {
	padding: 20px 0;
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
	<main>
	<div class="grid-container">
		<div class="namenphoto">
			<!--  방제목, 주소  -->
			<div>
				<div>
					<h1>${dto.roomName}</h1>
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
				<span>${dto.hotelInform}</span>
			</div>
			<br>
			<!--편의시설-->
			<div>
				<span>${dto.conv} </span>
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
	                        onclick="location.href='booking.do?roomNumber=${dto.roomNumber}&night=${param.night}&hotelName=${dto.hotelName}&roomName=${dto.roomName}&maxGuest=${param.maxGuest}&ck_in=${param.ck_in}&ck_out=${param.ck_out}&fee=${param.fee}&pay=${param.pay}'"><br><br>
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
      <div class="review">review</div>
   </div>
   </main>
</body>
<%@ include file="../footer.jsp"%>
