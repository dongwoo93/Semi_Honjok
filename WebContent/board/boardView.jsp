<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/parallax.js/1.3.1/parallax.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$(document).ready(function() {
		$("#delete").click(function(){
			var seq = $("#seq").text();
			$(location).attr('href', 'delete.tip?seq='+seq);
		})
		$("#modify").click(function(){
			var seq = $("#seq").text();
			$(location).attr('href', 'modify.tip?seq='+seq);
		})
	})
</script>

<style>

.container {
position:relative;
text-align:
}
</style>
</head>
<body>
	<div class="container">

		<c:forEach var="item" items="${result}">
			
			<span class="col-sm-3">${item.title}</span><span class="cos-sm-2" id="seq">${item.seq}</span>
			<span class="col-sm-3"><button type="button"
					class="btn btn-info" id="modify">수정</button></span>
			<span class="col-sm-3"><button type="button"
					class="btn btn-danger" id="delete">삭제</button></span>
			<div>-------------------------------------------------------------------------------</div>
			<div class="col-lg-9">${item.contents}</div>
			<div>-------------------------------------------------------------------------------</div>
			<span class="cos-sm-2">${item.like}</span>
			<span class="cos-sm-2">${item.viewcount}</span>
			<span class="cos-sm-2">${item.writedate}</span>
		</c:forEach>
	</div>

</body>
</html>