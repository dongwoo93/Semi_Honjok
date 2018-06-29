<%@page import="java.util.List"%>
<%@page import="honjok.web.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="honjok.web.dto.BoardFreeDTO" />
<jsp:useBean id="dao" class="honjok.web.dao.BoardFreeDAO" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$(document).ready(function() {
		$("#fix").click(function() {
			$(location).attr('href', "fix.jsp?no=${seq}")
		})
		$("#delete").click(function() {
			var yes = confirm("삭제 하시겠습니까?");
			if (yes) {
				$(location).attr('href', "delete.jsp?no=${seq}")
			} else {
				return;
			}

		})
		$("#back").click(function() {
			$(location).attr('href', "freeboardView.jsp")
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

						<%-- <c:choose>
			<c:when test="${result>0}">
					<td colspan=3 height=20px><button type="button" id=fix>수정</button> <button type="button" id=delete>삭제</button> <button type="button" id=back>뒤로</button></td>
			</c:when> --%>
						<%-- <c:otherwise>
					<td colspan=3 height=20px><button type="button" id=back>뒤로</button></td>
			</c:otherwise>
		</c:choose> --%>
					<tr>
						<th width=80px height=40px>ID</th>
						<td>댓글</td>
					</tr>

					<tr>
						<th width=80px height=40px>댓글입력</th>
						<td><input type="text" id="comment" name=comment size=75px
							placeholder="고소각 잘 재라.">
							<button id="confirm">확인</button></td>
					</tr>
				</tbody>
			</table>

		</form>
	</div>

</body>
</html>