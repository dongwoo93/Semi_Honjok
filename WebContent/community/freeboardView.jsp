<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="honjok.web.dto.BoardUserDTO"%>
<jsp:useBean id="dto" class="honjok.web.dto.BoardUserDTO">
	<jsp:setProperty name="dto" property="*"></jsp:setProperty>
</jsp:useBean>
<jsp:useBean id="dao" class="honjok.web.dao.BoardDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="communitycss/freeboard.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$(document).ready(function() {
		console.log("들어옴");

		$("#all").click(function() {
			$(location).attr('href', "freeboardView.freeb")
		})
		$("#chat").click(function() {
			$(location).attr('href', "ajax01.freeb")
		})
		$("#humor").click(function() {
			$(location).attr('href', "ajax02.freeb")
		})
		$("#beast").click(function() {
			$(location).attr('href', "ajax03.freeb")
		})
		$("#write").click(function() {
			$(location).attr('href', "community/freeboardWrite.jsp");
		})
	})
</script>
</head>
<body>
	<div class="container">
		<table class="table table-hover">
			<thead class="head" id="head">
				<tr>
					<td colspan=7>
					<c:choose>
					 <c:when test="${cat eq 'free'}">
					 <div class="headSelect">
							<a href="boardView.freeb?cat=free"><button class="header" type="button" id="all">전체</button></a>
							<a href="boardView.freeb?cat=free&head=잡담"><button class="header" type="button" id="chat">잡담</button></a>
							<a href="boardView.freeb?cat=free&head=유머"><button class="header" type="button" id="humor">유머</button></a>
							<a href="boardView.freeb?cat=free&head=동물"><button class="header" type="button" id="beast">동물</button></a>
						</div>
					 </c:when>
					  <c:when test="${cat eq 'qna'}">
					  <div class="headSelect">
							<a href="boardView.freeb?cat=qna"><button class="header" type="button" id="all">전체</button></a>
						</div>
					  </c:when>
					   <c:when test="${cat eq 'tip'}">
					   <div class="headSelect">
							<a href="boardView.freeb?cat=tip"><button class="header" type="button" id="all">전체</button></a>
							<a href="boardView.freeb?cat=tip&head=생활"><button class="header" type="button" id="chat">생활</button></a>
							<a href="boardView.freeb?cat=tip&head=레시피"><button class="header" type="button" id="humor">레시피</button></a>
							<a href="boardView.freeb?cat=tip&head=맛집"><button class="header" type="button" id="beast">맛집</button></a>
							<a href="boardView.freeb?cat=tip&head=여행"><button class="header" type="button" id="beast">여행</button></a>
						</div>
					   </c:when>
					    <c:when test="${cat eq 'coun'}">
					    <div class="headSelect">
							<a href="boardView.freeb?cat=coun"><button class="header" type="button" id="all">전체</button></a>
							<a href="boardView.freeb?cat=coun&head=취미"><button class="header" type="button" id="chat">취미</button></a>
							<a href="boardView.freeb?cat=coun&head=게임"><button class="header" type="button" id="humor">게임</button></a>
							<a href="boardView.freeb?cat=coun&head=이성"><button class="header" type="button" id="beast">이성</button></a>
							<a href="boardView.freeb?cat=coun&head=인생"><button class="header" type="button" id="beast">인생</button></a>
							<a href="boardView.freeb?cat=coun&head=친구"><button class="header" type="button" id="beast">친구</button></a>
							<a href="boardView.freeb?cat=coun&head=컴플렉스"><button class="header" type="button" id="beast">컴플렉스</button></a>
						</div>
					    </c:when>
					</c:choose>
						
					</td>
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
								<td id="title"><a
									href="BoardFree_Controller.freeb?no=${item.seq}&count=${item.viewcount}"
									class="no-uline">${item.title}</a>
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
		<div id="bottom" align=center>
			${navi}</div> <div id="btn"><input type=button id="write" value="글 쓰기">
		</div>
	</div>

</body>
</html>