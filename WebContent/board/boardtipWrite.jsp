<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>

<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>
<link rel="stylesheet" href="../boardcss/boardwritecss.css"
	type="text/css">

<script>
	$(document).ready(function() {

	});
	/* $("#listButton").click(function() {
	  setInterval(function() { 
	   $.ajax({
	      type : 'post',
	      url : '../boardWrite',
	      dataType : 'text',
	      data : $("#summernote").val(),
	      success : function(data) {
	        // $("#listDiv").html(data);
	      }
	   });
	  }, 5000);
	   var title = $("#title").val();
	  $.ajax({
		  url:'../boardWrite',
		  type:"post",
		  data: {title:title}
		  
	  });
	})

	}); */
</script>
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
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
	padding: 5px;
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
	margin: 6px 0 0 5px;
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

#category {
	font-size: 4px;
}
</style>



</head>
<body>
	<form id="postform" method="post" enctype="multipart/form-data" >
		<div class="container" style="padding-top:6%;">
			<div class="form-row" style="padding-left: 14px;">
				<div class="form-group col-md-3">
					<label for="sel1">카테고리</label> <select class="form-control"
						id="sel1" name="category" onchange="categoryChange(this)">
						<option>카테고리를 선택하세요</option>
						<option value="꿀팁">꿀팁</option>
						<option value="요리">요리</option>
						<option value="인테리어">인테리어</option>
						<option value="여행">여행</option>
						<option value="맛집">맛집</option>
						<option value="쇼핑몰">쇼핑몰</option>
					</select>
				</div>
				<div class="form-group col-md-3">
					<label for="sel2">말머리</label> <select class="form-control"
						id="sel2" name="subject">
						<option>말머리를 선택하세요</option>
					</select>
				</div>
			</div>
			<script>
				function categoryChange(e) {
					var sel2_꿀팁 = [ "청소", "라이프", "경제적" ];
					var sel2_요리 = [ "초간단요리", "일반요리"];
					var sel2_인테리어 = [ "가구", "소품" ];
					var sel2_여행 = [ "국내여행", "해외여행" ];
					var sel2_맛집 = [ "서울", "인천경기", "충청도", "경상도", "전라도" ];
					var sel2_쇼핑몰 = [ "쇼핑" ];
					var target = document.getElementById("sel2");

					if (e.value == "꿀팁")
						var d = sel2_꿀팁;
					else if (e.value == "요리")
						var d = sel2_요리;
					else if (e.value == "인테리어")
						var d = sel2_인테리어;
					else if (e.value == "여행")
						var d = sel2_여행;
					else if (e.value == "맛집")
						var d = sel2_맛집;
					else if (e.value == "쇼핑몰")
						var d = sel2_쇼핑몰;
					target.options.length = 0;

					for (x in d) {
						var opt = document.createElement("option");
						opt.value = d[x];
						opt.innerHTML = d[x];
						target.appendChild(opt);
					}
				}
			</script>
			
				<div class="form-group col-md-8">
					<label for="formGroupExampleInput">제목</label> <input type="text"
						class="form-control" id="title" name="title" placeholder="제목">
				</div>
				
				<div class="form-group col-md-12">
 
          <textarea id="summernote" name="summernote"></textarea>
 
        </div>
 

			<div class="form-group col-md-8">
				<label for="formGroupExampleInput">썸네일 이미지</label><br>
				<input type="file" id="file" name="file">
			</div><br>
			<input type="hidden" id="imgBackUp" name="contentsImg">
			


			<div class="map_wrap">
				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							키워드 : <input type="text" name="searchs" value="이태원 맛집" id="keyword" size="15">
							<input type="button" value="검색하기"
								onclick="searchPlaces(); return false">

						</div>
					</div>
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
			</div>

			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=965d101f294cd05e4f4a634c53425577&libraries=services"></script>
			<script>
				// 마커를 담을 배열입니다
				var markers = [];
				var num = 0;
				var overlay = new Array();
				var bounds;

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new daum.maps.Map(mapContainer, mapOption);

				// 장소 검색 객체를 생성합니다
				var ps = new daum.maps.services.Places();

				// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
				var infowindow = new daum.maps.InfoWindow({
					zIndex : 1
				});

				// 키워드로 장소를 검색합니다

				searchPlaces();

				// 키워드 검색을 요청하는 함수입니다
				function searchPlaces() {
					removeMarker();

					var keyword = document.getElementById('keyword').value;

					if (!keyword.replace(/^\s+|\s+$/g, '')) {
						alert('키워드를 입력해주세요!');
						return false;
					}

					// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
					ps.keywordSearch(keyword, placesSearchCB);
				}

				// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
				function placesSearchCB(data, status, pagination) {

					if (status === daum.maps.services.Status.OK) {

						console.log(pagination);
						// 정상적으로 검색이 완료됐으면
						// 검색 목록과 마커를 표출합니다
						displayPlaces(data);
						// 페이지 번호를 표출합니다
						displayPagination(pagination);

					} else if (status === daum.maps.services.Status.ZERO_RESULT) {

						alert('검색 결과가 존재하지 않습니다.');
						return;

					} else if (status === daum.maps.services.Status.ERROR) {

						alert('검색 결과 중 오류가 발생했습니다.');
						return;

					}
				}

				// 검색 결과 목록과 마커를 표출하는 함수입니다
				function displayPlaces(places) {

					var listEl = document.getElementById('placesList'), menuEl = document
							.getElementById('menu_wrap'), fragment = document
							.createDocumentFragment(), listStr = '';
					bounds = new daum.maps.LatLngBounds();

					// 검색 결과 목록에 추가된 항목들을 제거합니다
					removeAllChildNods(listEl);

					// 지도에 표시되고 있는 마커를 제거합니다
					removeMarker();

					for (var i = 0; i < overlay.length; i++) {

						overlay[i].setMap(null);

					}

					for (var i = 0; i < places.length; i++) {

						// 마커를 생성하고 지도에 표시합니다
						var placePosition = new daum.maps.LatLng(places[i].y,
								places[i].x);
						var marker = addMarker(placePosition, i);
						var itemEl = getListItem(marker, i, places[i],
								placePosition); // 검색 결과 항목 Element를 생성합니다

						// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
						// LatLngBounds 객체에 좌표를 추가합니다
						bounds.extend(placePosition);

						// 마커와 검색결과 항목에 mouseover 했을때
						// 해당 장소에 인포윈도우에 장소명을 표시합니다
						// mouseout 했을 때는 인포윈도우를 닫습니다
						(function(marker, title) {

							//              itemEl.onmouseover = function() {
							//                 
							//               };
							//
							//itemEl.onmouseout = function() {
							//   infowindow.close();
							//};
						})(marker, places[i].place_name);

						fragment.appendChild(itemEl);
					}

					// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
					listEl.appendChild(fragment);
					menuEl.scrollTop = 0;

					// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
					map.setBounds(bounds);
				}

				// 검색결과 항목을 Element로 반환하는 함수입니다
				function getListItem(marker, index, places, placePosition) {

					var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
							+ (index + 1)
							+ '"></span>'
							+ '<div class="info">'
							+ '   <h5>' + places.place_name + '</h5>';

					//검색결과 목록 클릭이벤트       
					el.onclick = (function() {
						var ol = displayInfowindow(marker, index,
								places.place_name, places, placePosition);
						for (var i = 0; i < overlay.length; i++) {
							if (ol != overlay[i]) {
								overlay[i].setMap(null);
							}
						}
						
						
						//for(var i = 0; i < overlay.length; i++) {
						//	if(overlay[index] != ol) {
						//		overlay[i].setMap(null);
						//	}
						//}
						
						document.getElementById("place_name").value=places.place_name;
						document.getElementById("category_name").value=places.category_name;
						document.getElementById("phone").value=places.phone;
						document.getElementById("road_address_name").value=places.road_address_name;
						document.getElementById("address_name").value=places.address_name;
						document.getElementById("place_url").value=places.place_url;
						document.getElementById("x").value=places.x;
						document.getElementById("y").value=places.y;

						removeMarker2(index, places, marker);

						/* 				console.log(places.place_name);
						 console.log(places.category_name);
						 console.log(places.phone);
						 console.log(places.road_address_name);
						 console.log(places.place_url);
						 console.log(places.x);
						 console.log(places.y); */
					});

					if (places.road_address_name) {
						itemStr += '    <span>' + places.road_address_name
								+ '</span>' + '   <span class="jibun gray">'
								+ places.address_name + '</span>';
					} else {
						itemStr += '    <span>' + places.address_name
								+ '</span>';
					}

					itemStr += '  <span class="tel">' + places.phone
							+ '</span>' + '</div>';

					el.innerHTML = itemStr;
					el.className = 'item';

					return el;

				}

				// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
				function addMarker(position, idx, title) {
					var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
					imageSize = new daum.maps.Size(36, 37), // 마커 이미지의 크기
					imgOptions = {
						spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
						spriteOrigin : new daum.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
						offset : new daum.maps.Point(13, 37)
					// 마커 좌표에 일치시킬 이미지 내에서의 좌표
					}, markerImage = new daum.maps.MarkerImage(imageSrc,
							imageSize, imgOptions), marker = new daum.maps.Marker(
							{
								position : position, // 마커의 위치
								image : markerImage
							});

					marker.setMap(map); // 지도 위에 마커를 표출합니다
					markers.push(marker); // 배열에 생성된 마커를 추가합니다

					return marker;
				}

				// 지도 위에 표시되고 있는 마커를 모두 제거합니다
				function removeMarker() {

					for (var i = 0; i < markers.length; i++) {
						markers[i].setMap(null);
					}
					markers = [];
				}

				//지도 위에 표시되고 있는 마커를 자기 자신만 빼고 삭제
				function removeMarker2(index, places, marker) {

					console.log("여기는들어오냐0");

					if (markers[index].getMap(map) != null) {
						hideMarkers(index);

					} else {
						showMarkers(index);
						hideMarkers(index);
					}
				}

				function setMarkers(map, index) {
					markers[index].setMap(map);
				}

				function hideMarkers(index) {
					for (var i = 0; i < markers.length; i++) {
						if (i != index) {
							setMarkers(null, i);
						}
					}
				}

				function showMarkers(index) {
					setMarkers(map, index);
				}

				// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
				function displayPagination(pagination) {
					infowindow.close();

					var paginationEl = document.getElementById('pagination'), fragment = document
							.createDocumentFragment(), i;

					// 기존에 추가된 페이지번호를 삭제합니다
					while (paginationEl.hasChildNodes()) {
						paginationEl.removeChild(paginationEl.lastChild);
					}

					for (i = 1; i <= pagination.last; i++) {
						var el = document.createElement('a');
						el.href = "#";
						el.innerHTML = i;

						if (i === pagination.current) {
							el.className = 'on';
						} else {
							el.onclick = (function(i) {
								return function() {
									pagination.gotoPage(i);
								}
							})(i);
						}

						fragment.appendChild(el);
					}
					paginationEl.appendChild(fragment);
				}

				// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
				// 인포윈도우에 장소명을 표시합니다
				function displayInfowindow(marker, index, title, places,
						placePosition) {
					console.log("placePositoin" + placePosition);
					bounds.extend(placePosition);
					map.setBounds(bounds);
					var content = '	<div class="wrap">'
							+ '    <div class="info">'
							+ '        <div class="title">'
							+ places.place_name
							+ '<inline id="category">'
							+ places.category_name
							+ '</inline>            <div id=close'+num+' class=close title=닫기></div>'
							+ '        </div>'
							+ '        <div class="body">'
							+ '            <div class="desc">'
							+ '                <div class="ellipsis">'
							+ places.phone
							+ '</div>'
							+ '                <div class="ellipsis">'
							+ places.road_address_name
							+ '</div>'
							+ '                <div class="jibun ellipsis">'
							+ places.address_name
							+ '</div>'
							+ '                <div><a href="'+places.place_url+'" target="_blank" class="link">홈페이지</a></div>'
							+ '            </div>'
							+ '        </div>'
							+ '    </div>' + '</div>' + '</div>';

					overlay[num] = new daum.maps.CustomOverlay({
						content : content,
						map : map,
						position : marker.getPosition()
					});

					document.getElementById('close' + num).onclick = function() {
						for (var i = 0; i < overlay.length; i++) {
							overlay[i].setMap(null);
						}
						for (var i = 0; i <= index; i++) {
							markers[i].setMap(null);
						}
					}

					return overlay[num++];
				}

				// 검색결과 목록의 자식 Element를 제거하는 함수입니다
				function removeAllChildNods(el) {

					while (el.hasChildNodes()) {
						el.removeChild(el.lastChild);
					}
				}
			</script>

			<input id="place_name" type="hidden" name="places.place_name">
			<input id="category_name" type="hidden" name="places.category_name">
			<input id="phone" type="hidden" name="places.phone">
			<input id="road_address_name" type="hidden" name="places.road_address_name">
			<input id="address_name" type="hidden" name="places.address_name">
			<input id="place_url" type="hidden" name="places.place_url">
			<input id="x" type="hidden" name="places.x">
			<input id="y" type="hidden" name="places.y">
			<div class="col-sm-3">
				<!-- <button type="button" class="btn btn-primary" id="submit">Submit</button> -->
				<!-- <input type="button" class="btn btn-primary" value="button"> -->
				<button type="button" class="btn btn-primary" id="writebt">작성</button>
				<button type="button" class="btn btn-danger" id="cancelbt">취소</button>
			</div>
		</div>
	</form>
	<script>
			$('#summernote').summernote({
				placeholder : '내용',
				//width : 1500,
				//height : 300, // set editor height
				minHeight : 300, // set minimum height of editor
				maxHeight : null, // set maximum height of editor
				focus : true,
				callbacks : {
		            // 이미지를 업로드 할 때 이벤트 발생
		            onImageUpload : function(files, editor, welEditable) {
		                sendFile(files[0], this);
		            },
		            /* onMediaDelete : function(target) {
	            	    //alert(target[0].src); 
	                	deleteFile(target[0].src);
	            	}  */
	            	/* onMediaDelete : function($target, editor, $editable) {
	                    alert($target.context.dataset.filename);         
	                    target.remove();
	                } */
		        }
				
			/* codemirror: { // codemirror options
		    theme: 'paper'
		  } */
					  
			});
			
			/* function deleteFile(src) {
				console.log(src);
				var result = src.split("/files/");
				console.log(result);
			    $.ajax({
			        data: {src : result[1]},
			        type: "POST",
			        url: "../deleteImg.img", // replace with your url
			        cache: false,
			        success: function(resp) {
			            //console.log(resp);
			        }
			    });
			} */
			var sysFileList=[];
			function sendFile(file, editor) {
					var data = new FormData();
					data.append("uploadFile", file);
					console.log(file);
					$.ajax({
						data : data,
						type : "POST",
						url : '../upload.img',
						cache : false,
						contentType : false,
						//enctype : 'multipart/form-data',
						processData : false,
						success : function(data) {
							// 에디터에 이미지 출력(아직은 안합니다.)
							$(editor).summernote('editor.insertImage', data.url);
							console.log(data.systemFileName);
							sysFileList.push(data.systemFileName);
							
							//$("#imgBackUp").val($("#imgBackUp").val() + data.systemFileName);
						}
					});
				}
			function makeFunction(dst) {
				document.getElementById("postform").action = dst;
			    document.getElementById("postform").submit();	
			}
			
			
			function check() {
				var title = document.getElementById("title").value;
				var content = document.getElementById("summernote").value;
				var sel1 = document.getElementById("sel1").value;
				var sel2 = document.getElementById("sel2").value;
				var file = document.getElementById("file").value;
				if(title != "" && content != "" && sel1 != "" && sel2 != "" && file != "") {
					alert("들어옴");
					return true;
				} else {
					alert("입력사항을 확인해주세요.");
					return false;
				}
				
			}
			
			document.getElementById("cancelbt").onclick = function() {
				location.href = "../hollo.com"
			}
			
			document.getElementById("writebt").onclick = function() {
				var result = check();
				if(result) {
					$("#imgBackUp").val(JSON.stringify(sysFileList));
					makeFunction("../editor.tw");
				}
			
			}
			
			/* function sendContents() {
			       $("#summernote").html($("#summernote").summernote('code'));
			       document.writeContents.submit();
			   } */

		function sendFile(file, editor) {
			var data = new FormData();
			data.append("uploadFile", file);
			console.log(file);
			$.ajax({
				data : data,
				type : "POST",
				url : '../upload.img',
				cache : false,
				contentType : false,
				//enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					// 에디터에 이미지 출력(아직은 안합니다.)
					$(editor).summernote('editor.insertImage', data.url);
					console.log(data);
					$("#imgBackUp").val(
							$("#imgBackUp").val() + data.systemFileName + ",");
				}
			});
		}
		function sendContents() {
			$("#summernote").html($("#summernote").summernote('code'));
			document.writeContents.submit();
		}
	</script>
</body>
</html>