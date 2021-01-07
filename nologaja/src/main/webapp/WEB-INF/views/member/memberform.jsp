<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

    <!-- 메인내용 -->
	    <div class="mj_wrap">
            <div class="mj_form-wrap">
                <div class="mj_button-wrap">
                    <div id="mj_btn"></div>
                    <button type="button" class="mj_togglebtn" onclick="buyer()">일반회원</button>
                    <button type="button" class="mj_togglebtn" onclick="seller()">판매회원</button>
                </div>
                <form name="mj_buyer" id="mj_buyer" method="post" action="buyerjoin.do" class="mj_input-group" onsubmit="return b_send()">
                    <div>
                    	<input type="text" class="mj_input-field" name="uid" id="uid" placeholder="아이디를 입력하세요" required>
                    	<input type="button" class="mj_input-field" value="ID중복확인" id="btn_uid"><br>
                    	<div id="panel_uid"></div> <!-- 아이디 중복 관련 메세지 -->
                    </div>
                    <div>
                    	<input type="password" class="mj_input-field" name="upw" id="upw" placeholder="비밀번호를 입력하세요" required>
                    	<input type="password" class="mj_input-field" name="reupw" id="reupw" placeholder="비밀번호를 다시 입력하세요" required>
                    	<div class="alert alert-success" id="b_alert-success">비밀번호가 일치합니다</div>
                    	<div class="alert alert-danger" id="b_alert-danger">비밀번호가 일치하지 않습니다</div>
                    </div>
                    <input type="text" class="mj_input-field" name="uname" id="uname" placeholder="이름을 입력하세요" required>
                    <div>
                    	<input type="email" class="mj_input-field" name="uemail" id="uemail" placeholder="이메일을 입력하세요" required>
                    	<input type="button" class="mj_input-field" value="Email중복확인" id="b_btn_uemail"><br>
                    	<div id="b_panel_uemail"></div> <!-- 아이디 중복 관련 메세지 -->
                    </div>
                    <input type="text" class="mj_input-field" name="upnb" id="upnb" placeholder="핸드폰번호를 입력하세요" required>
                    <input type="radio" name="ugender" id="ugender" value="M" checked>남자
                    <input type="radio" name="ugender" id="ugender" value="F">여자
                    <button class="mj_submit">회원가입</button>
                </form>
                <form name="mj_seller" id="mj_seller" method="post" action="sellerjoin.do" class="mj_input-group" onsubmit="return s_send()">
                	<div>
                    	<input type="text" class="mj_input-field" name="suid" id="suid" placeholder="아이디를 입력하세요" required>
                    	<input type="button" class="mj_input-field" value="ID중복확인" id="btn_suid"><br>
                    	<div id="panel_suid"></div> <!-- 아이디 중복 관련 메세지 -->
                    </div>
                    <div>
                    	<input type="password" class="mj_input-field" name="supw" id="supw" placeholder="비밀번호를 입력하세요" required>
                    	<input type="password" class="mj_input-field" name="sreupw" id="sreupw" placeholder="비밀번호를 다시 입력하세요" required>
                    	<div class="alert alert-success" id="s_alert-success">비밀번호가 일치합니다</div>
                    	<div class="alert alert-danger" id="s_alert-danger">비밀번호가 일치하지 않습니다</div>
                    </div>
                    <input type="text" class="mj_input-field" name="uname" id="uname" placeholder="이름을 입력하세요" required>
                    <div>
	                    <input type="email" class="mj_input-field" name="uemail" id="uemail" placeholder="이메일을 입력하세요" required>
	                    <input type="button" class="mj_input-field" value="Email중복확인" id="s_btn_uemail"><br>
                    	<div id="s_panel_uemail"></div> <!-- 아이디 중복 관련 메세지 -->
                    </div> 
                    <input type="text" class="mj_input-field" name="upnb" id="upnb" placeholder="핸드폰번호을 입력하세요">
                    <input type="text" class="mj_input-field" name="bsnb" id="bsnb" placeholder="사업자번호를 입력하세요">
                    <input type="text" class="mj_input-field" name="zipcode" id="zipcode" placeholder="사업자주소 우편번호" readonly>
					<input type="text" class="mj_input-field" name="bsaddr1" id="bsaddr1" placeholder="사업자주소" readonly>
					<input type="button" class="mj_input-field" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" class="mj_input-field" name="bsaddr2" id="bsaddr2" placeholder="사업자상세주소를 입력하세요">
					<input type="text" class="mj_input-field" name="bspnb" id="bspnb" placeholder="사업자 대표번호를 입력하세요">
                    <button class="mj_submit">회원가입</button>
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
	                    document.getElementById("zipcode").value = data.zonecode;
	                    document.getElementById("bsaddr1").value = addr;
	                    // 커서를 상세주소 필드로 이동한다.
	                    document.getElementById("bsaddr2").focus();
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