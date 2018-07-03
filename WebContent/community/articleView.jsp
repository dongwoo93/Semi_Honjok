<%@page import="java.util.List"%>
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
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="communitycss/articleView.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$("#fix").click(function() {
							$(location).attr('href', "fix.freeb?no=${no}")
						})
						$("#delete")
								.click(
										function() {
											var yes = confirm("삭제 하시겠습니까?");
											if (yes) {
												$(location)
														.attr('href',
																"delete.freeb?no=${no}&cat=${result[0].category}")
											} else {
												return;
											}

										})
						$("#tolist").click(function() {
							$(location).attr('href', "boardView.freeb?cat=${result[0].category}")
						})

						$("#like").click(function() {
							if ('${id}' == 'nonmember') {
								alert("로그인을 해주세요");

							} else {
								$.ajax({
									url : "like.com",
									type : "get",
									data : {
										boardno : "${no}",
										memberid : "${id}",
										likecount : "${result[0].like}"
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
							}

						})
						$("#likecancel").click(function() {
							$.ajax({
								url : "like.com",
								type : "get",
								data : {
									boardno : "${no}",
									memberid : "${id}",
									likecount : "${result[0].like}"
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

			/* document.getElementById("comment").onclick = function() {
				formid.submit();
			} */
</script>
</head>
<body>

	<div class="container">
		<form method=post action="comment.freeb" id=formid>
			<table class="table">
				<tbody class="head" id="head">
					<tr>
						<td width=100px>제목<input type="hidden" id="seq"
							name=seq value="${result[0].seq}"></td>
						<th colspan=2>[${result[0].header}]${result[0].title}</th>
						<td width=180px><b id="date">${result[0].writedate}</b></td>

					</tr>
					<tr>
						<td width=100px height=20px>글쓴이</td>
						<th colspan=3>${result[0].writer}</th>
					</tr>
					<tr>
						<td colspan=3 height=400px>${result[0].contents}</td>
					</tr>
					<tr>
						<td align=center colspan=4><c:choose>
								<c:when test="${likeStat == 0}">
									<button type=button id=like><img src="kejang/good.jpg"></button>
									<button type=button id=likecancel style="display: none"><img src="kejang/no.png"></button>
									<!-- <button type="button" id=like>좋아요</button>
									<button type="button" id=likecancel style="display: none">좋아요
										취소</button> -->
									<span id=likespan>${result[0].like}</span>
								</c:when>
								<c:otherwise>
									<button type=button id=likecancel><img src="kejang/no.png"></button>
									<button type=button id=like style="display: none"><img src="kejang/good.jpg"></button>
									<!-- <button type="button" id=likecancel>좋아요 취소</button>
									<button type="button" id=like style="display: none">좋아요</button> -->
									<span id=likespan>${result[0].like}</span>
								</c:otherwise>
							</c:choose></td>
					</tr>
					<tr>
						<td width=100px height=20px>첨부파일</td>
						<td colspan=3></td>
					</tr>
					<tr>
						<td width=100px height=20px>작성자IP</td>
						<th colspan=3>${result[0].ip}</th>
					<tr ali gn=right>


						<td colspan=4 height=20px align=right>
							<button type="button" id=fix>수정</button>
							<button type="button" id=delete>삭제</button>
							<button type="button" id=tolist>목록</button>
						</td>

						<!-- <td colspan=3 height=20px><button type="button" id=tolist>목록</button></td> -->
						<c:choose>
							<c:when test="${result2.size() > 0}">
								<c:forEach var="result2" items="${result2}">
									<tr>
										<td width=100px height=20px>${result2.comment_writer}</td>
										<td colspan=2>${result2.comment_content}</td>
										<td><b id="date">${result2.comment_wridate}</b></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					<tr>
						<th width=80px height=40px>${sessionScope.loginId}</th>
						<form action="comment.freeb" method="post">
							<input type="hidden" id="seq" name=count value="${count}">
							<input type="hidden" id="seq" name=no value="${result[0].seq}">
							<td colspan=2><textarea id="comment" name=comment
									placeholder="바른말 고운말을 사용하여 미연에 고소를 방지합시다." cols="110" rows="2"></textarea></td>
							<td><input type="submit" value="확인" id="confirm"
								name="confirm"></td>
						</form>
					</tr>
					<tr align=right>
						<%-- <c:choose> --%>
						<%-- <c:when test="${result>0}"> --%>
						<td colspan=4 height=20px><button type="button" id=fix>수정</button>
							<button type="button" id=delete>삭제</button>
							<button type="button" id=tolist>목록</button></td>
						<%-- </c:when> --%>
						<%-- <c:otherwise> --%>
						<!-- <td colspan=4 height=20px><button type="button" id=tolist>목록</button></td> -->
						<%-- </c:otherwise>
		</c:choose> --%>
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