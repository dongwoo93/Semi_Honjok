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
		$("#delete").click(function() {
			var seq = $("#seq").text();
			$(location).attr('href', 'delete.tip?seq=' + seq);
		})
		$("#modify").click(function() {
			var seq = $("#seq").text();
			$(location).attr('href', 'modify.tip?seq=' + seq);
		})

		$("#like").click(function() {
			$.ajax({
				url : "admin_like.com",
				type : "get",
				data : {
					boardno : "${no}",
					memberid : "${id}"
				},
				success : function(resp) {
					$("#likecancel").show();
					$("#like").hide();
				},
				error : function() {
					console.log("에러 발생!");
				}
			})
		})
		$("#likecancel").click(function() {
			$.ajax({
				url : "admin_like.com",
				type : "get",
				data : {
					boardno : "${no}",
					memberid : "${id}"
				},
				success : function(resp) {
					$("#like").show();
					$("#likecancel").hide();
				},
				error : function() {
					console.log("에러 발생!");
				}
			})
		})
	})
</script>

<style>
.container {
	position: relative;
	text-align:
}
</style>
</head>
<body>
	<div class="container">
		<%-- <c:forEach var="item" items="${result}"> --%>
			<span class="col-sm-3">${result[0].title}</span>
			<span class="cos-sm-2" id="seq">${result[0].seq}</span>
			<span class="col-sm-3"><button type="button"
					class="btn btn-info" id="modify">수정</button></span>
			<span class="col-sm-3"><button type="button"
					class="btn btn-danger" id="delete">삭제</button></span>
			<div>-------------------------------------------------------------------------------</div>
			<div class="col-lg-9">${result[0].contents}</div>
			<div>-------------------------------------------------------------------------------</div>
			<span class="cos-sm-2">
				<c:choose>
					<c:when test="${likeStat == 0}">
					<button type="button" id=like>좋아요</button>
					<button type="button" id=likecancel style="display: none">좋아요 취소</button>
					</c:when>
					<c:otherwise>
					<button type="button" id=likecancel>좋아요 취소</button>
					<button type="button" id=like style="display: none">좋아요</button>
					</c:otherwise>
					</c:choose>
			</span>
			<span class="cos-sm-2">${result[0].viewcount}</span>
			<span class="cos-sm-2">${result[0].writedate}</span>
		<%-- </c:forEach> --%>
	</div>

</body>
</html>