<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%@ include file="../include/top.jsp" %>
    <script type="text/javascript" src="js/order.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <div id="container" style="margin-top: 100px;">
		<div class="myauctionptitle">
			<h2>
				<img src="title_order_step.png">
			</h2>
			<!-- 접근성개선woon : 헤딩수정_130430 -->
		</div>

		<div class="order">
			<h2>1.주문상품 할인적용</h2>
		</div>

		<div class="order-tbl3 order2">
			<form id="myform" action="PayController" method="post">
				<table id="tb">
					<thead>
						<tr>
							<th scope="col" class="line"></th>
							<th scope="col" id="prject" class="line"><div class="prject">상품정보</div></th>
							<th scope="col" style="width: 100px;">금액</th>
							<th scope="col" style="width: 100px;">판매자</th>
							<th id="ordermoney" scope="col" style="width: 100px;">배송비</th>
						</tr>

					</thead>

					<tbody>
						<tr>
							<td id="line" class="line">
								<div class="img-box">
									<img src="files/${list[0].shop_system_file_name}" width="60"
										height="60" alt="">
								</div>
							</td>
							<td id="line2" class="line"><span class="subject_1">
									<a id="line2-a" href="#" target="_blank"
									title="클릭하시면 새창으로 열립니다."> ${result[0].product_name} </a>
							</span>
								<ul id="b_list2" class="b_list2">
									<li><span class="title" title="색상 / 095 / 110,760원 ">
											${result[0].product_price} </span> <span class="b_won"> <em
											class="number2">1개</em> <em> <span
												id="originalAmount4013519595">${result[0].product_price}</span>
										</em>
									</span></li>
								</ul></td>
							<td><strong> <span id="tempDiscount4013519595"></span>
									<span id="discountAmount4013519595">${result[0].product_price}원</span>
							</strong></td>
							<td>
								<p class="quaere-txt">hollo.com</p>
							</td>
							<td rowspan="1">
								<div class="cost_info">
									<c:choose>
										<c:when test="${result[0].product_delivery=='N'}">
											<span>무료</span>
										</c:when>
										<c:otherwise>
											<span>유료(+2500)원)</span>
										</c:otherwise>
									</c:choose>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
		</div>

		<div class="uxb-total-p02">
			<table class="total">
				<tbody>
					<tr id="tr1">
						<th scope="col" class="vb"><img
							src="https://pics.auction.co.kr/myauction/txt_rebasket01.gif"
							alt="상품금액"></th>
						<td>&nbsp;</td>

						<th scope="col" class="vb"><img
							src="https://pics.auction.co.kr/myauction/txt_rebasket02.gif"
							alt="배송비"></th>
						<td>&nbsp;</td>

						<th scope="col" class="vb last-payment"><img
							src="https://pics.auction.co.kr/myauction/txt_rebasket04.gif"
							alt="최종결제금액"></th>
					</tr>
					<tr class="money">
						<td class="vt">${result[0].product_price}<span class="won">원</span></td>
						<input type="hidden" value="${result[0].product_name}" name="product_name">

						<td class="vt"><img
							src="https://pics.auction.co.kr/myauction/ico_plus.gif" alt="더하기"></td>
						
						<c:choose>
						<c:when test="${result[0].product_delivery=='N'}">
						<td class="vt">
									<span id="sumTransAmount">0</span>
									<input type="hidden" value="${result[0].product_price}"
										name="product_price">
									<span class="won">원</span>
									</td>
							<td class="vt"><img
								src="https://pics.auction.co.kr/myauction/ico_total.gif"
								alt="최종결제금액"></td>
							<td class="final vt">
							<div style="width: 100%; position: relative;">
								<span id="calculatedTotalAmount">${result[0].product_price}</span><span
									class="won">원</span> <input type="hidden"
									value="${result[0].product_price}" name="product_price">
							</div>
							</td>
						</c:when>
						<c:otherwise>
						<td>
							<span id="sumTransAmount">2500</span>
							<span class="won">원</span>
						</td>
						<td class="vt"><img
							src="https://pics.auction.co.kr/myauction/ico_total.gif"
							alt="최종결제금액"></td>
						<td class="final vt">
							<div style="width: 100%; position: relative;">
								<span id="calculatedTotalAmount">${price}</span><span
									class="won">원</span> <input type="hidden" value="${price}"
									name="product_price">
							</div>
						</td>
						</c:otherwise>
						</c:choose>


					</tr>
				</tbody>
			</table>
		</div>


		<div class="uxb-go-basket">
			<div id="divGoCart" class="btn">
				<a href="#"><img
					src="https://pics.auction.co.kr/myauction/button/btn_basket02.gif"
					alt="장바구니로"></a>
			</div>

			<div class="notice point_know">
				<strong>알아두세요!</strong>
				<p id="know">
					홀로는 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br>따라서 옥션은 상품ㆍ거래정보 및 거래에 대하여
					책임을 지지 않습니다.
				</p>
			</div>
		</div>


		<div id="divShippingInfo" class="uxb-delivery-info uxb-info-write">
			<h3 id="h3DeliveryInfoTitle1">
				2. 배송지 정보 입력<span class="delivery-important-header">(＊필수입력)</span>
			</h3>

			<div class="uxb-members-info" id="divEcouponUI1">
				<!-- 배송지 정보 입력 영역 start -->


				<table class="write-tbl" style="">
					<tbody>
						<tr>
							<th id="thSelectDelivery" rowspan="1" style="width: 100px;"><span
								class="delivery-important">＊</span>배송지 선택</th>
							<td class="address-select smilebox_ver">
								<ul style="list-style: none;">
									<li class="new"><input type="radio" name="add-rdo"
										checked="checked" id="deliveryAddressInputTypeB"><label
										for="deliveryAddressInputTypeB"><strong>기본배송지</strong></label>
									</li>
								</ul>
							</td>
						</tr>

						<tr>
							<th id="names" rowspan="1" style="width: 100px;"><span
								class="delivery-important">＊</span>이름</th>
							<td class="address-select smilebox_ver"><input type="text"
								id="name" name="name"></td>
						</tr>

						<tr>
							<th id="add" rowspan="1" style="width: 100px;"><span
								class="delivery-important">＊</span>주소</th>
							<td><input type="text" id="sample6_postcode"
								placeholder="우편번호" name="zipcode" readonly> <input
								type="button" onclick="sample6_execDaumPostcode()"
								value="우편번호 찾기"><br> <input type="text"
								id="sample6_address" name="address1" placeholder="주소"> <input
								type="text" id="sample6_address2" name="address2"
								placeholder="상세주소"></td>
						</tr>

						<tr>
							<th id="phone" rowspan="1" style="width: 100px;"><span
								class="delivery-important">＊</span>전화번호</th>
							<td><select name="phone1" id="se">
									<option value="02">02</option>
									<option value="032">032</option>
									<option value="010">010</option>
							</select>- <input id="phone1" type="text" name="phone2"
								style="width: 50px;" maxlength="4">- <input id="phone2"
								type="text" name="phone3" style="width: 50px;" maxlength="4">
							</td>
						</tr>
						<tr>
							<th id="mail"><span
								class="delivery-important">＊</span>이메일</th>
							<td><input id="emailid" name="email" type="email" style="width: 500px; margin-left: 20px;"></td>
						</tr>
						<tr>
							<th id="develiy">배송메시지</th>
							<td><input id="de" type="text" style="width: 500px;"></td>
						</tr>
					</tbody>
				</table>

				<!-- 배송지 정보 입력 영역 end -->

			</div>
		</div>

		<div class="uxa-boxright" style="margin-top: 30px;">
			<h2 id="h3PaymentTitle">3. 결제하기</h2>
			<div class="uxa-inbox2">
				<div class="totalprice">
				<c:choose>
					<c:when test="${result[0].product_delivery=='N'}">
					<input type="hidden" id="txtPayAmnt" name="txtPayAmnt"
						value="70,880"> <span id="spnPayDisplay"
						class="totalprice_num">${result[0].product_price}</span><img
						src="//pics.auction.co.kr/pc/payment/txt_unit.gif" alt="원">
					<input type="hidden" value="${result[0].product_price}"
						name="price">
					</c:when>
					<c:otherwise>
						<input type="hidden" id="txtPayAmnt" name="txtPayAmnt"
						value="70,880"> <span id="spnPayDisplay"
						class="totalprice_num">${price}</span><img
						src="//pics.auction.co.kr/pc/payment/txt_unit.gif" alt="원">
					<input type="hidden" value="${price}"
						name="price">
					</c:otherwise>
				</c:choose>
				</div>
				<div class="bills-btn" id="divPaymentButton" style="display: block;">
					<a id="paymentButton" onclick="shop_submit()"> <img
						src="//pics.auction.co.kr/pc/payment/btn_payment.png" alt="결제하기">
					</a>
					<div class="layer_smilepay_guide" id="divPaymentNudgeLayer"
						style="display: none;">
						<span class="txt_guide"><span class="ico_smilepay"></span><strong>결제하기</strong>
							버튼을 눌러<br>주문을 완료해주세요</span>
					</div>
				</div>
				<input type="hidden" name="pid" value="${pid}">
				</form>
				<div style="height: 30px;"></div>
				<div class="kcc_bx">
					<p class="tit" style="display: none;">원활한 주문 및 배송처리를 위하여
						동의해주세요.</p>
					<div class="kcc_agree" style="display: none;">
						<input type="checkbox" id="chkPersonalInfoCollect" class="chc"
							value="Y" checked="checked" style="display: none">
						<p class="intxt">
							<label for="chkPersonalInfoCollect">개인정보 수집 이용동의(필수)</label>
						</p>
					</div>
					<div id="tbl_wrap" class="tbl_wrap" style="display: none;">
						<table class="tbl">
							<colgroup>
								<col width="45px">
								<col width="*">
							</colgroup>
							<caption>개인정보 수집 이용동의</caption>
							<tbody>
								<tr>
									<th>목적</th>
									<td>주문, 결제 및 배송서비스</td>
								</tr>
								<tr>
									<th>항목</th>
									<td>구매자정보, 상품 구매/취소/반품/교환/환불 정보,
										수령인정보,결제정보,송장정보,은행계좌정보,휴대폰번호(휴대폰결제 시), 현금영수증정보</td>
								</tr>
								<tr>
									<th>보유기간</th>
									<td>회원탈퇴 후 5일 이내 또는 법령에 따른 보존기간</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="kcc_agree">
						<input type="checkbox" id="chkPersonalInfoProvide" class="chc"
							value="N">
						<p class="intxt">

							<label for="chkPersonalInfoProvide">개인정보 제3자 제공동의(필수)</label>

						</p>
					</div>
					<div id="tbl_wrap2" class="tbl_wrap">
						<table class="tbl">
							<colgroup>
								<col width="45px">
								<col width="*">
							</colgroup>
							<caption>개인정보 수집 이용동의</caption>
							<tbody>
								<tr>
									<th>제공받는자</th>
									<td class="imp_txt"><strong>판매자</strong></td>
								</tr>
								<tr>
									<th>목적</th>
									<td class="imp_txt"><strong>상품 및 경품(서비스) 배송(전송),
											제품 설치, 반품, 환불, 고객상담 등 정보통신서비스제공계약 및 전자상거래(통신판매)계약의 이행을 위해 필요한
											업무의 처리</strong></td>
								</tr>
								<tr>
									<th>항목</th>
									<td>ID, 성명, 전화번호, 휴대전화번호, 배송지 주소, 이메일주소(선택시), 통관고유부호(선택시)</td>
								</tr>
								<tr>
									<th>보유기간</th>
									<td class="imp_txt"><strong>구매 서비스 종료 후 1개월</strong></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div style="height: 100px"></div>
	</div>
	<link rel="stylesheet" type="text/css" href="shoppingcss/shop.css">
	<%@ include file="../include/bottom.jsp"%>