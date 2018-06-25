<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="honjok.web.dto.BoardQnaDTO"%>
<jsp:useBean id="dto" class="honjok.web.dto.BoardQnaDTO">
	<jsp:setProperty name="dto" property="*"></jsp:setProperty>
</jsp:useBean>
<jsp:useBean id="dao" class="honjok.web.dao.BoardQnaDAO" />
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
		$("#write").click(function(){
			$(location).attr('href', "qnaWrite.jsp")
		})
	})
</script>
</head>
<body>
<div class="container">
	<table class="table table-hover">
		<thead  class="head" id="head">
			<tr>
				<td id="no">No.</td>
				<td id="header">말머리</td>
				<td id="title">제목</td>
				<td id="writer">작성자</td>
				<td id="date">작성일</td>
				<td id="view">조회</td>
				<td id="like">추천</td>
			</tr>
		</thead>

		<c:choose>
			<c:when test="${result.size() > 0}">
				<c:forEach var="item" items="${result}">
					<tbody id="body_a">
						<tr>
							<td id="no">${item.seq}
							<td id="header">${item.header}
							<td id="title"><a href="BoardQnaController?no=${item.seq}" class="no-uline">${item.title}</a>
							<td id="writer">${item.writer}
							<td id="date">${item.writedate}
							<td id="view">${item.viewcount}
							<td id="like">${item.suggest}
						</tr>
					</tbody>
				</c:forEach>
			</c:when>
			<c:otherwise>
			<tbody id="body_b">
				<tr id="shit">
					<td id="nothing" colspan=7>표시할 내용이 없습니다.</td>
				</tr>
			</tbody>
			</c:otherwise>
		</c:choose>
		</table>
		<div id="bottom">
			<%-- <% dao.getPageNavi(currentPage)%> --%>
			<input type=button id=write value="글 쓰기">
		</div>
	</div>

</body>
</html>