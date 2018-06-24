<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="parallax.css" rel="stylesheet" type="text/css" >
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/parallax.js/1.3.1/parallax.min.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>
<nav class="navbar navbar-light fixed-top navbar-expand-md" id="navbar">
<a class="navbar-brand" href="#" style="color: white">&#xB098;&#xD640;&#xB85C;&#xC871;,,</a>
    <ul class="nav navbar-nav">
        <li class="nav-item"></li>
        <li class="dropdown nav-item"><a class="dropdown-toggle nav-link" data-toggle="dropdown" href="#">&#xD63C;&#xD1A1; <span></span></a>
            <ul
            class="dropdown-menu">
                <li class="dropdown-item"><a href="#">&#xC790;&#xC720;&#xAC8C;&#xC2DC;&#xD310;</a>
                </li>
                <li class="dropdown-item"><a href="#">&#xACE0;&#xBBFC;&#xC0C1;&#xB2F4;</a>
                </li>
                <li class="dropdown-item"><a href="#">&#xC9C8;&#xBB38;/&#xB2F5;&#xBCC0;</a>
                </li>
                <li class="dropdown-item"><a href="#">&#xD63C;&#xD301;</a>
                </li>
                <li class="dropdown-item"><a href="#">&#xBCA0;&#xC2A4;&#xD2B8;</a>
                </li>
                </ul>
        </li>
        <li class="nav-item"><a href="/board/boardtip.jsp" class="catego nav-link">&#xAFC0;&#xD301;</a>
        </li>
        <li class="nav-item"><a href="BoardSelectController" class="catego nav-link">&#xC694;&#xB9AC;</a>
        </li>
        <li class="nav-item"><a href="#" class="catego nav-link">&#xC778;&#xD14C;&#xB9AC;&#xC5B4;</a>
        </li>
        <li class="nav-item"><a href="#" class="catego nav-link">&#xD63C;&#xC871;&#xC5EC;&#xD589;</a>
        </li>
        <li class="nav-item"><a href="#" class="catego nav-link">&#xD63C;&#xC871;&#xB9DB;&#xC9D1;</a>
        </li>
        <li class="nav-item"><a href="#" class="catego nav-link">&#xD63C;&#xC871;&#xC1FC;&#xD551;</a>
        </li>
        </ul>
        <ul class="nav navbar-nav ml-auto">
            <li class="nav-item"><a href="#" class="nav-link"><span class="glyphicon glyphicon-user"></span>

					Sign Up</a>
            </li>
            <li class="nav-item"><a href="#" class="nav-link"><span class="glyphicon glyphicon-log-in"></span>

					Login</a>
            </li>
        </ul>
</nav>
	<div id="demo" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="la.jpg" alt="Los Angeles" width="1200" height="700">
				<div class="carousel-caption">
					<h3>Los Angeles</h3>
					<p>We had such a great time in LA!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="chicago.jpg" alt="Chicago" width="1200" height="700">
				<div class="carousel-caption">
					<h3>Chicago</h3>
					<p>Thank you, Chicago!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="ny.jpg" alt="New York" width="1200" height="700">
				<div class="carousel-caption">
					<h3>New York</h3>
					<p>We love the Big Apple!</p>
				</div>
			</div>
		</div>
	</div>
	<div><h1 style="margin-top: 30px; margin-left: 330px; margin-bottom: 20px">Latest Contents</h1>
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
			<a href="">
				<img class="card-img-top" src="fjords.jpg" alt="Card image cap">
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
<div class="text1" data-aos="zoom-out-right">
<h1 class="headline font-inherit fontsize-xxxl fontweight-700 lh-inherit align-center transform-inherit " style="margin: 0 0 20px 0;">혼족이란?</h1>
<p style="text-align: center;"><span style="color: #808080;">혼자 밥을 먹거나 여가생활과 쇼핑을 즐기며, </span></p>
<p style="text-align: center;"><span style="color: #808080;">여행도 홀로 떠나는 등 혼자 활동하는게 취미이거나 </span></p>
<p style="text-align: center;"><span style="color: #808080;">그런 성향이 강한 사람들을 일컫는 줄임말.</span></p>
</div>
<section id="section2" class="black-circle ct-u-paddingBoth120" style="min-height: 396px; width: 50%; float: left;">
</section>
</div>
<div class="wrapper2">
<section id="section3" class="black-circle ct-u-paddingBoth120" style="min-height: 396px; width: 50%; float: left;">
</section>
<div class="text1" data-aos="zoom-out-left">
<h1 class="headline font-inherit fontsize-xxxl fontweight-700 lh-inherit align-center transform-inherit " style="margin: 0 0 20px 0;">혼족이란?</h1>
<p style="text-align: center;"><span style="color: #808080;">혼자 밥을 먹거나 여가생활과 쇼핑을 즐기며, </span></p>
<p style="text-align: center;"><span style="color: #808080;">여행도 홀로 떠나는 등 혼자 활동하는게 취미이거나 </span></p>
<p style="text-align: center;"><span style="color: #808080;">그런 성향이 강한 사람들을 일컫는 줄임말.</span></p>
</div>
</div>
<div class="wrapper2">
<div class="text1" data-aos="zoom-out-right">
<h1 class="headline font-inherit fontsize-xxxl fontweight-700 lh-inherit align-center transform-inherit " style="margin: 0 0 20px 0;">혼족이란?</h1>
<p style="text-align: center;"><span style="color: #808080;">혼자 밥을 먹거나 여가생활과 쇼핑을 즐기며, </span></p>
<p style="text-align: center;"><span style="color: #808080;">여행도 홀로 떠나는 등 혼자 활동하는게 취미이거나 </span></p>
<p style="text-align: center;"><span style="color: #808080;">그런 성향이 강한 사람들을 일컫는 줄임말.</span></p>
</div>
<section id="section4" class="black-circle ct-u-paddingBoth120" style="min-height: 396px; width: 50%; float: left;">
</section>
</div>
</div>

<div style="height: 500px">

</div>
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
		
		
	});
</script>
</body>
</html>