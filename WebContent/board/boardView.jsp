<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$(document).ready(function() {
		$("#delete").click(function() {
			var seq = $
			{
				result[0].seq
			}
			;
			$(location).attr('href', 'delete.tip?seq=' + seq);
		})
		$("#modify").click(function() {
			var seq = $
			{
				result[0].seq
			}
			;
			$(location).attr('href', 'modify.tip?seq=' + seq);
		})

		$("#like").click(function() {
			$.ajax({
				url : "admin_like.com",
				type : "get",
				data : {
					boardno : "${no}",
					memberid : "${id}",
					likecount : "${result[0].likeit}"
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
		})
		$("#likecancel").click(function() {
			$.ajax({
				url : "admin_like.com",
				type : "get",
				data : {
					boardno : "${no}",
					memberid : "${id}",
					likecount : "${result[0].likeit}"
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

<style>
#like, #likecancel {
	display: inline-block;
	width: 5%;
	height: 5%;
	margin: 0px;
	padding0: 0px;
}

.col-md-3 {
	display: inline-block;
	margin: 0px;
	max-width: 60px;
}



.cos-md-8 {
	text-align: right;
}

span {
	border: 1px dotted orange;
}

.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}
</style>
</head>
<body>
	<div class="container">
		<%-- <c:forEach var="item" items="${result}"> --%>
		<div class="col-md-15">
			<h2>${result[0].title}</h2>
		</div>
		<div class="col-md-12" style="text-align: right">
			<span class="col-md-2">${result[0].writedate}</span>
			<%-- <span class="cos-sm-2" id="seq">${result[0].seq}</span> --%>
			<span class="col-md-3"><button type="button"
					class="btn btn-info" id="modify">수정</button></span> <span class="col-md-3"><button
					type="button" class="btn btn-danger" id="delete">삭제</button></span>
		</div>
		<hr style="height: 1">


		<div class="col-md-15">${result[0].contents}</div>

		<div id="map" style="width: 100%; height: 350px;"></div>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=965d101f294cd05e4f4a634c53425577&libraries=services"></script>
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
</body>
</html>