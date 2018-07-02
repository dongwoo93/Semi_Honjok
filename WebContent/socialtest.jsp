<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
<button id="likeit" class="like" name="like">좋아요</button>
<script>
$("#likeit").click(function() {
	$.ajax({
		url:"like.com",
		type:"get",
		data:{boardno:"${boardSeq}", memberid:"${id}"},
		success:function(resp) {
			alert("성공");
			$("#likeit").html("좋아요 취소");
		},
		error : function() {
			console.log("에러 발생!");
		}
	})
	
})
</script>


</body>
</html>