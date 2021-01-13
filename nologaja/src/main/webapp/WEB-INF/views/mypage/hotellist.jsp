<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="./resources/css/mypage.css">

    <!-- 메인내용 -->
	<div class="mp_sidenav">
	  <a href="mypage.do">예약목록</a>
	  <c:if test="${sessionScope.uid != null }">
	  <a href="cartfolderlist.do">찜한숙소</a>
	  </c:if>
	  <c:if test="${sessionScope.suid != null }">
	  <a href="hotelins.do">숙소등록</a>
	  <a href="hotellist.do"><strong>숙소목록</strong></a>
	  </c:if>
	  <a href="updateform.do">회원정보수정</a>
	  <a href="delete.do">회원탈퇴</a>
	  <a href="inquirylist.do">문의내역</a>
	</div>
	
	<div class="mp_main">
	  <h2>예약목록</h2>
	  <p>This sidebar is of full height (100%) and always shown.</p>
	  <p>Scroll down the page to see the result.</p>
	  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
	  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
	  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
	  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
	</div>
   
   
   <script>

   
   </script>
<%@ include file="../footer.jsp" %>