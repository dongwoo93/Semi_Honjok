<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$("#fix").click(function() {
			$(location).attr('href', "fix.freeb?no=${no}")
		})
		$("#delete").click(function() {
			var yes = confirm("삭제 하시겠습니까?");
			if (yes) {
				$(location).attr('href', "delete.freeb?no=${no}&cat=${result[0].category}")
			} else {
				return;
			}

		})
		$("#back").click(function() {
			$(location).attr('href', "freeboardView.jsp")
		})
		
		$("#like").click(function() {
			if('${id}' == 'nonmember') {
				alert("로그인을 해주세요");
				
			}else {
				$.ajax({
					url:"like.com",
					type:"get",
					data:{boardno:"${no}", memberid:"${id}", likecount:"${result[0].like}"},
					success:function(resp) {
						$("#likecancel").show();
						$("#like").hide();
						$("#likespan").text(resp);
					},
					error : function() {
						console.log("에러 발생!");
					}
				})
			}
	
})
$("#likecancel").click(function() {
	$.ajax({
		url:"like.com",
		type:"get",
		data:{boardno:"${no}", memberid:"${id}", likecount:"${result[0].like}"},
		success:function(resp) {
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

	/* document.getElementById("comment").onclick = function() {
		formid.submit();
	} */
</script>
</head>
<body>

	<div class="container">
		<form method=post action="comment.freeb" id=formid>
		<%-- <input type="hidden" id="cat" value="${result[0]. }"> --%>
			<table class="table table-hover">
				<tbody class="head" id="head">
					<tr>
						<th width=80px height=20px>제목<input type="hidden" id="seq"
							name=seq value="${result[0].seq}"></th>
						<td colspan=2>[${result[0].header}]${result[0].title}</td>
					</tr>
					<tr>
						<th width=80px height=20px>글쓴이</th>
						<td colspan=2>${result[0].writer}</td>
					</tr>
					<tr>
						<th width=80px>내용</th>
						<td colspan=2>${result[0].contents}</td>
					</tr>
					<tr>
						<th width=80px height=20px>첨부파일</th>
						<td colspan=2></td>
					</tr>
					<tr>
						<th width=80px height=20px>작성일</th>
						<th colspan=2>${result[0].writedate}</th>
					</tr>
					<tr>
						<th width=80px height=20px>작성자IP</th>
						<td colspan=2>${result[0].ip}</td>
					<tr align=right>

						
					<td colspan=3 height=20px>
					<c:choose>
					<c:when test="${likeStat == 0}">
					<button type="button" id=like>좋아요</button>
					<button type="button" id=likecancel style="display: none">좋아요 취소</button>
					<span id=likespan>${result[0].like}</span>
					</c:when>
					<c:otherwise>
					<button type="button" id=likecancel>좋아요 취소</button>
					<button type="button" id=like style="display: none">좋아요</button>
					<span id=likespan>${result[0].like}</span>
					</c:otherwise>
					</c:choose>
					
					
					<button type="button" id=fix>수정</button>
					<button type="button" id=delete>삭제</button>
					<button type="button" id=back>뒤로</button></td>
			
					<td colspan=3 height=20px><button type="button" id=back>뒤로</button></td>
		
					<tr>
						<th width=80px height=40px>ID</th>
						<td>댓글</td>
					</tr>
					
					
					
					<c:choose>
					<c:when test="${result2.size() > 0}">
					<c:forEach var="comment" items="${result2}">
					<tr>
					<td>${comment.comment_writer}</td>
					<td>${comment.comment_content}</td>
					</tr>
					</c:forEach>
					</c:when>
					</c:choose>
					
					
					
					
					<tr>
						<th width=80px height=40px>댓글입력</th>
						<form action="comment.freeb" method="post">
						<input type="hidden" id="seq"
							name=count value="${count}">
							<input type="hidden" id="seq"
							name=no value="${result[0].seq}">
							
						<td><input type="text" id="comment" name=comment size=75px
							placeholder="고소각 잘 재라.">
							<button id="confirm">확인</button></td>
							</form>
					</tr>
				</tbody>
			</table>

		</form>
	</div>
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">

				<div class="login-form">
					<form action="" method="post">
						<div class="avatar">
							<img src="avatar.png" alt="Avatar" />
						</div>
						<h2 class="text-center">Member Login</h2>
						<div class="social-btn text-center">
							<a href="naver.do"
								onclick="window.open(this.href, '', 'width=400, height=500'); return false;">
								<img src="naver.PNG"
								style="width: 100%; height: 55px; cursor: pointer;">
							</a>
							<!-- <a href="javascript:loginWithKakao()"> -->
							<a href="javascript:kakaologin()"> <img src="kakao.png"
								style="width: 100%; height: 55px; cursor: pointer;">
							</a> <a href="javascript:startApp()" id="customBtn"
								data-onsuccess="onSignIn"> <img src="google.png"
								style="width: 100%; height: 55px; cursor: pointer;">
							</a>

						</div>
						<div class="or-seperator">
							<i>or</i>
						</div>
						<div class="form-group">
							<input type="text" id="id" class="form-control" name="username"
								placeholder="UserID" required="required">
						</div>
						<div class="form-group">
							<input type="password" id="pass" class="form-control"
								name="password" placeholder="Password" required="required">
						</div>
						<div class="form-group">
							<button type="button" id="login"
								class="btn btn-primary btn-lg btn-block login-btn">LOGIN
							</button>
						</div>
						<p class="text-center small">
							<a href="#">Forgot Password?</a>
						</p>
						<p id="response"></p>

					</form>
				</div>

			</div>

		</div>
	</div>

</body>
</html>