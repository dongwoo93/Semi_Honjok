<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/top.jsp" %>

<div style="margin-top:100px;"></div>

<link rel="stylesheet" type="text/css" href="boardcss/boardView.css">
<div class="container"  style="padding-top:70px;">
	<%-- <c:forEach var="item" items="${result}"> --%>
	<div class="col-md-15">
		<h2 id="title">${result.title}</h2>
	</div>
	<div class="col-md-12" style="text-align: right">
		<span class="col-md-2">${result.writedate}</span>
		<%-- <span class="cos-sm-2" id="seq">${result[0].seq}</span> --%>
	</div>
	<c:choose>
		<c:when test="${sessionScope.loginId eq 'admin'}">
			<div class="col-md-12" style="text-align: right">
				<span id="col-md-3" class="col-md-3"><button type="button"
						class="btn btn-info" id="modify">수정</button></span> <span
					class="col-md-3"><button type="button"
						class="btn btn-danger" id="delete">삭제</button></span>
			</div>
		</c:when>
	</c:choose>
	
	<hr style="height: 1;">

	<div class="col-md-15" id="contents">${result.contents}</div>
	
	<c:if test="${map[0].place_name != null}">
	<div id="map" class="col-md-13" style="width: 100%; height: 350px; margin-top: 20px;"></div>
	</c:if>
	
	<hr style="height: 1;">
	<span class="col-md-2"> <c:choose>
			<c:when test="${likeStat == 0}">
				<!-- <button type="button" id=like>좋아요</button> -->
				<span><input type="image" src="images/nomal_heart.png"
					id="like"></span>
				<!-- <button type="button" id=likecancel style="display: none">좋아요 취소</button> -->
				<span><input type="image" src="images/heart_77931.png"
					id="likecancel" style="display: none" style="width:4%;"></span>
				<span id=likespan>${result.likeit}</span><span> 명이 좋아합니다</span>
			</c:when>
			<c:otherwise>
				<!-- <button type="button" id=likecancel>좋아요 취소</button> -->
				<input type="image" src="images/heart_77931.png" id="likecancel">
				<input type="image" src="images/nomal_heart.png" id="like"
					style="display: none" style="width:4%;">
				<!-- <button type="button" id=like style="display: none">좋아요</button> -->
				
				<span id=likespan>${result.likeit}</span><span> 명이 좋아합니다</span>
			</c:otherwise>
		</c:choose>
	</span> <span class="col-md-8">조회수 ${result.viewcount}</span>
	<span> 공유하기 <script type="text/javascript" src="http://share.naver.net/js/naver_sharebutton.js"></script> <script type="text/javascript"> new ShareNaver.makeButton({"type": "d"}); </script> </span>
	<!-- <button type="button" class="btn btn-outline-info"
		onclick="$('html, body').stop().animate( { scrollTop : 0 } ); ">맨
		위로</button> -->
	<%-- </c:forEach> --%>
	</div>
	<div style="height: 130px;"></div>
	
	<a id="TopButton" class="ScrollButton" style="opacity: 0.7;"><img src="images/uparrow.PNG"></a>
	<!-- <a id="BottomButton" class="ScrollButton"><img src="images/DOWNButton.png"></a> -->
	<div class="col-md-2" id="sidebar">
	<div class="input-group" id="searchbar">
            <input class="form-control py-2 border-right-0 border" type="search" placeholder="검색하기" id="search-input">
            <span class="input-group-append">
                <button class="btn btn-outline-secondary border-left-0 border" id="searchbt" type="button">
                    <i class="fa fa-search"></i>
                </button>
              </span>
	        </div><br>
	
	<div id="lastestnavi">
		<b>최근 게시물</b>
		<ul class="list-group" style="border:none;"><br>
			<c:choose>
			<c:when test="${latest.size() > 0}">
			<c:forEach var="latest" items="${latest}" begin="0" end="7" step="1" varStatus="status">
			<li id="list-group-item" class="list-group-item"><a href="selectView.tip?seq=${latest.seq}&viewcount=${latest.viewcount}">${latest.title}</a></li>
			</c:forEach>
			</c:when>
			</c:choose>
		</ul>
	</div>
	</div>
<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=965d101f294cd05e4f4a634c53425577&libraries=services"></script>
		<script>
		
		$(document).ready(function() {
			$("#searchbt").click(function(){
				search();
			});
			$('#search-input').keypress(function (e) {
		  		if (e.which == 13) {
			 		 search();
				}
		  	});
			
			function search(){
				var keyword = $("#search-input").val();
				if(keyword != ""){
					var uri = "searchtitle.tip?keyword="+keyword;
					$(location).attr("href", encodeURI(uri));
					}
			}
			$(function() {
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
			 
			    $("#BottomButton").click(function() {
			        $('html').animate({scrollTop : ($('#footera').offset().top)}, 600);
			    });
			});
			
			$("#delete").click(function() {
				var seq = ${result.seq};
				$(location).attr('href', 'delete.tip?seq=' + seq);
			})
			$("#modify").click(function() {
				var seq = ${result.seq};
				$(location).attr('href', 'modify.tip?seq=' + seq);
			})

			$("#like").click(function() {
				if ('${id}' == 'nonmember') {
					$("#loginbt").trigger('click');
				}else {
					$.ajax({
						url : "admin_like.com",
						type : "get",
						data : {
							boardno : "${no}",
							memberid : "${id}",
							likecount : "${result.likeit}"
						},
						success : function(resp) {
							$("#likecancel").show();
							$("#like").hide();
							$("#likespan").text(resp);
						},
						error : function() {
							console.log("에러 발생!");
						}
					})
				}
				
			})
			$("#likecancel").click(function() {
				$.ajax({
					url : "admin_like.com",
					type : "get",
					data : {
						boardno : "${no}",
						memberid : "${id}",
						likecount : "${result.likeit}"
					},
					success : function(resp) {
						$("#like").show();
						$("#likecancel").hide();
						$("#likespan").text(resp);
					},
					error : function() {
						console.log("에러 발생!");
					}
				})
			})
		})
		</script>
			<c:choose>
			<c:when test="${map[0].place_name != null}">
			<script>
				var bounds = new daum.maps.LatLngBounds();
				var mapContainer = document.getElementById('map'), // 지도의 중심좌표
				mapOption = {
					center : new daum.maps.LatLng(33.451475, 126.570528), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};
				var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				var placePosition = new daum.maps.LatLng(${map[0].y},
						${map[0].x});
				bounds.extend(placePosition);
				map.setBounds(bounds);

				// 지도에 마커를 표시합니다 
				var marker = new daum.maps.Marker({
					map : map,
					position : new daum.maps.LatLng(${map[0].y},${map[0].x})
				});

				// 커스텀 오버레이에 표시할 컨텐츠 입니다
				// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
				// 별도의 이벤트 메소드를 제공하지 않습니다 
				var content = '<div class="wrap">'
						+ '    <div class="info">'
						+ '        <div class="title">'
						+ '         ${map[0].place_name}'
						+ '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
						+ '        </div>'
						+ '        <div class="body">'
						+ '            <div class="img">'
						+ '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">'
						+ '           </div>'
						+ '            <div class="desc">'
						+ '                <div class="ellipsis">${map[0].road_address_name}</div>'
						+ '                <div class="jibun ellipsis">${map[0].address_name}</div>'
						+ '                <div><a href="${map[0].place_url}" target="_blank" class="link">홈페이지</a></div>'
						+ '				   <div class="ellipsis">${map[0].phone}</div>'
						+ '            </div>' + '        </div>' + '    </div>'
						+ '</div>';

				// 마커 위에 커스텀오버레이를 표시합니다
				// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
				var overlay = new daum.maps.CustomOverlay({
					content : content,
					map : map,
					position : marker.getPosition()
				});

				// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
				daum.maps.event.addListener(marker, 'click', function() {
					overlay.setMap(map);
				});

				// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
				function closeOverlay() {
					overlay.setMap(null);
				}
				</script>
			</c:when>
			</c:choose>
			
			
			
		
<link rel="stylesheet" href="boardcss/boardView.css" type="text/css">
		<%@ include file="../include/bottom.jsp"%>