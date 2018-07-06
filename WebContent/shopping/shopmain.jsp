<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<style>
.item-name {
	overflow: hidden;
	margin-bottom: 10px;
	font-size: 23px;
	font-weight: bold;
	line-height: 1.3;
}

.item-price {
	font-size: 18px;
	font-weight: bold;
	color: #795c90;
}

.item-shortdesc {
	font-size: 15px;
	color: #4c4c4c;
	margin-top: 9px;
	line-height: 1.5;
}

#card-deck {
	margin-top: 60px;
}

#writer {
	float: right;
}

.navbar-light .navbar-nav .nav-link {
	color: black;
}

#navbar {
	background-color: #eef2f5 !important;
	transition: background-color 200ms linear;
}

.ScrollButton {
	position: fixed; /* 버튼의 위치 고정 */
	right: 10px; /* x 위치 입력 */
	cursor: pointer; /* 호버링 했을 때 커서 모양 변경 */
	z-index: 10; /* 다른 태그에 가려지지 않게 우선순위 변경 */
	display: none; /* 스크롤 위치에 상관없이 보이게 하려면 생략 */
}
/* 두 태그에 각각 y 위치 입력 */
#TopButton {
	bottom: 108px;
}
</style>

</head>
<body>
	<div class="container">
		<!-- 양 사이드 간격을 줌 -->

		<div>
			<img src="images/hollo.jpg" alt="홀로 쇼핑 이미지" src=""><br>
			<br>
			<br>
		</div>
		<a id="TopButton" class="ScrollButton" style="opacity: 0.7;"><img
			src="images/uparrow.PNG"></a>

		<div id="writer">
			<c:choose>
				<c:when test="${sessionScope.loginId == 'admin'}">
					<span class="col-md-1">
						<button type="button" class="btn btn-outline-success" id="writebt">글쓰기</button>
					</span>
				</c:when>
			</c:choose>
		</div>

		<div id="card-deck" class="card-deck">
			<c:forEach var="result" items="${result}" varStatus="status">
				<div class="col-lg-4" id="card1">
					<div class="card" style="border: none">
						<a href="#"> <img class="card-img-top" src="files/${list[status.index].shop_system_file_name}"
							alt="Card image cap" style="border: 1px solid #e3e3e3;">
						</a>
						<div class="card-body" style="width: 318px; height: 180px;">
							<p class="item-name">${result.product_name}</p>
							<p class="item-price">${result.product_price}원</p>
							<p class="item-shortdesc">${result.product_contents}</p>
						</div>
					</div>
					<br> <br>
				</div>
			</c:forEach>
		</div>
	</div>

	<script>
	$("#writebt").click(function(){
		$(location).attr('href','shopwrite.shop');
	})
	
	$(function(){
		$(window).scroll(function() {
	        if ($(this).scrollTop() > 400) {
	            $('.ScrollButton').fadeIn();
	        } else {
	            $('.ScrollButton').fadeOut();
	        }
	    });
		
		$("#TopButton").click(function() {
	        $('html').animate({scrollTop : 0}, 600);
	    });
	})
</script>
	<%@ include file="../include/bottom.jsp"%>