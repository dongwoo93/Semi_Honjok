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
						$("#back").click(function() {
							$(location).attr('href', "freeboardView.jsp")
						})
					})
</script>
</head>
<body>

	<div class="container">
		<form method=post action="comment.freeb" id=formid>
			<table class="table">
				<tbody class="head" id="head">
					<tr>
						<td width=100px height=20px>제목<input type="hidden" id="seq"
							name=seq value="${result[0].seq}"></td>
						<th colspan=2>[${result[0].header}]${result[0].title}</th>
						<td><b id="date">${result[0].writedate}</b></td>

					</tr>
					<tr>
						<td width=100px height=20px>글쓴이</td>
						<th colspan=3>${result[0].writer}</th>
					</tr>
					<tr>
						<td colspan=3 height=400px>${result[0].contents}</td>
					</tr>
					<tr>
						<td width=100px height=20px>첨부파일</td>
						<td colspan=3></td>
					</tr>
					<tr>
						<td width=100px height=20px>작성자IP</td>
						<th colspan=3>${result[0].ip}</th>
					<tr align=right>

						<%-- <c:choose> --%>
						<%-- <c:when test="${result>0}"> --%>
						<td colspan=4 height=20px><button type="button" id=fix>수정</button>
							<button type="button" id=delete>삭제</button>
							<button type="button" id=back>목록</button></td>
						<%-- </c:when> --%>
						<%-- <c:otherwise> --%>
						<!-- <td colspan=4 height=20px><button type="button" id=back>뒤로</button></td> -->
						<%-- </c:otherwise>
		</c:choose> --%>


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
						<th width=80px height=40px>세션ID</th>
						<form action="comment.freeb" method="post">
							<input type="hidden" id="seq" name=count value="${count}">
							<input type="hidden" id="seq" name=no value="${result[0].seq}">
						<td colspan=2><textarea id="comment" name=comment
								placeholder="바른말 고운말을 사용하여 미연에 고소를 방지합시다." cols="100" rows="2"></textarea></td>
						<td><input type="submit" value="확인" id="confirm" name="confirm"></td>
						</form>
					</tr>
					<tr align=right>
						<%-- <c:choose> --%>
						<%-- <c:when test="${result>0}"> --%>
						<td colspan=4 height=20px><button type="button" id=fix>수정</button>
							<button type="button" id=delete>삭제</button>
							<button type="button" id=back>뒤로</button></td>
						<%-- </c:when> --%>
						<%-- <c:otherwise> --%>
						<!-- <td colspan=4 height=20px><button type="button" id=back>뒤로</button></td> -->
						<%-- </c:otherwise>
		</c:choose> --%>
					</tr>
				</tbody>
			</table>

		</form>
	</div>

</body>
</html>