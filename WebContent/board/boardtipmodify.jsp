<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

</head>
<body>
	<form action="../editor.tw" method="post" enctype="multipart/form-data">
		<div class="container" style="padding-top: 6%;">
			<c:forEach var="item" items="${result}">
				<div class="form-row" style="padding-left: 14px;">
					<div class="form-group col-md-3">
						<label for="sel1">카테고리</label> <select class="form-control"
							id="sel1" name="category" onchange="categoryChange(this)">
							<option value="${item.category }">${item.category }</option>
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
							<option value="${item.subject }">${item.subject }</option>
						</select>
					</div>

				</div>

				<div class="form-group col-md-8">
					<label for="formGroupExampleInput">제목</label> <input type="text"
						class="form-control" name="title" placeholder="제목"
						value="${item.title }">
				</div>

				<div class="form-group col-md-12">
					<textarea id="summernote" name="summernote">${item.contents }</textarea>
				</div>
			</c:forEach>

			<div class="form-group col-md-8">
				<label for="formGroupExampleInput">썸네일 이미지</label><br> 
				<input type="file" name="file">
			</div>
			<br> <input type="text" id="imgBackUp" name="contentsImg">
			<div class="col-sm-3">
				<!-- <button type="button" class="btn btn-primary" id="submit">Submit</button> -->
				<input type="submit" class="btn btn-primary" value="submit">
			</div>
		</div>
	</form>
	<script>
		function categoryChange(e) {
			var sel2_꿀팁 = [ "생활", "부동산", "자유" ];
			var sel2_요리 = [ "초간단 요리", "일반 요리" ];
			var sel2_인테리어 = [ "가구", "소품" ];
			var sel2_여행 = [ "국내여행", "해외여행" ];
			var sel2_맛집 = [ "서울", "인천&경기", "충청도", "경상도", "전라도" ];
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
				onMediaDelete : function(target) {
					//alert(target[0].src); 
					deleteFile(target[0].src);
				}
			}

		/* codemirror: { // codemirror options
		theme: 'paper'
		} */

		});

		function deleteFile(src) {
			console.log(src);
			var result = src.split("/files/");
			console.log(result);
			$.ajax({
				data : {
					src : result[1]
				},
				type : "POST",
				url : "../deleteImg.img", // replace with your url
				cache : false,
				success : function(resp) {
					//console.log(resp);
				}
			});
		}

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