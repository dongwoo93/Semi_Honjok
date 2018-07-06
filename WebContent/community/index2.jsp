<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/top.jsp" %>
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/parallax.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/index.js"></script>
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
	
		<h1 style="margin-top: 30px; margin-left: 265px; margin-bottom: 20px">Latest
			Contents</h1>
			<div class="col-md-11" id="card-wrapper">
			<div class="card-deck">
			<c:choose>
			<c:when test="${result.size() > 0}">
			<c:forEach var="latest" items="${result}" begin="0" end="3" step="1" varStatus="status">
			<div class="col-md-3" id="card1">
				<div class="card">
				<a href="selectView.tip?seq=${latest.seq}&viewcount=${latest.viewcount}">
				<img class="card-img-top" src="files/${thumbnail[status.index].thum_sysFileName}" alt="Card image cap">
				</a>
					
					<div class="card-body">
						<h5 class="card-title">
						<a href="selectView.tip?seq=${latest.seq}&viewcount=${latest.viewcount}">${latest.title}</a>
						</h5>
						<p class="card-text">
							<small class="text-muted">${latest.writedate}</small>
						</p>
					</div>
				</div>
			</div>
			</c:forEach>
			</c:when>
			</c:choose>
		</div>
		
		<div class="card-deck">
			<c:choose>
			<c:when test="${result.size() > 0}">
			<c:forEach var="latest" items="${result}" begin="4" end="7" step="1" varStatus="status">
			<div class="col-md-3" id="card1">
				<div class="card">
				<a href="selectView.tip?seq=${latest.seq}&viewcount=${latest.viewcount}">
				<img class="card-img-top" src="files/${thumbnail[status.index].thum_sysFileName}" alt="Card image cap">
				</a>
					
					<div class="card-body">
						<h5 class="card-title">
						<a href="selectView.tip?seq=${latest.seq}&viewcount=${latest.viewcount}">${latest.title}</a>
						</h5>
						<p class="card-text">
							<small class="text-muted">${latest.writedate}</small>
						</p>
					</div>
				</div>
			</div>
			</c:forEach>
			</c:when>
			</c:choose>
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
	<%@ include file="../include/bottom.jsp"%>