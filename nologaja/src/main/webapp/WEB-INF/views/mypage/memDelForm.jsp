<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="./resources/css/mypage.css">

<!-- 메인내용 -->
<div class="mp_sidenav">
	  <a href="mypage.do">예약목록</a>
	  <c:if test="${sessionScope.uid != null }">
	  		<a href="cartfolderlist.do">찜한숙소</a>
	  </c:if>
	  <c:if test="${sessionScope.suid != null }">
	  		<a href="hotelins.do">숙소등록</a>
	  		<a href="hotellist.do">숙소목록</a>
	  </c:if>
	  <a href="updateform.do">회원정보수정</a>
	  <a href="delete.do"><strong>회원탈퇴</strong></a>
	  <a href="inquirylist.do">문의내역</a>
</div>

<div class="mp_main">
	<div style="height: 400px">
		<h2>회원탈퇴</h2>
		<p>비밀번호를 입력해주세요</p>
		
		<c:choose>
			<c:when test="${sessionScope.uid !=null }">
				<form id="delform" name="delform" action="bdelete.do" onsubmit="return pwCheck(this)">
					<p>구매자</p>
			        <input type="password" name="upw" id="upw" placeholder="비밀번호" required>			
			        <input type="submit" value="구매자 회원탈퇴">
			        ${cnt==0?"<p style='color:red;font-weight:bold'>비밀번호를 틀렸어요<p>":""}
		       </form>				
			</c:when>
			<c:otherwise>
				<form id="delform" name="delform" action="sdelete.do" onsubmit="return pwCheck(this)">
					<p>판매자</p>
			        <input type="password" name="supw" id="supw" placeholder="비밀번호" required>			
			        <input type="submit" value="판매자 회원탈퇴">
			        ${cnt==0?"<p style='color:red;font-weight:bold'>비밀번호를 틀렸어요<p>":""}
	   	        </form>				
			</c:otherwise>
		</c:choose>
			<!-- 비밂번호 일치하면 submit 되게 
			<input type="password" id="pw" name="pw" required>
			-->
	</div>
</div>


<script>
	function pwCheck(f){
		var upw=f.upw.value;  //name="upw"값 가져오기
		
		//비번의 맞고 틀림을 하기전에....정말로 삭제할건지를 물어볼께요
		if(confirm('정말 회원탈퇴를 하시겠습니까?')){ //확인 또는 취소 버튼 선택
			return true;
		}else{
			return false;
		}//if end
	}//pwCheck() end
</script>

<script>
	function pwCheck(s){
		var supw=s.supw.value;  //name="supw"값 가져오기
		
		//비번의 맞고 틀림을 하기전에....정말로 삭제할건지를 물어볼께요
		if(confirm('정말 회원탈퇴를 하시겠습니까?')){ //확인 또는 취소 버튼 선택
			return true;
		}else{
			return false;
		}//if end
	}//pwSheck() end
</script>

<%@ include file="../footer.jsp"%>