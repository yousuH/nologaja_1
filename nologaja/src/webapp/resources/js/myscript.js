/**
 *  myscript.js
 */
 
 
/************* 구매자 아이디&이메일 중복 확인 시작 *************/
//아이디
$(function(){
	$.removeCookie("checkID");
});
	    	
$("#btn_uid").click(function(){
	var uid= "uid=" + $("#uid").val().trim();
	$.post("buyerProc.do", uid, checkID, "json");
});//click end

function checkID(result){
	var count=eval(result.count); //형변환
	if(count==0){
		$("#panel_uid").css("color", "blue");
		$("#panel_uid").text("사용가능한 아이디입니다");
		//$.cookie("쿠키변수명", 값)
		$.cookie("checkID", "PASS");
	}else {
		$("#panel_uid").css("color", "red");
		$("#panel_uid").text("중복된 아이디입니다");
		$("#uid").focus(); //커서생성
	}//if end
}//checkID() end

//이메일
$(function(){
	$.removeCookie("checkEmail");
});
	    	
$("#btn_uemail").click(function(){
	var uemail= "uemail=" + $("#uemail").val().trim();
	$.post("buyerEmailProc.do", uemail, checkEmail, "json");
});//click end

function checkEmail(result){
	var count=eval(result.count); //형변환
	if(count==0){
		$("#panel_uemail").css("color", "blue");
		$("#panel_uemail").text("사용가능한 이메일입니다");
		//$.cookie("쿠키변수명", 값)
		$.cookie("checkEmail", "PASS");
	}else {
		$("#panel_uemail").css("color", "red");
		$("#panel_uemail").text("중복된 이메일입니다");
		$("#uemail").focus(); //커서생성
	}//if end
}//checkEmail() end
	    	
function b_send(){

	//아이디 5~10글자 인지?
	var uid=document.getElementById("uid").value;
	uid=uid.trim();
	if(!(uid.length>=5 && uid.length<=10)){
		alert("아이디 5~10글자 이내 입력해 주세요");
		document.getElementById("uid").focus();
		return false;
  	}//if end
  	
	//비밀번호 5~10글자 인지?
	var upw=document.getElementById("upw").value;
	upw=upw.trim();
	if(!(upw.length>=5 && upw.length<=10)){
		alert("비밀번호 5~10글자 이내 입력해 주세요");
		document.getElementById("upw").focus();
		return false;
	}//if end

//--------------------------------------------------------------  
	//아이디 쿠키변수값 가져오기
	var checkID=$.cookie("checkID");
	if(checkID=="PASS"){
		return true;
	}else {
		$("#panel_uid").css("color", "green");
		$("#panel_uid").text("아이디 중복확인 해주세요");
		$("#uid").focus(); //커서생성
		return false;
	}//if end
	
	//이메일 쿠키변수값 가져오기
	var checkEmail=$.cookie("checkEmail");
	if(checkEmail=="PASS"){
		return true;
	}else {
		$("#panel_uemail").css("color", "green");
		$("#panel_uemail").text("이메일 중복확인 해주세요");
		$("#uemail").focus(); //커서생성
		return false;
	}//if end
}//b_send() end

/************* 구매자 아이디&이메일 중복 확인 끝 *************/


/************* 구매자 비밀번호 일치 여부 시작 *************/
$(function(){
	$("#alert-success").hide(); //원문의 div 문장 숨김
	$("#alert-danger").hide();
	$("input").keyup(function(){
	
		var upw=$("#upw").val();
		var reupw=$("#reupw").val();
		
		var supw=$("#supw").val();
		var sreupw=$("#sreupw").val();
		
		if(upw != null){
			if(upw != "" || reupw != ""){ //두가지 속성 비교
				if(upw == reupw){
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				}else{
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		}else if(supw != null) {
			if(supw != "" || sreupw != ""){ //두가지 속성 비교
				if(supw == sreupw){
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				}else{
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		}
	});
});
/************* 구매자 비밀번호 일치 여부 끝 *************/


        