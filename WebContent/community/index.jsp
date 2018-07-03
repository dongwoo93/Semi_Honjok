<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/parallax.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/parallax.js/1.3.1/parallax.min.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://apis.google.com/js/api:client.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Roboto|Open+Sans|Francois+One:400,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="communitycss/Footer-with-button-logo.css">
<script type="text/javascript" src="js/index.js"></script>
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
	<div id="demo" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="imges/불꽃.jpg" alt="Los Angeles">
				<div class="carousel-caption">
					<h3 class="en-text">The life is only once.</h3>
					<p></p>
				</div>
			</div>	
			<div class="carousel-item">
				<img src="imges/뒷모습.jpg" alt="Chicago">
				<div class="carousel-caption">
					<h3 class="en-text">I was never less alone than when by myself.</h3>
					<p></p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="imges/신발.jpg" alt="New York">
				<div class="carousel-caption">
					<h3 class="en-text">Life improves slowly and goes wrong fast, and only catastrophe is clearly visible.</h3>
					<p></p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="imges/아이2.jpg" alt="New York">
				<div class="carousel-caption">
					<h3 class="en-text">Although the world is full of suffering, it is full also of the overcoming of it.</h3>
					<p></p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="imges/뒷모습2.jpg" alt="New York">
				<div class="carousel-caption">
					<h3 class="en-text">Waste not fresh tears over old griefs.</h3>
					<p></p>
				</div>
			</div>
		</div>
	</div>
	<div>
		<h1 style="margin-top: 30px; margin-left: 330px; margin-bottom: 20px">Latest
			Contents</h1>
		<div class="card-deck">
			<div class="col-sm-2" id="card1">
				<div class="card">
					<img class="card-img-top" src="fjords.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>

						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-2" id="card1">
				<div class="card">
					<img class="card-img-top" src="fjords.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>

						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-2" id="card1">
				<div class="card">
					<img class="card-img-top" src="fjords.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>

						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-2" id="card1">
				<div class="card">
					<img class="card-img-top" src="fjords.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>

						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>
			</div>
		</div>

		<div class="card-deck">
			<div class="col-sm-2" id="card1">
				<div class="card">
					<img class="card-img-top" src="fjords.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>

						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-2" id="card1">
				<div class="card">
					<img class="card-img-top" src="fjords.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>

						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-2" id="card1">
				<div class="card">
					<a href=""> <img class="card-img-top" src="fjords.jpg"
						alt="Card image cap">
					</a>
					<div class="card-body">


						<a href=""><h5 class="card-title">Card title</h5></a>
						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-2" id="card1">
				<div class="card">
					<img class="card-img-top" src="fjords.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>

						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="wrapper">
		<div class="wrapper2">
			<div class="text1" data-aos="zoom-out-right" data-aos-once="true">
				<h1
					class="headline font-inherit fontsize-xxxl fontweight-700 lh-inherit align-center transform-inherit "
					style="margin: 0 0 40px 0;">혼족이란?</h1>
				<p style="text-align: center;">
					<span style="color: #808080;">혼자 밥을 먹거나 여가생활과 쇼핑을 즐기며, </span>
				</p>
				<p style="text-align: center;">
					<span style="color: #808080;">여행도 홀로 떠나는 등 혼자 활동하는게 취미이거나 </span>
				</p>
				<p style="text-align: center;">
					<span style="color: #808080;">그런 성향이 강한 사람들을 일컫는 줄임말.</span>
				</p>
			</div>
			<section id="section2" class="black-circle ct-u-paddingBoth120"
				style="min-height: 445px; width: 50%; float: left;"> </section>
		</div>
		<div class="wrapper2">
			<section id="section3" class="black-circle ct-u-paddingBoth120"
				style="min-height: 445px; width: 50%; float: left;"> </section>
			<div style="min-height: 445px; width: 50%; float: right; background-color: #1f4ac1;">
			<!-- <div class="text1" data-aos="zoom-out-left" data-aos-once="true"> -->
				<h1
					class="headline font-inherit fontsize-xxxl fontweight-700 lh-inherit align-center transform-inherit "
					style="margin: 0 0 40px 0; text-align: center; margin-top: 90px; color: #ffffff;">이젠 혼자라서 즐겁다.</h1>
				<p style="text-align: center;">
					<span style="color: #ffffff;">오롯이 나만을 위한 시간, 나만의 힐링타임 </span>
				</p>
				<p style="text-align: center;">
					<span style="color: #ffffff;">나 혼자 폼나게 사는 1코노미 전성시대</span>
				</p>
				<p style="text-align: center;">
					<span style="color: #ffffff;">이제는 선택이 아닌 필수 </span>
				</p>
				<p style="text-align: center;">
					<span style="color: #ffffff;">혼족인 당신을 위한 최고의 선물</span>
				</p>
				<p style="text-align: center;">
					<span style="color: #ffffff;">Hollo가 당신과 함께 합니다. </span>
				</p>
				<!-- </div> -->
			</div>
		</div>
		<div class="wrapper2">
			<div class="text1" data-aos="zoom-out-right" data-aos-once="true">
				<h1
					class="headline font-inherit fontsize-xxxl fontweight-700 lh-inherit align-center transform-inherit "
					style="margin: 0 0 40px 0;">인간에게 고독이란 중요한것이다.</h1>
				<p style="text-align: center;">
					<span style="color: #808080;">당신은 평안과 만족을 얻으려면 고독이 필요하다.</span>
				</p>
				<p style="text-align: center;">
					<span style="color: #808080;">고독은 당신 영혼의 갈증을 해소시키는 샘이다. </span>
				</p>
				<p style="text-align: center;">
					<span style="color: #808080;">고독은 당신의 모든 경험으로부터</span>
				</p>
				<p style="text-align: center;">
					<span style="color: #808080;">진실로 가치 있는 것을 선택할 수 있는 실험실이다.</span>
				</p>
				<p style="text-align: center;">
					<span style="color: #808080;"> - Margaret Murak</span>
				</p>
			</div>
			<section id="section4" class="black-circle ct-u-paddingBoth120"
				style="min-height: 445px; width: 50%; float: left;"> </section>
		</div>
	</div>

	<div id="conbox"
		style="text-align: center; padding-left: 180px; padding-top: 60px; padding-bottom: 60px;"
		data-aos="fade-zoom-in" data-aos-once="true">
		<div class="wpb_wrapper"
			style="text-align: center; display: inline-block; margin-right: 200px;">
			<div class="iconbox  iconbox-style-8 icon-color-accent color-dark clearfix"
				onclick="location.href="#" style="cursor: pointer;">
				<h3 class="bottom-title">혼족 맛집</h3>
				<img src="images/레스토랑.png" class="iconimg" width="90px;" height="90px;">
				<p></p>
				<p style="text-align: center;" class="bottom-text">
					<span style="color: #333333; margin-top: 15px">혼밥, 혼술의 시대 </span>
				</p>
				<p style="text-align: center;" class="bottom-text">
					<span style="color: #333333;">혼족을 위한 맛집들</span>
				</p>
			</div>
			<!-- <div class="wpb_text_column wpb_content_element "> -->
			<!-- 	<div class="wpb_wrapper">
					<p style="text-align: center;">
						<a href="#" class="Shortcut">바로가기</a>
					</p>

				</div> -->
			<!-- </div> -->

		</div>

		<div class="wpb_wrapper"
			style="text-align: center; display: inline-block; margin-right: 200px;">
			
			<div class="iconbox  iconbox-style-8 icon-color-accent color-dark clearfix" 
				onclick="location.href="#" style="cursor: pointer;">
				<h3 class="bottom-title">혼족 쇼핑</h3>
				<img src="images/쇼핑.png" class="iconimg" width="90px;" height="90px;">
				<p></p>
				<p style="text-align: center;" class="bottom-text">
					<span style="color: #333333; margin-top: 15px">1인 쇼핑 전성시대</span>
				</p>
				<p style="text-align: center;" class="bottom-text">
					<span style="color: #333333;">혼족 라이프 맞춤 상품</span>
				</p>
			</div>
			
			<!-- <div class="wpb_text_column wpb_content_element ">
				<div class="wpb_wrapper">
					<p style="text-align: center;">
						<a href="" target="_self" class="Shortcut">바로가기</a>
					</p>

				</div>
			</div> -->

		</div>

		<div class="wpb_wrapper"
			style="text-align: center; display: inline-block; margin-right: 200px;">
			<div class="iconbox  iconbox-style-8 icon-color-accent color-dark clearfix" 
				onclick="location.href="#" style="cursor: pointer;">
				<h3 class="bottom-title">혼족 여행</h3>
				<img src="images/비행기.png" class="iconimg" width="90px;" height="90px;">
				<p></p>
				<p style="text-align: center;" class="bottom-text">
					<span style="color: #333333; margin-top: 15px">혼자여도 괜찮아!</span>
				</p>
				<p style="text-align: center;" class="bottom-text">
					<span style="color: #333333;">나홀로 여행, 혼행 꿀팁  </span>
				</p>
			</div>
			<!-- <div class="wpb_text_column wpb_content_element ">
				<div class="wpb_wrapper">
					<p style="text-align: center;">
						<a href="" target="_self" class="button color-1 medium "
							style="border-radius: 2px;">바로가기</a>
					</p>

				</div>
			</div> -->
		</div>
	</div>

	<div
		style="height: 300px; background-color: #1e73be; padding-top: 60px; padding-bottom: 60px; padding-left: 200px; text-align: center;">
		<div id="cwrapper" style="display: inline-block; margin-right: 300px;">
			<div id="shiva">
				<div id="c0" class="count" data-count="0"
					style="color: #ffffff !important">0</div>
			</div>
			<span class="counter-title" style="color: #ffffff">가구</span> <br>
			<div id="cwrapper" style="color: #ffffff;" data-aos="zoom-in"
				data-aos-once="true">
				<h4 style="text-align: center;">
					<span><b>전체 가구수</b></span>
				</h4>
			</div>
		</div>
		<div id="cwrapper" style="display: inline-block; margin-right: 300px;">
			<div id="shiva">
				<div id="c1" class="count" data-count="0"
					style="color: #ffffff !important">0</div>
			</div>
			<span class="counter-title" style="color: #ffffff">명</span> <br>
			<div id="cwrapper" style="color: #ffffff;" data-aos="zoom-in"
				data-aos-once="true">
				<h4 style="text-align: center;">
					<span><b>1인 가구수</b></span>
				</h4>
			</div>
		</div>
		<div id="cwrapper" style="display: inline-block; margin-right: 300px;">
			<div id="shiva">
				<div id="c2" class="count" data-count="27.8"
					style="color: #ffffff !important">0</div>
			</div>
			<span class="counter-title" style="color: #ffffff">%</span> <br>
			<div id="cwrapper" style="color: #ffffff;" data-aos="zoom-in"
				data-aos-once="true">
				<h4 style="text-align: center;">
					<span><b>1인 가구 비율</b></span>
				</h4>
			</div>
		</div>
	</div>
	<div class="hontalk">
	<p>혼자이기에 행복한,</p>
	<p>혼자이기에 외로운,</p>
	<p>혼족들을 위한 커뮤니티</p>
	<a href="#"><img alt="Hontalk" src="images/혼톡.png"></a>
	</div>
	
	
		<footer id="myFooter">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<h2 class="logo">
					<a href="#"> <img src="imges/로고.png" width=250 height=120> </a>
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

	<div id="name"></div>
	
	
	<script>
	
AOS.init({
	  duration: 1200,
	});
</script>

	<script type="text/javascript">
	
    $('.carousel').carousel({
        interval: 5000
      })
	
	
	$(document).ready(function() {
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	
		$.ajax({
			url:"data.com",
			type:"get",
			success:function(resp) {
				for(var i = 0; resp.length > i; i++) {
					var total = resp[i].DT;
					$("#c"+i).attr("data-count", total);
				}	
				
				var data1 = parseFloat($("#c0").attr("data-count"));
				var data2 = parseFloat($("#c1").attr("data-count"));
				$("#c0").attr("data-count", data1 * 1000);
				$("#c1").attr("data-count", data2 * 1000);
			},
			error : function() {
				console.log("에러 발생!");
			}
			
		});
		
		$('#section2').parallax({
			imageSrc: 'images/배경5.jpg'
		});
		
		$('#section3').parallax({
			imageSrc: 'images/배경6.jpg'
		});
		$('#section4').parallax({
			imageSrc: 'images/배경8.jpg'
		});
		
		$('ul.nav li.dropdown').hover(function() {
	           $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
	         }, function() {
	           $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
	         });
		
		var a = 0;
		$(window).scroll(function() {
		  var oTop = $('#shiva').offset().top - window.innerHeight;
		  if (a == 0 && $(window).scrollTop() > oTop) {
		    $('.count').each(function() {
		      var $this = $(this),
		        countTo = $this.attr('data-count');
		      $({
		        countNum: $this.text()
		      }).animate({
		          countNum: countTo
		        },
		        {
		          duration: 1500,
		          easing: 'swing',
		          step: function() {
		            $this.text(Math.floor(this.countNum));
		          },
		          complete: function() {
		            $this.text(numberWithCommas(this.countNum));
		            //alert('finished');
		          }
		        });
		    });
		    a = 1;
		  }
		  var $nav = $("#navbar");
		  $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
		});
		
		$('#hontalkView').click(function () {
	          window.location = $(this).attr('href');
	      });
		
		$('#cook').click(function () {
	          window.location = $(this).attr('href');
	      });
		
	});
	
	
	
	 var googleUser = {};
	  var startApp = function() {
		  
		    gapi.load('auth2', function(){
		    	
		      // Retrieve the singleton for the GoogleAuth library and set up the client.
		      auth2 = gapi.auth2.init({
		        client_id: '593657004380-quv6o52kji1ov5cabpji96q95nn2afkn.apps.googleusercontent.com',
		        cookiepolicy: 'single_host_origin',
		        // Request scopes in addition to 'profile' and 'email'
		        //scope: 'additional_scope'z
		      });
		      attachSignin(document.getElementById('customBtn'));
		    });
		    
		  };

		  function attachSignin(element) {
			    
			    auth2.attachClickHandler(element, {},
			        function(googleUser) {
			        console.log("들어옴")   
			        var name = googleUser.getBasicProfile().getName();  
			        var id = googleUser.getBasicProfile().getId();   
			        var email = googleUser.getBasicProfile().getEmail(); 
			        		   		        
			        location.href = "google.do?id="+id+"&email="+email+"&name="+name;
			        
			        }, function(error) {
			          	
			        	alert(JSON.stringify(error, undefined, 2 ));
			        });
			  }
		  
		  
		var kakaologin = function() {
			
			  Kakao.init('7b5cebd6ff38bcc35f50a75797895963');    
			  
			  Kakao.Auth.login({ 
			     success: function() { 
			            // 로그인 성공시, API를 호출합니다. 
			            Kakao.API.request({ 
			                   url: '/v1/user/me', 
			                   success: function(res) { 
			                            
			                         var id = JSON.stringify(res.id)
			                         var email = JSON.stringify(res.kaccount_email) 
			                         var name = JSON.stringify(res.properties.nickname) 
			                              
			                           
			                          console.log(id+email+name); 
			                       	  location.href="kakaotest.do?id="+id+"&email="+email+"&name="+name; 
			                   }, 
			                   fail: function(error) { 
			                          console.log(JSON.stringify(error)); 
			                   } 
			            }); 
			     }, 
			     fail: function(err) { 
			            console.log(JSON.stringify(err)); 
			     } 
			}); 
			
		}
</script>
</body>
</html>