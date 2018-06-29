<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Meta Tags for Bootstrap 4 -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap 4 CSS -->
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

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

</style>

</head>
<body>
	<div class="container"> <!-- 양 사이드 간격을 줌 -->
		
		<div><img src="hollo.jpg" alt="홀로 쇼핑 이미지" src=""><br><br><br></div>
		
		<div class="card-deck">
			
						
						
						<div class="col-lg-4" id="card1">
							<div class="card" style="border: none">
								<a href="selectView.tip?seq=${tmp.seq}">
								<img class="card-img-top" src="불판.jpg" alt="Card image cap" style="border: 1px solid #e3e3e3;">
								</a>
								<div class="card-body" style="width: 318px; height: 180px;">
									<p class="item-name"> 미니화로 불판 세트 </p>
									<p class="item-price"> 46,500원</p>
									<p class="item-shortdesc">고체연료로 실내에서 연기 걱정없이 <br>마음편하게 사용하는 불판세트</p>					
								</div>
							</div>
							<br>
							<br>
						</div>
						
							<div class="col-lg-4" id="card1">
							<div class="card" style="border: none">
								<a href="selectView.tip?seq=${tmp.seq}">
								<img class="card-img-top" src="휴지통.jpg" alt="Card image cap" style="border: 1px solid #e3e3e3;">
								</a>
								<div class="card-body" style="width: 318px; height: 180px;">
									<p class="item-name"> 혼족 소형 압축 휴지통 </p>
									<p class="item-price"> 16,800원</p>
									<p class="item-shortdesc">편리하고 쉬운 압축, 내마모성 재질의 튼튼한 내구성</p>													
									
								</div>
							</div>
							<br>
							<br>
						</div>
						
							<div class="col-lg-4" id="card1">
							<div class="card" style="border: none">
								<a href="selectView.tip?seq=${tmp.seq}">
								<img class="card-img-top" src="싱크대.jpg" alt="Card image cap" style="border: 1px solid #e3e3e3;">
								</a>
								<div class="card-body" style="width: 318px; height: 180px;">
									<p class="item-name"> 혼족 원룸 주방 싱크대 </p>
									<p class="item-price"> 13,500원</p>
									<p class="item-shortdesc">간단한 조립형, 효율적인 수납공간</p>												
								</div>
							</div>
							<br>
							<br>
						</div>
					
					
							<div class="col-lg-4" id="card1">
							<div class="card" style="border: none">
								<a href="selectView.tip?seq=${tmp.seq}">
								<img class="card-img-top" src="파스타.jpg" alt="Card image cap" style="border: 1px solid #e3e3e3;">
								</a>
								<div class="card-body" style="width: 318px; height: 180px;">
									<p class="item-name"> 청정원 파스타소스 혼족세트 10봉+면증정 </p>
									<p class="item-price"> 16,600원</p>
									<p class="item-shortdesc">풍부한 맛과 식감, 이탈리아 정통 방식 그대로</p>													
								</div>
							</div>
							<br>
							<br>
						</div>
					
							<div class="col-lg-4" id="card1">
							<div class="card" style="border: none">
								<a href="selectView.tip?seq=${tmp.seq}">
								<img class="card-img-top" src="혼과.jpg" alt="Card image cap" style="border: 1px solid #e3e3e3;">
								</a>
								<div class="card-body" style="width: 318px; height: 180px;">
									<p class="item-name"> 국내산 과일 혼족을 위한 다양한 과일 </p>
									<p class="item-price"> 22,400원</p>
									<p class="item-shortdesc">저렴한 가격으로 다양하게 즐길수 있는 영양 맞춤설계 과일박스</p>				
									
								</div>
							</div>
							<br>
							<br>
						</div>
						
						<div class="col-lg-4" id="card1">
							<div class="card" style="border: none">
								<a href="selectView.tip?seq=${tmp.seq}">
								<img class="card-img-top" src="미니밥솥.jpg" alt="Card image cap" style="border: 1px solid #e3e3e3;">
								</a>
								<div class="card-body" style="width: 318px; height: 180px;">
									<p class="item-name"> 빈크루즈 1인용 미니 전기 보온밥솥 </p>
									<p class="item-price"> 26,900원</p>
									<p class="item-shortdesc">싱글족, 자취생을 위한 필수아이템, 휴대성</p>			
									
								</div>
							</div>
							<br>
							<br>
						</div>
						
						<div class="col-lg-4" id="card1">
							<div class="card" style="border: none">
								<a href="selectView.tip?seq=${tmp.seq}">
								<img class="card-img-top" src="살림법.jpg" alt="Card image cap" style="border: 1px solid #e3e3e3;">
								</a>
								<div class="card-body" style="width: 318px; height: 180px;">
									<p class="item-name"> 초보 혼족을 위한 1인가구 살림법 </p>
									<p class="item-price"> 14,000원</p>
									<p class="item-shortdesc">지금은 1인가구 전성시대, 혼자 사는법을 배워야할때 </p>		
									
								</div>
							</div>
							<br>
							<br>
						</div>
						
						<div class="col-lg-4" id="card1">
							<div class="card" style="border: none">
								<a href="selectView.tip?seq=${tmp.seq}">
								<img class="card-img-top" src="냉장고.jpg" alt="Card image cap" style="border: 1px solid #e3e3e3;">
								</a>
								<div class="card-body" style="width: 318px; height: 180px;">
									<p class="item-name"> 혼족 원룸 소형냉장고 </p>
									<p class="item-price"> 140,400원</p>
									<p class="item-shortdesc">대우전자, 작지만 강한 냉장고 </p>	
									
								</div>
							</div>
							<br>
							<br>
						</div>
						
						<div class="col-lg-4" id="card1">
							<div class="card" style="border: none">
								<a href="selectView.tip?seq=${tmp.seq}">
								<img class="card-img-top" src="아침세트.jpg" alt="Card image cap" style="border: 1px solid #e3e3e3;">
								</a>
								<div class="card-body" style="width: 318px; height: 180px;">
									<p class="item-name"> 혼족 7일간의 아침식사 </p>
									<p class="item-price"> 22,000원</p>
									<p class="item-shortdesc">지리산의 건강을 담은 아침세트 </p>	
								</div>
							</div>
							<br>
							<br>
						</div>
						
						
						<div class="col-lg-4" id="card1">
							<div class="card" style="border: none">
								<a href="selectView.tip?seq=${tmp.seq}">
								<img class="card-img-top" src="책장.jpg" alt="Card image cap" style="border: 1px solid #e3e3e3;">
								</a>
								<div class="card-body" style="width: 318px; height: 180px;">
									<p class="item-name"> 혼족에 딱! 페이퍼팝 종이책장 3형2단 </p>
									<p class="item-price"> 14,000원</p>
									<p class="item-shortdesc">친환경 소재로 만들어진 실용적인 아이템 </p>	
								</div>
							</div>
							<br>
							<br>
						</div>
					
						<div class="col-lg-4" id="card1">
							<div class="card" style="border: none">
								<a href="selectView.tip?seq=${tmp.seq}">
								<img class="card-img-top" src="도시락.jpg" alt="Card image cap" style="border: 1px solid #e3e3e3;">
								</a>
								<div class="card-body" style="width: 318px; height: 180px;">
									<p class="item-name"> 엄니스도시락 시즌2 6종세트 혼밥 혼족 비상식 </p>
									<p class="item-price"> 25,900원</p>
									<p class="item-shortdesc">일상의 집밥, 엄니스 도시락으로 든든하게</p>	
								</div>
							</div>
							<br>
							<br>
						</div>
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					</div>
				</div>
				

</body>
</html>