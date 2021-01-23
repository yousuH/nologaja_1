
function btn_proc(){
	if(confirm("정말 예약을 진행하시겠습니까?") == true){    //확인
		document.booking.submit();
	}else{   //취소
		return false;
	}
}

function btn_no(){
	if(confirm("정말 예약을 취소하시겠습니까?") == true){    //확인
		document.bkupdate.submit();
	}else{   //취소
		return false;
	}
}