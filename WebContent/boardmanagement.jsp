<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판관리(마이페이지)</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">


<style>
#columns {
	column-width: 320px;
	column-gap: 15px;
	width: 90%;
	max-width: 770px;
	margin: 50px auto;
}

#columns .card {
	background: #fefefe;
	border: 2px solid #fcfcfc;
	box-shadow: 0 1px 2px rgba(34, 25, 25, 0.4);
	margin: 0 2px 15px;
	padding: 15px;
	padding-bottom: 10px;
	transition: opacity .4s ease-in-out;
	-webkit-column-break-inside: avoid;
	page-break-inside: avoid;
	break-inside: avoid;
	column-break-inside: avoid;
	display: inline-block;
	background-color: #e8e8e8;
}

#columns:hover.car:not(:hover)
{
opacity:0.4;
}
#card1 {
	width: 320px;
	height: 200px;
}

#card2 {
	width: 320px;
	height: 200px;
}

#card3 {
	width: 320px;
	height: 200px;
}

#card4 {
	width: 320px;
	height: 200px;
}

h3 {
	padding: 50px;
	fontstyle: extrabold;
}

img {
	width: 11px;
}
</style>

</head>

<body>

	<h3 align=center>게시글 관리</h3>

	<div id="columns">
		<div id="card1" class="card" style="overflow-y: scroll;">

			<table>

				<tr>
					<td><strong>내가올린 게시글</strong></td>
				</tr>
				<c:forEach var="result" items="${result}">
					<tr>
						<td>제목: ${result.title}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div id="card2" class="card" style="overflow-y: scroll;">
			<table>
				<tr align=center>
					<td><strong>게시글내용</strong></td>
				</tr>
				<c:forEach var="result" items="${result}">
					<tr>
						<td><a href=""></a>글내용: ${result.contents}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div id="card3" class="card" style="overflow-y: scroll;">
			<table>
				<tr align=center>
					<td><strong>게시글올린날짜</strong></td>
				</tr>
				<c:forEach var="result" items="${result}">
					<tr>
						<td>게시일: ${result.writedate}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div id="card4" class="card" style="overflow-y: scroll;">
			<table>
				<tr>
					<td><strong>좋아요<img src="ㅎㅌ.png"></strong></td>
				</tr>
				<c:forEach var="result" items="${result}">
					<tr>
						<td>좋아요 갯수:${result.like}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div id=buttondiv class=button align=center>
		<button type="button" class="btn btn-outline-dark">
			<i class="fa fa-pencil-square-o"></i>게시글작성
		</button>
		<button type="button" class="btn btn-outline-dark">
			<i class="fa fa-tasks"></i> 마이페이지
		</button>
	</div>
</body>

</html>






