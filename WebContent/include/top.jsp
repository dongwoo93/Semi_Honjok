<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Hi+Melody" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Caveat" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>


<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/parallax.js/1.3.1/parallax.min.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://apis.google.com/js/api:client.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Roboto|Open+Sans|Francois+One:400,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/top.css">
<script type="text/javascript" src="js/top.js"></script>
</head>



<body>
	<nav class="navbar navbar-light fixed-top navbar-expand-md" id="navbar">
   <a class="navbar-brand" href="hollo.com" style="font-size: 26px;">
   	<img src="imges/로고.png" width=120 height=50>
   </a>
   <ul class="nav navbar-nav">
      <li class="nav-item"></li>
      <li class="dropdown mx-2"><a class="dropdown-toggle nav-link" id="hontalkView" data-toggle="dropdown" href="hontalkView.freeb">혼톡</a>
         <ul class="dropdown-menu">
            <li class="dropdown-item" style="font-size: 20px"><a href="hontalkView.freeb">자유게시판</a></li>
            <li class="dropdown-item"><a href="#">고민상담</a></li>
            <li class="dropdown-item"><a href="#">질문/답변</a></li>
            <li class="dropdown-item"><a href="#">혼팁</a></li>
            <li class="dropdown-item"><a href="#">베스트</a></li>
         </ul></li>
      <li class="dropdown nav-item mx-2"><a href="selectNaviCat.tip?category=꿀팁"
         class="dropdown-toggle nav-link" data-toggle="dropdown">꿀팁</a>
         <ul class="dropdown-menu">
            <li class="dropdown-item"><a href="selectNaviCat.tip?category=꿀팁">전체보기</a></li>
            <li class="dropdown-item"><a href="selectNaviSub.tip?category=꿀팁&subject=청소">청소</a></li>
            <li class="dropdown-item"><a href="selectNaviSub.tip?category=꿀팁&subject=라이프">라이프</a></li>
            <li class="dropdown-item"><a href="selectNaviSub.tip?category=꿀팁&subject=경제적">경제적</a></li>
         </ul></li>
      <li class="dropdown nav-item"><a id="cook" href="board/boardtipWrite.jsp"
         class="dropdown-toggle nav-link" data-toggle="dropdown">요리</a>
         <ul class="dropdown-menu mx-2">
            <li class="dropdown-item"><a href="#">초간단요리</a></li>
            <li class="dropdown-item"><a href="#">일반요리</a></li>
         </ul></li>
      <li class="nav-item mx-2"><a href="#" class="catego nav-link">인테리어</a>
      </li>
      <li class="nav-item mx-2"><a href="#" class="catego nav-link">혼족여행</a>
      </li>
      <li class="nav-item mx-2"><a href="#" class="catego nav-link">혼족맛집</a>
      </li>
      <li class="nav-item mx-2"><a href="TestController" class="catego nav-link">혼족쇼핑</a>
      </li>
   </ul>
   <ul class="nav navbar-nav ml-auto">
      <li class="nav-item mx-3"><a href="signup.jsp" class="nav-link">Sign Up</a></li>
      <li class="nav-item"><button type="button" class="nav-link" data-toggle="modal" data-target="#myModal" id="button">Login</button></li>
   </ul>
   </nav>
	
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