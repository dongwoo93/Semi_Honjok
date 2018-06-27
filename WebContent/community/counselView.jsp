<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="honjok.web.dto.BoardFreeDTO"%>
<jsp:useBean id="dto" class="honjok.web.dto.BoardFreeDTO">
	<jsp:setProperty name="dto" property="*"></jsp:setProperty>
</jsp:useBean>
<jsp:useBean id="dao" class="honjok.web.dao.BoardFreeDAO" />
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
		console.log("들어옴");
		
		$("#all").click(function(){
			$(location).attr('href', "counselView.coun")
		})
		$("#chat").click(function(){
			$(location).attr('href', "ajax01.coun")
		})
		$("#humor").click(function(){
			$(location).attr('href', "ajax02.coun")
		})
		$("#beast").click(function(){
			$(location).attr('href', "ajax03.coun")
		})
		$("#write").click(function(){
			$(location).attr('href', "community/counselWrite.jsp");
		})
	})
</script>
</head>
<body>
<div class="container">
	<table class="table table-hover">
		<thead  class="head" id="head">
		<tr>
			<div class="headSelect">
				<button type="button" id="all">전체</button><button type="button" id="chat">히오스</button><button type="button" id="humor">와우</button><button type="button" id="beast">배그</button>
			</div>
		</tr>
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
							<td id="title"><a href="CounselController.coun?no=${item.seq}" class="no-uline">${item.title}</a>
							<td id="writer">${item.writer}
							<td id="date">${item.writedate}
							<td id="view">${item.viewcount}
							<td id="like">${item.like}
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
			${navi}
			<input type=button id="write" value="글 쓰기">
		</div>
	</div>

</body>
</html>