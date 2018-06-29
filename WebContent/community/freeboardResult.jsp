<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="../communitycss/freeboard.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$(document).ready(function(){
		$("#check").click(function(){
			$(location).attr('href', "??.jsp")
		})
		$("#list").click(function(){
			$(location).attr('href', "freeboardView.jsp")
		})
	})
</script>
</head>
<body>
<div class=container>
	<div id="result">글이 작성되었습니다.<button type="button" id="check">작성 글 확인</button><button type="button" id="list">목록으로</button></div>
</div>
</body>
</html>