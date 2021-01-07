<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="./resources/css/mypage.css">

    <!-- 메인내용 -->
	<div class="mp_sidenav">
	  <a href="mypage.do">예약목록</a>
	  <c:if test="${sessionScope.uid != null }">
	  <a href="bookingcart.do">장바구니</a>
	  </c:if>
	  <c:if test="${sessionScope.suid != null }">
	  <a href="hotelins.do">숙소등록</a>
	  <a href="hotellist.do">숙소목록</a>
	  </c:if>
	  <a href="updateform.do"><strong>회원정보수정</strong></a>
	  <a href="delete.do">회원탈퇴</a>
	  <a href="inquirylist.do">문의내역</a>
	</div>
    
	<div class="mj_wrap">
            <div class="mj_form-wrap">
            <!-- 일반회원 -->
	                <form id="mj_buyer" action="updateproc.do" class="mj_input-group">
	                    <input type="text" class="mj_input-field" name="suid" id="uid" value="${dto.suid}" placeholder="Enter ID" readonly>
	                    <input type="password" class="mj_input-field" name="supw" id="upw" placeholder="Enter Password" required>
	                    <input type="password" class="mj_input-field" name="sreupw" id="reupw" placeholder="Check Password" required>
	                    <input type="text" class="mj_input-field" name="uname" id="uname" value="${dto.uname}" placeholder="Enter Name" required>
	                    <input type="email" class="mj_input-field" name="uemail" id="uemail" value="${dto.uemail}" placeholder="Enter Email" required>
	                    <input type="text" class="mj_input-field" name="upnb" id="upnb" value="${dto.upnb}" placeholder="Enter PhoneNumber" required>
	                    <input type="text" class="mj_input-field" name="bspnb" value="${dto.bspnb }" required>
                    	<input type="checkbox" class="mj_checkbox"><span>Terms and conditions</span>
	                    <button class="mj_submit">수정</button>
	                </form>
            </div>
        </div>
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
	        function sample6_execDaumPostcode() {
	            new daum.Postcode({
	                oncomplete: function(data) {
	                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                    var addr = ''; // 주소 변수
	                    var extraAddr = ''; // 참고항목 변수
	
	                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                        addr = data.roadAddress;
	                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                        addr = data.jibunAddress;
	                    }
	
	                   
	
	                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                    document.getElementById('sample6_postcode').value = data.zonecode;
	                    document.getElementById("sample6_address").value = addr;
	                    // 커서를 상세주소 필드로 이동한다.
	                    document.getElementById("sample6_detailAddress").focus();
	                }
	            }).open();
	        }
                    
            var x = document.getElementById("mj_buyer");
            var y = document.getElementById("mj_seller");
            var z = document.getElementById("mj_btn");
            
            
            function buyer(){
                x.style.left = "60px";
                y.style.left = "450px";
                z.style.left = "0";
            }

            function seller(){
                x.style.left = "-410px";
                y.style.left = "50px";
                z.style.left = "110px";
            }

        </script>
<%@ include file="../footer.jsp" %>