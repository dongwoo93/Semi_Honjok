<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/top.jsp" %>
<script>
	$(document).ready(function(){
		$("#deliverybt").click(function(){
			if ('${id}' == 'nonmember') {
				$("#loginbt").trigger('click');
			}else {
				$(location).attr("href","purchase.shop?seq=${result[0].product_id}");
			}
			
		})
	})
</script>
	<div class="container" style="margin-top: 230px;">
		<div id="content" class="item-content">
			<div class="item-topinfowrap">
				<div class="item-topgallerywrap">
					<div class="thumb-gallery">
						<img src="files/${list[0].shop_system_file_name}">
					</div>



				</div>

				<div class="item-topinfo">
					<h1 class="itemtit">${result[0].product_name}</h1>
					<div class="prod_info">

						<p class="buy_num">
							구매 ${result[0].product_count}<span class="remainder"></span><br>
							남은수량 ${result[0].product_quantity}개
						</p>
							

					</div>

					<div class="price_wrap">
						<div class="price">
							<span class="price_innerwrap"> <strong class="price_real">${result[0].product_price}<span
									class="unit">원</span></strong>
							</span>
						</div>

					</div>

					<div class="delivery-noti">
						<div class="deltype a3">
							<div>
								<img src="images/order_tracking.png" width="55px" height="55px">
							</div>

							<span class="txt_emp">내일 출발예정</span><span
								id="ucShippingTransPolicyInfo_hdivShippingDeliveryInfo">
								- <span class="delcomp">CJ택배</span>
							</span>
						</div>
					</div>

					<ul class="item-topinfo_sub uxeslide">
						<li class="delivery_item  uxeslide_item">
						<c:choose>
						
								<c:when test="${result[0].product_delivery == 'N'}">
								
									<button id="ucShippingInfo_btnShippingInfoTitleText"
										class="nav" type="button">
										택배 - <em class="txt_emp">무료배송</em>
									</button>
								</c:when>
								<c:otherwise>
									<button id="ucShippingInfo_btnShippingInfoTitleText"
										class="nav" type="button">
										택배 - <em class="txt_emp">유료배송(+2500원)</em>
									</button>
								</c:otherwise>
							</c:choose></li>
						<li class="delivery_item  uxeslide_item">
							<button id="ucShippingInfo_btnShippingInfoTitleText" class="nav"
								type="button">
								포인트 <em class="txt_emp">최대 1.5% 적립</em>
							</button>
						</li>
						<li class="delivery_item  uxeslide_item">
							<button id="ucShippingInfo_btnShippingInfoTitleText" class="nav"
								type="button">
								원산지 - <em class="txt_emp">중국</em>
							</button>
						</li>
					</ul>
					
					<c:choose>
					<c:when test="${result[0].product_quantity == 0}">
					<div class="buynot">
					<p id="ucItemOrderInfo_ucItemOrderButtons_notBuyTxt" class="buynot_txt">
					현재 구매가 불가능한 상품입니다.
					</p>
					</div>
					</c:when>
					<c:otherwise>
					<div class="item-bottombtns">
						<button class="btn_cart" type="button">장바구니</button>
						<button id="deliverybt" class="btn_buy" type="button">구매하기</button>
					</div>
					</c:otherwise>
					</c:choose>
					
					
					
				</div>
			</div>

			<div class="vip-tabwrap uxetabs">
				<div class="vip-tabnavi uxeposfix">
					<ul>
						<li class="uxetabs_menu"><a> 상세설명 </a></li>
					</ul>
				</div>
				<div>${result[0].product_contents}</div>
			</div>

		</div>
	</div>
	<link rel="stylesheet" type="text/css" href="shoppingcss/itemview.css">
	<%@ include file="../include/bottom.jsp"%>