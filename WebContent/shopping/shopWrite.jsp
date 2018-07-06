<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>


<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>


<!-- include summernote-ko-KR -->
<script src="dist/lang/summernote-ko-KR.js"></script>
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
#deliveryid{
	padding-top: 37px;
	padding-left: 20px;
}

.navbar-light .navbar-nav .nav-link {
	color: black;
}
#navbar {
	background-color: #eef2f5 !important;
	transition: background-color 200ms linear;
}

</style>



</head>
<body>
	<form id="postform" method="post" enctype="multipart/form-data" >
		<div class="container" style="padding-top:6%;">
			<div class="form-row" style="padding-left: 14px;">
				<div class="form-group col-md-3">
				<label for="formGroupExampleInput">상품명</label>
				<input type="text" class="form-control" id="product_name" name="product_name" placeholder="상품명">
				</div>
				
				<div class="form-group col-md-3">
					<label for="formGroupExampleInput">상품가격</label>
					<input type="text" class="form-control" id="product_price" name="product_price" placeholder="상품가격">
					
				</div>
				
				<div class="form-group col-md-3">
					<label for="formGroupExampleInput">수량</label>
					<input type="number" class="form-control" id="product_quantity" name="product_quantity" placeholder="0" value="1" min="1" max="999">
				</div>
			</div>
			<div class="form-row" style="padding-left: 14px;">
				<div class="form-group col-md-8">
					<label for="formGroupExampleInput">상품설명</label>
					<input type="text" class="form-control" id="product_summary" name="product_summary" placeholder="상품설명">
				</div>
				
				<div class="form-group col-md-4" id="deliveryid">
					<label for="formGroupExampleInput">배송비</label>
					<input type="radio" name="product_delivery" value="N">무료
					<input type="radio" name="product_delivery" value="Y" checked="checked">유료(2500원)
				</div>
			</div>
				<div class="form-group col-md-12">
 
          <textarea id="summernote" name="summernote"></textarea>
 
        </div>

			<div class="form-group col-md-8">
				<label for="formGroupExampleInput">&#9660; 썸네일 이미지 첨부(*필수항목)</label><br>
				<input type="file" id="file" name="file">
			</div><br>
			
			<input type="hidden" id="imgBackUp" name="contentsImg">

				<button type="button" class="btn btn-primary" id="writebt">작성</button>
				<button type="button" class="btn btn-danger" id="cancelbt">취소</button>
			</div>
	</form>
	<script>
			$('#summernote').summernote({
				placeholder : '내용',
				lang: 'ko-KR',
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
						url : 'upload.img',
						cache : false,
						contentType : false,
						//enctype : 'multipart/form-data',
						processData : false,
						success : function(data) {
							// 에디터에 이미지 출력(아직은 안합니다.)
							$(editor).summernote('editor.insertImage', data.url);
							
							sysFileList.push(data.systemFileName);
							console.log(sysFileList[0]);
							
						}
					});
				}
			function makeFunction(dst) {
				document.getElementById("postform").action = dst;
			    document.getElementById("postform").submit();	
			}
			
			
			function check() {
				var product_name = document.getElementById("product_name").value;
				var product_price = document.getElementById("product_price").value;
				var product_quantity = document.getElementById("product_quantity").value;
				var product_summary = document.getElementById("product_summary").value;
				var prodcut_delivery = document.querySelector('input[name=product_delivery]:checked').value;
				var product_contents = document.getElementById("summernote").value;
				var file = document.getElementById("file").value;
				var summernote = document.getElementById("summernote").value;

				if(product_summary != "" && product_name != "" && product_price != "" && product_quantity != "" && product_contents != "" && file != "" && prodcut_delivery != "") {
					return true;
				} else {
					alert("입력사항을 확인해주세요.");
					return false;
				}
				
			}
			
			document.getElementById("cancelbt").onclick = function() {
				history.back();
			}
			
			document.getElementById("writebt").onclick = function() {
				var result = check();
				if(result) {
					var isEmpty = function(sysFileList){ 
						if( sysFileList == "" || sysFileList == null || sysFileList == undefined || ( sysFileList != null && typeof sysFileList == "object" && !Object.keys(sysFileList).length ) ){ 
							return false; 
							}else{ 
								return true; } 
						};
					if(isEmpty){
						$("#imgBackUp").val(JSON.stringify(sysFileList));
					}
					$('#writebt').attr('disabled', true);
					makeFunction("shopregister.shop");
				}
			
			}
			
	</script>
<%@ include file="../include/bottom.jsp"%>