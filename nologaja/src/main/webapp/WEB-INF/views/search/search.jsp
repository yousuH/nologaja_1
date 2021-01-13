<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- 메인내용 -->

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


</style>



<h3>검색 결과</h3>
<div class="container">
	<div class="col-lg-2"></div>
	<div class="col-lg-8">
		<div style="background: #f8f8f8 !important" class="jumbotron"
			style="padding-top:20px;'">
			<form>
			<input type="hidden" name="ck_in" value="${param.ck_in}">
			<input type="hidden" name="ck_out" value="${param.ck_out}">
			<input type="hidden" name="uid" value="${sessionScope.uid}">
				<table class="table table-bordered">
					<tr class="head">
						<td>roomNumber</td>
						<td>roomName</td>
						<td>hotelNumber</td>
						<td>roomInform</td>
						<td>maxGuest</td>
						<td>conv</td>
						<td>총금액</td>
						<td>체크인</td>
						<td>체크아웃</td>
						<td>찜하기</td>
					</tr>
					<c:forEach var="dto" items="${list}">
						<tr>
							<td><div id="roomNumber" name="roomNumber">${dto.roomNumber}</div></td>
							<td>${dto.roomName}</td>
							<td>${dto.hotelNumber}</td>
							<td>${dto.roomInform}</td>
							<td>${dto.maxGuest}</td>
							<td>${dto.conv}</td>
							<td>100000</td>
							<td>${param.ck_in}</td>
							<td>${param.ck_out}</td>
							<td><!-- 찜한숙소 -->
								<input type="checkbox" id="popup">
								<label for="popup">♡</label>
								<div>
									<div>
										<label for="popup"><strong>Ⅹ</strong></label>
										
										<span style="text-align: center;"><strong>목록에 저장하기</strong></span>
										
										<table>
											<tr>
												<td width="100%">숙소목록</td>
											</tr>
											<c:forEach var="cartFolder" items="${cartFolders}">
												<tr>
													<td><a href="cartdetail.do?${cartFolder.ctFolder_num}">${cartFolder.ctFolder_name}</a></tr>
											</c:forEach>
										</table>
										
										<div>
											<input type="checkbox" id="popup2">
											<label for="popup2">목록 추가하기</label>
											<div>
												<div>
													<label for="popup2"><strong>Ⅹ</strong></label>
													
													<span style="text-align: center;"><strong>목록 이름 작성하기</strong></span>
													
													
													
													<br><input type="text" id="ctFolder_name" name="ctFolder_name" placeholder="이름">
													<br><input type="submit" value="새로 만들기" formaction="addcartfolder">
													
												</div>
												<label for="popup2"></label>
											</div>	
										</div>									
										
										
										
									</div>
									<label for="popup"></label>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</form>
		</div>
	</div>
	<div class="col-lg-2"></div>
</div>


<script>

	function findIdpw(){  
		window.open("findidpw.do", "아이디/비밀번호 찾기", "width=550, height=550");
	}//findIdpw()end

</script>


<%@ include file="../footer.jsp"%>