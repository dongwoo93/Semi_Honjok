<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="parallax.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/parallax.js/1.3.1/parallax.min.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>
	<nav class="navbar navbar-light fixed-top navbar-expand-md" id="navbar">
	<a class="navbar-brand" href="#" style="color: white; font-size: 26px;">Aloner</a>
	<ul class="nav navbar-nav">
		<li class="nav-item"></li>
		<li class="dropdown"><a id="hontalkView" class="dropdown-toggle nav-link" data-toggle="dropdown" href="freeboardView.freeb">혼톡</a>
			<ul class="dropdown-menu">
				<li class="dropdown-item"><a href="#">자유게시판</a></li>
				<li class="dropdown-item"><a href="#">고민상담</a></li>
				<li class="dropdown-item"><a href="#">질문/답변</a></li>
				<li class="dropdown-item"><a href="#">혼팁</a></li>
				<li class="dropdown-item"><a href="#">베스트</a></li>
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
		<li class="nav-item"><a href="#" class="nav-link"><img
				src="imges/signup.png" width="45" height="30"> Sign Up</a></li>
		<li class="nav-item"><a href="#" class="nav-link"><img
				src="imges/login.png" width="45" height="30"> Login</a></li>
	</ul>
	</nav>
	<div id="demo" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="imges/sky.jpg" alt="Los Angeles" width="1200"
					height="700">
				<div class="carousel-caption">
					<h3>Los Angeles</h3>
					<p>We had such a great time in LA!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="imges/nature-3042751_1280.jpg" alt="Chicago"
					width="1200" height="700">
				<div class="carousel-caption">
					<h3>Chicago</h3>
					<p>Thank you, Chicago!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="imges/hiker-1149898_1280.jpg" alt="New York"
					width="1200" height="700">
				<div class="carousel-caption">
					<h3>New York</h3>
					<p>We love the Big Apple!</p>
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
					style="margin: 0 0 20px 0;">혼족이란?</h1>
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
				style="min-height: 396px; width: 50%; float: left;"> </section>
		</div>
		<div class="wrapper2">
			<section id="section3" class="black-circle ct-u-paddingBoth120"
				style="min-height: 396px; width: 50%; float: left;"> </section>
			<div class="text1" data-aos="zoom-out-left" data-aos-once="true">
				<h1
					class="headline font-inherit fontsize-xxxl fontweight-700 lh-inherit align-center transform-inherit "
					style="margin: 0 0 20px 0;">혼족이란?</h1>
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
		</div>
		<div class="wrapper2">
			<div class="text1" data-aos="zoom-out-right" data-aos-once="true">
				<h1
					class="headline font-inherit fontsize-xxxl fontweight-700 lh-inherit align-center transform-inherit "
					style="margin: 0 0 20px 0;">혼족이란?</h1>
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
			<section id="section4" class="black-circle ct-u-paddingBoth120"
				style="min-height: 396px; width: 50%; float: left;"> </section>
		</div>
	</div>

	<div id="conbox"
		style="text-align: center; padding-left: 180px; padding-top: 60px; padding-bottom: 60px;"
		data-aos="fade-zoom-in" data-aos-once="true">
		<div class="wpb_wrapper"
			style="text-align: center; display: inline-block; margin-right: 200px;">
			<div
				class="iconbox  iconbox-style-8 icon-color-accent color-dark clearfix">
				<h3>혼술혼밥</h3>
				<img src="images/1.png" class="iconimg">
				<p style="text-align: center;">
					<span style="color: #333333;">혼술 혼밥하기 좋은 곳을</span>
				</p>
				<p style="text-align: center;">
					<span style="color: #333333;">소개합니다.</span>
				</p>
			</div>
			<div class="wpb_text_column wpb_content_element ">
				<div class="wpb_wrapper">
					<p style="text-align: center;">
						<a href="" target="_self" class="button color-1 medium "
							style="border-radius: 2px;">바로가기</a>
					</p>

				</div>
			</div>

		</div>

		<div class="wpb_wrapper"
			style="text-align: center; display: inline-block; margin-right: 200px;">
			<div
				class="iconbox  iconbox-style-8 icon-color-accent color-dark clearfix">
				<h3>혼족 제품&amp;서비스</h3>
				<img src="images/2.png" class="iconimg">
				<p style="text-align: center;">
					<span style="color: #333333;">혼족이 쓰면 유용하고 핫한</span>
				</p>
				<p style="text-align: center;">
					<span style="color: #333333;">제품 또는 서비스를&nbsp;소개합니다.</span>
				</p>
			</div>
			<div class="wpb_text_column wpb_content_element ">
				<div class="wpb_wrapper">
					<p style="text-align: center;">
						<a href="" target="_self" class="button color-1 medium"
							style="border-radius: 2px;">바로가기</a>
					</p>

				</div>
			</div>

		</div>

		<div class="wpb_wrapper"
			style="text-align: center; display: inline-block; margin-right: 200px;">
			<div
				class="iconbox  iconbox-style-8 icon-color-accent color-dark clearfix">
				<h3>혼족 문화</h3>
				<img src="images/3.png" class="iconimg">
				<p style="text-align: center;">
					<span style="color: #333333;">혼족의 감성, 행동, 사상</span>
				</p>
				<p style="text-align: center;">
					<span style="color: #333333;">혼족문화를 &nbsp;소개합니다.</span>
				</p>
			</div>
			<div class="wpb_text_column wpb_content_element ">
				<div class="wpb_wrapper">
					<p style="text-align: center;">
						<a href="" target="_self" class="button color-1 medium "
							style="border-radius: 2px;">바로가기</a>
					</p>

				</div>
			</div>
		</div>
	</div>

	<div
		style="height: 300px; background-color: #1e73be; padding-top: 60px; padding-bottom: 60px; padding-left: 200px; text-align: center;">
		<div id="cwrapper" style="display: inline-block; margin-right: 300px;">
			<div id="shiva">
				<div class="count" data-count="800"
					style="color: #ffffff !important">0</div>
			</div>
			<span class="counter-title">만명</span> <br>
			<div id="cwrapper" style="color: #ffffff;" data-aos="zoom-in"
				data-aos-once="true">
				<h4 style="text-align: center;">
					<span><b>1인 가구</b></span>
				</h4>
			</div>
		</div>
		<div id="cwrapper" style="display: inline-block; margin-right: 300px;">
			<div id="shiva">
				<div class="count" data-count="100"
					style="color: #ffffff !important">0</div>
			</div>
			<span class="counter-title">만명</span> <br>
			<div id="cwrapper" style="color: #ffffff;" data-aos="zoom-in"
				data-aos-once="true">
				<h4 style="text-align: center;">
					<span><b>최근 5년 혼족 증가 가구수</b></span>
				</h4>
			</div>
		</div>
		<div id="cwrapper" style="display: inline-block; margin-right: 300px;">
			<div id="shiva">
				<div class="count" data-count="50" style="color: #ffffff !important">0</div>
			</div>
			<span class="counter-title">%</span> <br>
			<div id="cwrapper" style="color: #ffffff;" data-aos="zoom-in"
				data-aos-once="true">
				<h4 style="text-align: center;">
					<span><b>혼족 비율</b></span>
				</h4>
			</div>
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
	<script>
AOS.init({
	  duration: 1200,
	});
</script>

	<script type="text/javascript">
	$(document).ready(function() {

		$('#section2').parallax({
			imageSrc: 'images/background-3.jpg'
		});
		
		$('#section3').parallax({
			imageSrc: 'images/background-4.jpg'
		});
		$('#section4').parallax({
			imageSrc: 'images/background-5.jpg'
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
		            $this.text(this.countNum);
		            //alert('finished');
		          }
		        });
		    });
		    a = 1;
		  }
		});
		
		$('ul.nav li.dropdown').hover(function() {
			  $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
			}, function() {
			  $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
			});
		
		$('#hontalkView').click(function () {
		    window.location = $(this).attr('href');
		});
		
	});
</script>
</body>
</html>