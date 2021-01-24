<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function insert() {
		var form = document.inquiry_host;
		var title = form.title.value;
		var content = form.content.value;
		
		$.post(
			'/inquiry_host.do',
			{
				title:title,
				content:content
			},
			function(data) {
				var title = data.title;
				var content = data.content;
				$('.title').text(title);
				$('.content').text(content);
			}
		)
		
	}
</script>
</head>
<body>
	<form action="inquiry_host_proc" name="inquiry_host">
		<input type="text" name="title" id="title" placeholder="제목">
		<textarea rows="30" cols="5" name="content" id="content" placeholder="내용"></textarea>
		<input type="button" value="등록하기" onclick="insert()">
	</form>
</body>
</html>