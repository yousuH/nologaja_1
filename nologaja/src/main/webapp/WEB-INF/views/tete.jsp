<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="POST" enctype="multipart/form-data" id="fileUploadForm">
		<input id="dmtitle" type="text" name="dmtitle"/>
		<textarea id="dmcontents" name="dmcontents"></textarea>
		<input type="text" id="crcode" name="crcode"/>
		<input type="text" id="tcode" name="tcode"/>
		<input type="text" id="uid" name="uid"/>
		<input type="file" name="files">
		<input type="submit" value="Submit" id="btnSubmit"/>
	</form>
	
	$("#btnSubmit").click(function (event) {

        //preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음
        event.preventDefault();

        // Get form
        var form = $('#fileUploadForm')[0];

	    // Create an FormData object 
        var data = new FormData(form);

	   // disabled the submit button
        $("#btnSubmit").prop("disabled", true);

        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "/document/upload",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (data) {
            	alert("complete");
                $("#btnSubmit").prop("disabled", false);
            },
            error: function (e) {
                console.log("ERROR : ", e);
                $("#btnSubmit").prop("disabled", false);
                alert("fail");
            }
        });

    });
</body>
</html>