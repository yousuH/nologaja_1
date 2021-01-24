<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="./resources/css/mypage.css">


<!-- 메인내용 -->
<div class="mp_sidenav">
	<a href="mypage.do"><strong>예약목록</strong></a>
	<c:if test="${sessionScope.uid != null }">
		<a href="cartfolderlist.do">찜한숙소</a>
	</c:if>
	<c:if test="${sessionScope.suid != null }">
		<a href="hotelins.do">숙소등록</a>
		<a href="hotellist.do">숙소목록</a>
	</c:if>
	<a href="updateform.do">회원정보수정</a> <a href="delete.do">회원탈퇴</a> <a
		href="inquirylist.do">문의내역</a>
</div>

<div class="mp_main">
	<h2>문의상세보기</h2>
	<br>
	
	<div><strong>문의글</strong></div>
	<br>
	<table>
		<tr style="width: 500px" >
			<td style="width: 100px; padding-bottom: 15px">답변상태</td>
			<td style="width: 150px">
				<c:choose>
					<c:when test="${IHlist[0].rp_st eq 'Y'}">
						<div>답변완료</div>
					</c:when>
					<c:when test="${IHlist[0].rp_st eq 'N'}">
						<div>미답변</div>
					</c:when>
				</c:choose></td>
			<td style="width: 100px">숙소</td>
			<td style="width: 150px">${IHlist[0].roomName }</td>
		</tr>
		<tr>
			<td style="width: 100px; padding-bottom: 15px">작성자</td>
			<td>${IHlist[0].uid }</td>
			<td>작성일</td>
			<td>${IHlist[0].swdate }</td>
		</tr>
		<tr>
			<td style="width: 100px; padding-bottom: 15px">제목</td>
			<td colspan="3">${IHlist[0].title }</td>
		</tr>
	</table>
	<div>내용</div>
	<textarea style="width: 500px; height: 100px">${IHlist[0].content }</textarea>



	<br>
	<br>

	<c:if test="${IHlist[1] != null}">
		<div><strong>답변</strong></div><br>
		<div>작성일 : ${IHlist[1].swdate }</div>
		<textarea style="width: 500px; height: 100px">${IHlist[1].content }</textarea>
	</c:if>


</div>

<%@ include file="../footer.jsp"%>