<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/parallax.js/1.3.1/parallax.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<script>
	$(document).ready(function() {
		$("#delete").click(function() {
			var seq = ${result[0].seq};
			$(location).attr('href', 'delete.tip?seq=' + seq);
		})
		$("#modify").click(function() {
			var seq = ${result[0].seq};
			$(location).attr('href', 'modify.tip?seq=' + seq);
		})

		$("#like").click(function() {
			$.ajax({
				url : "admin_like.com",
				type : "get",
				data : {
					boardno : "${no}",
					memberid : "${id}",
					likecount : "${result[0].likeit}"
				},
				success : function(resp) {
					$("#likecancel").show();
					$("#like").hide();
					$("#likespan").text(resp);
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
					memberid : "${id}",
					likecount : "${result[0].likeit}"
				},
				success : function(resp) {
					$("#like").show();
					$("#likecancel").hide();
					$("#likespan").text(resp);
				},
				error : function() {
					console.log("에러 발생!");
				}
			})
		})
	})

	</script>

<style>
#like, #likecancel {
	width: 3%;
	height: 3%;
	margin: 0px;
	padding0: 0px;
}

.col-md-3 {
	margin: 0px;
	max-width: 60px;
}

div {
	border:1px dotted green;
}
.cos-md-8{
	text-align:right;
}
span{
	border:1px dotted orange;
}
</style>
</head>
<body style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px;">
	<div class="container">
		<%-- <c:forEach var="item" items="${result}"> --%>
		<div class="col-md-15">
			<h2>${result[0].title}</h2>
		</div>
		<div class="col-md-12" style="text-align: right">
			<span class="col-md-2">${result[0].writedate}</span>
			<%-- <span class="cos-sm-2" id="seq">${result[0].seq}</span> --%>
			<span class="col-md-3"><button type="button"
					class="btn btn-info" id="modify">수정</button></span> <span class="col-md-3"><button
					type="button" class="btn btn-danger" id="delete">삭제</button></span>
		</div>
		<hr style="height: 1">
		

		<div class="col-md-15">${result[0].contents}</div>
		<hr style="height: 1">
		<span class="col-md-2"> <c:choose>
				<c:when test="${likeStat == 0}">
					<!-- <button type="button" id=like>좋아요</button> -->
					<span><input type="image" src="images/nomal_heart.png" id="like"></span>
					<!-- <button type="button" id=likecancel style="display: none">좋아요 취소</button> -->
					<span><input type="image" src="images/heart_77931.png" id="likecancel"
						style="display: none" style="width:4%;"></span>
					<span id=likespan>${result[0].likeit}</span>
				</c:when>
				<c:otherwise>
					<!-- <button type="button" id=likecancel>좋아요 취소</button> -->
					<input type="image" src="images/heart_77931.png" id="likecancel">
					<input type="image" src="images/nomal_heart.png" id="like"
						style="display: none" style="width:4%;">
					<!-- <button type="button" id=like style="display: none">좋아요</button> -->
					<span id=likespan>${result[0].likeit}</span>
				</c:otherwise>
			</c:choose>
		</span> <span class="col-md-8">조회수 : ${result[0].viewcount}</span>
		<button type="button" onclick="$('html, body').stop().animate( { scrollTop : 0 } ); ">맨 위로</button>
		<%-- </c:forEach> --%>
	</div>

</body>
</html>