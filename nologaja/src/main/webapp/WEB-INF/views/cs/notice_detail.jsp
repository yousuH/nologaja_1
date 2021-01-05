<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- 메인내용 -->
<div>
	<a href="inquiry.do">문의하기</a> <a href="notice.do">공지사항</a> <a
		href="faq.do">FAQ</a>
</div>


<div class="container">
	<div class="col-lg-2"></div>
	<div class="col-lg-8">
		<div style="background: #f8f8f8 !important" class="jumbotron"
			style="padding-top:20px;'">
			<table class="table table-bordered">
				<tr>
					<td class="head">번호</td>
					<td style="text-align: left;">${noticeno}</td>
				</tr>
				<tr>
					<td class="head">제목</td>
					<td style="text-align: left;">${title}</td>
				</tr>
				<tr>
					<td style="vertical-align: middle; height: 300px;" class="head">내용</td>
					<td style="text-align: left;">${content}</td>
				</tr>
				<tr>
					<td class="head">작성일</td>
					<td>${wdate}</td>
				</tr>
			</table>

			<input class="btn btn-default" type="button" value="수정"
				onclick="location.href='notice_update.do?noticeno=${noticeno}'">
			<input class="btn btn-default" type="button" value="삭제"	
				onclick="location.href='notice_delete.do?noticeno=${noticeno}'">
			<button class="btn btn-default" type="button"
				onclick="location.href='noticeList.jsp'">목록</button>
		</div>
	</div>
	<div class="col-lg-2"></div>
</div>
<%@ include file="../footer.jsp"%>