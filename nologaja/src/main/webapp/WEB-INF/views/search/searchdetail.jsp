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
body {
	width: 1000px;
}

.namenphoto {
	grid-area: namenphoto;
}

.detail {
	grid-area: detail;
}

.book {
	grid-area: book;
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





		<div class="book">
			<div
				style="border: 1px solid black; border-radius: 5%; text-align: center;">
				<table border="1px" width="300px" height="150px"
					style="border: 1px; border-radius: 5%; padding: 5px;">
					<tr style="height: 75px;">
						<th style="width: 150px;"><span>체크인</span><br> <span>${param.ck_in}</span>
						</th>
						<th style="width: 150px;"><span>체크아웃</span><br> <span>${param.ck_out}</span>
						</th>
					</tr>
					<tr style="height: 75px;">
						<td colspan="2"><span>인원수</span><br> <span>${param.maxGuest}</span>
						</td>
					</tr>
				</table>

				<input type="submit" value="예약하기" style="width: 85%; padding: 10px;"><br>
				<br> <span>총 합계</span><span>${param.fee}원</span>
			</div>

		</div>



		<div class="review">review</div>

	</div>
</body>
</html>
