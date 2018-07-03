<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Aloner</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<script src="http://code.jquery.com/color/jquery.color-2.1.2.min.js"
	integrity="sha256-H28SdxWrZ387Ldn0qogCzFiUDDxfPiNIyJX7BECQkDE="
	crossorigin="anonymous"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="communitycss/hontalkView.css">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="communitycss/Footer-with-button-logo.css">

<script>
	$(document).ready(
			function() {
				
				$('.carousel').carousel({
					  interval: 3000
					})
				
				
				$('ul.nav li.dropdown').hover(
						function() {
							$(this).find('.dropdown-menu').stop(true, true)
									.delay(200).fadeIn(500);
						},
						function() {
							$(this).find('.dropdown-menu').stop(true, true)
									.delay(200).fadeOut(500);
						});
				$(window).scroll(
						function() {
							var $nav = $("#navbar");
							$nav.toggleClass('scrolled',
									$(this).scrollTop() > $nav.height());
						});
			})
</script>

</head>
<body>
<nav class="navbar navbar-light fixed-top navbar-expand-md" id="navbar">
<img src="imges/coffee.png" width=60 height=60>
   <a class="navbar-brand" href="hollo.com" style="font-size: 26px;">Hollo</a>
   <ul class="nav navbar-nav">
      <li class="nav-item"></li>
      <li class="dropdown"><a class="dropdown-toggle nav-link" id="hontalkView" data-toggle="dropdown" href="hontalkView.freeb">혼톡</a>
         <ul class="dropdown-menu">
            <li class="dropdown-item"><a href="boardView.freeb?cat=free">자유게시판</a></li>
            <li class="dropdown-item"><a href="boardView.freeb?cat=coun">고민상담</a></li>
            <li class="dropdown-item"><a href="boardView.freeb?cat=qna">질문/답변</a></li>
            <li class="dropdown-item"><a href="boardView.freeb?cat=tip">혼팁</a></li>
            <li class="dropdown-item"><a href="">베스트Ʈ</a></li>
         </ul></li>
      <li class="dropdown nav-item"><a href="#"
         class="dropdown-toggle nav-link" data-toggle="dropdown">꿀팁</a>
         <ul class="dropdown-menu">
            <li class="dropdown-item"><a href="selectNavi.tip">전체보기</a></li>
            <li class="dropdown-item"><a href="#">청소</a></li>
            <li class="dropdown-item"><a href="#">라이프</a></li>
            <li class="dropdown-item"><a href="#">경제적</a></li>
         </ul></li>
      <li class="dropdown nav-item"><a href="board/boardtipWrite.jsp"
         class="dropdown-toggle nav-link" data-toggle="dropdown">요리</a>
         <ul class="dropdown-menu">
            <li class="dropdown-item"><a href="#">초간단요리</a></li>
            <li class="dropdown-item"><a href="#">일반요리</a></li>
         </ul></li>
      <li class="nav-item"><a href="#" class="catego nav-link">인테리어</a>
      </li>
      <li class="nav-item"><a href="#" class="catego nav-link">혼족여행</a>
      </li>
      <li class="nav-item"><a href="#" class="catego nav-link">혼족맛집</a>
      </li>
      <li class="nav-item"><a href="#" class="catego nav-link">혼족쇼핑</a>
      </li>
   </ul>
   <ul class="nav navbar-nav ml-auto">
      <li class="nav-item"><a href="#" class="nav-link">Sign Up</a></li>
      <li class="nav-item"><a href="#" class="nav-link">Login</a></li>
   </ul>
   </nav>
	<nav class="navbar navbar-light fixed-top navbar-expand-md" id="navbar">
	<img src="imges/coffee.png" width=60 height=60> <a
		class="navbar-brand" href="hollo.com" style="font-size: 26px;">Hollo</a>
	<ul class="nav navbar-nav">
		<li class="nav-item"></li>
		<li class="dropdown"><a class="dropdown-toggle nav-link"
			id="hontalkView" data-toggle="dropdown" href="hontalkView.freeb">혼톡</a>
			<ul class="dropdown-menu">
				<li class="dropdown-item"><a href="freeboardView.freeb">자유게시판</a></li>
				<li class="dropdown-item"><a href="#">고민상담</a></li>
				<li class="dropdown-item"><a href="#">질문/답변</a></li>
				<li class="dropdown-item"><a href="#">혼팁</a></li>
				<li class="dropdown-item"><a href="#">베스트Ʈ</a></li>
			</ul></li>
		<li class="dropdown nav-item"><a href="#"
			class="dropdown-toggle nav-link" data-toggle="dropdown">꿀팁</a>
			<ul class="dropdown-menu">
				<li class="dropdown-item"><a href="#">전체보기</a></li>
				<li class="dropdown-item"><a href="#">청소</a></li>
				<li class="dropdown-item"><a href="#">라이프</a></li>
				<li class="dropdown-item"><a href="#">경제적</a></li>
			</ul></li>
		<li class="dropdown nav-item"><a href="#"
			class="dropdown-toggle nav-link" data-toggle="dropdown">요리</a>
			<ul class="dropdown-menu">
				<li class="dropdown-item"><a href="#">초간단요리</a></li>
				<li class="dropdown-item"><a href="#">일반요리</a></li>
			</ul></li>
		<li class="nav-item"><a href="#" class="catego nav-link">인테리어</a>
		</li>
		<li class="nav-item"><a href="#" class="catego nav-link">혼족여행</a>
		</li>
		<li class="nav-item"><a href="#" class="catego nav-link">혼족맛집</a>
		</li>
		<li class="nav-item"><a href="#" class="catego nav-link">혼족쇼핑</a>
		</li>
	</ul>
	<ul class="nav navbar-nav ml-auto">
		<li class="nav-item"><a href="#" class="nav-link">Sign Up</a></li>
		<li class="nav-item"><a href="#" class="nav-link">Login</a></li>
	</ul>
	</nav>
	<div id="demo" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="imges/sky.jpg" alt="Los Angeles" width="1200" height="700">
				<div class="carousel-caption">
					<h3>Los Angeles</h3>
					<p>We had such a great time in LA!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="imges/nature-3042751_1280.jpg" alt="Chicago" width="1200"
					height="700">
				<div class="carousel-caption">
					<h3>Chicago</h3>
					<p>Thank you, Chicago!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="imges/hiker-1149898_1280.jpg" alt="New York" width="1200"
					height="700">
				<div class="carousel-caption">
					<h3>New York</h3>
					<p>We love the Big Apple!</p>
				</div>
			</div>
		</div>
	</div>

	<div class="container2">
		<div id="free">
			<h5>
				<a href="boardView.freeb?cat=free">자유게시판</a>
			</h5>

			<table class="table table-hover" id="first-table"
				style="width: 500px; table-layout: fixed;">
				<thead class="thead-dark">
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="free" items="${free}" varStatus="status">
						<tr>
							<td class="td-contents">${free.seq}</td>
							<td class="td-contents">${free.title}</td>
							<td class="td-contents">${free.contents}</td>
							<td class="td-contents">${free.writer}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

		</div>

		<div id="free2">
			<h5>
				<a href="boardView.freeb?cat=qna">질문/답변</a>
			</h5>

			<table class="table table-hover" id="second-table"
				style="width: 500px; table-layout: fixed;">
				<thead class="thead-dark">
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="qna" items="${qna}" varStatus="status">
						<tr>
							<td class="td-contents">${qna.seq}</td>
							<td class="td-contents">${qna.title}</td>
							<td class="td-contents">${qna.contents}</td>
							<td class="td-contents">${qna.writer}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>

		<div id="free3">
			<h5>
				<a href="#">베스트</a>
			</h5>

			<table class="table table-hover" id="second-table"
				style="width: 350px; height: 300px; table-layout: fixed;">
				<thead class="thead-dark">
					<tr>
						<th>좋아요 수</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
					</tr>
				</thead>
				
				<tbody>
					
					<c:forEach var="best" items="${best}" varStatus="status">
					<tr>
						<th scope="row">${best.like}</th>
						<td class="td-contents2"><a href="#">${best.title}</a></td>
						<td class="td-contents2">${best.contents}</td>
						<td class="td-contents2">${best.writer}</td>
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>

		<div id="free4">
			<h5>
				<a href="boardView.freeb?cat=coun">고민상담</a>
			</h5>

			<table class="table table-hover" id="second-table"
				style="width: 500px; table-layout: fixed;">
				<thead class="thead-dark">
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="counsel" items="${counsel}" varStatus="status">
						<tr>
							<td class="td-contents">${counsel.seq}</td>
							<td class="td-contents">${counsel.title}</td>
							<td class="td-contents">${counsel.contents}</td>
							<td class="td-contents">${counsel.writer}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>

		<div id="free5">
			<h5>
				<a href="boardView.freeb?cat=tip">혼팁</a>
			</h5>

			<table class="table table-hover" id="second-table"
				style="width: 500px; table-layout: fixed;">
				<thead class="thead-dark">
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="tip" items="${tip}" varStatus="status">
						<tr>
							<td class="td-contents">${tip.seq}</td>
							<td class="td-contents">${tip.title}</td>
							<td class="td-contents">${tip.contents}</td>
							<td class="td-contents">${tip.writer}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>


	<footer id="myFooter">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<h2 class="logo">
					<a href="#"> LOGO </a>
				</h2>
			</div>
			<div class="col-md-2">
				<h5>Get started</h5>
				<ul>
					<li><a href="#">Home</a></li>
					<li><a href="#">Sign up</a></li>
					<li><a href="#">Downloads</a></li>
				</ul>
			</div>
			<div class="col-md-2">
				<h5>About us</h5>
				<ul>
					<li><a href="#">Company Information</a></li>
					<li><a href="#">Contact us</a></li>
					<li><a href="#">Reviews</a></li>
				</ul>
			</div>
			<div class="col-md-2">
				<h5>Support</h5>
				<ul>
					<li><a href="#">FAQ</a></li>
					<li><a href="#">Help desk</a></li>
					<li><a href="#">Forums</a></li>
				</ul>
			</div>
			<div class="col-md-3">
				<div class="social-networks">
					<a href="https://twitter.com/?lang=ko" class="twitter"><i
						class="fa fa-twitter"></i></a> <a href="https://www.facebook.com/"
						class="facebook"><i class="fa fa-facebook"></i></a> <a
						href="https://www.google.com/" class="google"><i
						class="fa fa-google-plus"></i></a>
				</div>
				<button type="button" class="btn btn-secondary">Contact us</button>
			</div>
		</div>
	</div>
	<div class="footer-copyright">
		<p>&#xA9; 2018 Copyright Text</p>
	</div>
	</footer>
</body>
</html>