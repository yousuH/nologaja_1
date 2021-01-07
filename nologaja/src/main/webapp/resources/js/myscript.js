/**
 *  myscript.js
 */
 
 
/************* 구매자 아이디&이메일 중복 확인 시작 *************/
//아이디
$(function(){
	$.removeCookie("b_checkID");
});
	    	
$("#btn_uid").click(function(){
	var uid= "uid=" + $("#uid").val().trim();
	$.post("buyerProc.do", uid, b_checkID, "json");
});//click end

function b_checkID(result){
	var count=eval(result.count); //형변환
	if(count==0){
		$("#panel_uid").css("color", "blue");
		$("#panel_uid").text("사용가능한 아이디입니다");
		//$.cookie("쿠키변수명", 값)
		$.cookie("b_checkID", "PASS");
	}else {
		$("#panel_uid").css("color", "red");
		$("#panel_uid").text("중복된 아이디입니다");
		$("#uid").focus(); //커서생성
	}//if end
}//b_checkID() end

//이메일
$(function(){
	$.removeCookie("b_checkEmail");
});
	    	
$("#b_btn_uemail").click(function(){
	var uemail= "uemail=" + $("#uemail").val().trim();
	$.post("buyerEmailProc.do", uemail, b_checkEmail, "json");
});//click end

function b_checkEmail(result){
	var count=eval(result.count); //형변환
	if(count==0){
		$("#b_panel_uemail").css("color", "blue");
		$("#b_panel_uemail").text("사용가능한 이메일입니다");
		//$.cookie("쿠키변수명", 값)
		$.cookie("b_checkEmail", "PASS");
	}else {
		$("#b_panel_uemail").css("color", "red");
		$("#b_panel_uemail").text("중복된 이메일입니다");
		$("#uemail").focus(); //커서생성
	}//if end
}//b_checkEmail() end
	    	
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
	var b_checkID=$.cookie("b_checkID");
	if(b_checkID=="PASS"){
		return true;
	}else {
		$("#panel_uid").css("color", "green");
		$("#panel_uid").text("아이디 중복확인 해주세요");
		$("#uid").focus(); //커서생성
		return false;
	}//if end
	
	//이메일 쿠키변수값 가져오기
	var b_checkEmail=$.cookie("b_checkEmail");
	if(b_checkEmail=="PASS"){
		return true;
	}else {
		$("#b_panel_uemail").css("color", "green");
		$("#b_panel_uemail").text("이메일 중복확인 해주세요");
		$("#uemail").focus(); //커서생성
		return false;
	}//if end
}//b_send() end

/************* 구매자 아이디&이메일 중복 확인 끝 *************/


/************* 판매자 아이디&이메일 중복 확인 시작 *************/
//아이디
$(function(){
	$.removeCookie("s_checkID");
});
	    	
$("#btn_suid").click(function(){
	var suid= "suid=" + $("#suid").val().trim();
	$.post("sellerProc.do", suid, s_checkID, "json");
});//click end

function s_checkID(result){
	var count=eval(result.count); //형변환
	if(count==0){
		$("#panel_suid").css("color", "blue");
		$("#panel_suid").text("사용가능한 아이디입니다");
		//$.cookie("쿠키변수명", 값)
		$.cookie("s_checkID", "PASS");
	}else {
		$("#panel_suid").css("color", "red");
		$("#panel_suid").text("중복된 아이디입니다");
		$("#suid").focus(); //커서생성
	}//if end
}//s_checkID() end

//이메일
$(function(){
	$.removeCookie("s_checkEmail");
});
	    	
$("#s_btn_uemail").click(function(){
	var uemail= "uemail=" + $("#uemail").val().trim();
	$.post("sellerEmailProc.do", uemail, s_checkEmail, "json");
});//click end

function s_checkEmail(result){
	var count=eval(result.count); //형변환
	if(count==0){
		$("#s_panel_uemail").css("color", "blue");
		$("#s_panel_uemail").text("사용가능한 이메일입니다");
		//$.cookie("쿠키변수명", 값)
		$.cookie("s_checkEmail", "PASS");
	}else {
		$("#s_panel_uemail").css("color", "red");
		$("#s_panel_uemail").text("중복된 이메일입니다");
		$("#uemail").focus(); //커서생성
	}//if end
}//s_checkEmail() end
	    	
function s_send(){

	//아이디 5~10글자 인지?
	var suid=document.getElementById("suid").value;
	suid=suid.trim();
	if(!(suid.length>=5 && suid.length<=10)){
		alert("아이디 5~10글자 이내 입력해 주세요");
		document.getElementById("suid").focus();
		return false;
  	}//if end
  	
	//비밀번호 5~10글자 인지?
	var supw=document.getElementById("supw").value;
	supw=supw.trim();
	if(!(supw.length>=5 && supw.length<=10)){
		alert("비밀번호 5~10글자 이내 입력해 주세요");
		document.getElementById("supw").focus();
		return false;
	}//if end

//--------------------------------------------------------------  
	//아이디 쿠키변수값 가져오기
	var s_checkID=$.cookie("s_checkID");
	if(s_checkID=="PASS"){
		return true;
	}else {
		$("#panel_suid").css("color", "green");
		$("#panel_suid").text("아이디 중복확인 해주세요");
		$("#suid").focus(); //커서생성
		return false;
	}//if end
	
	//이메일 쿠키변수값 가져오기
	var s_checkEmail=$.cookie("s_checkEmail");
	if(s_checkEmail=="PASS"){
		return true;
	}else {
		$("#s_panel_uemail").css("color", "green");
		$("#s_panel_uemail").text("이메일 중복확인 해주세요");
		$("#uemail").focus(); //커서생성
		return false;
	}//if end
}//s_send() end

/************* 판매자 아이디&이메일 중복 확인 끝 *************/


/************* 구매자&판매자 비밀번호 일치 여부 시작 *************/
$(function(){
	
	$("#b_alert-success").hide(); //원문의 div 문장 숨김
	$("#b_alert-danger").hide();
	
	$("input").keyup(function(){
	
		var upw=$("#upw").val();
		var reupw=$("#reupw").val();
		
		if(upw != "" || reupw != ""){ //두가지 속성 비교
			if(upw == reupw){
				$("#b_alert-success").show();
				$("#b_alert-danger").hide();
				$("#submit").removeAttr("disabled");
			}else{
				$("#b_alert-success").hide();
				$("#b_alert-danger").show();
				$("#submit").attr("disabled", "disabled");
			}
		}
	});
});
/************* 구매자&판매자 비밀번호 일치 여부 끝 *************/


/************* 구매자&판매자 비밀번호 일치 여부 시작 *************/
$(function(){
	
	$("#s_alert-success").hide(); //원문의 div 문장 숨김
	$("#s_alert-danger").hide();
	
	$("input").keyup(function(){
	
		var supw=$("#supw").val();
		var sreupw=$("#sreupw").val();
		
		if(supw != "" || sreupw != ""){
			if(supw == sreupw){
				$("#s_alert-success").show();
				$("#s_alert-danger").hide();
				$("#submit").removeAttr("disabled");
			}else{
				$("#s_alert-success").hide();
				$("#s_alert-danger").show();
				$("#submit").attr("disabled", "disabled");
			}
		}
	});
});
/************* 구매자&판매자 비밀번호 일치 여부 끝 *************/