<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

<script>
	$(document).ready(function() {
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
				}
			}

		});

		function sendFile(file, editor) {
			var data = new FormData();
			data.append("uploadFile", file);
			$.ajax({
				data : data,
				type : "POST",
				url : '../upload.freeb',
				cache : false,
				contentType : false,
				/* enctype : 'multipart/form-data', */
				processData : false,
				success : function(data) {
					// 에디터에 이미지 출력(아직은 안합니다.)
					$(editor).summernote('editor.insertImage', data.url);
				}
			});
		}

	})
</script>
</head>
<body>
	<div class="container">
		<form action="../BoardFree_Controller" method="post"
			enctype="multipart/form-data">
			<div id="wrapper">
				제목: <input type="text" name="title" id="title"
					value="${result.title}"> 말머리: <select name="header"
					id="header">
					<option value="chat">잡담</option>
					<option value="humor">유머</option>
					<option value="beast">동물</option>
				</select>
			</div>
			<textarea id="summernote" name="summernote">${result.contents}</textarea>
			<input type="file" name="file" id="file"> <input
				type="submit" value="완료" id="listButton">
		</form>
	</div>
	<input type="hidden" id="seq" name=seq value="${result.seq}">
</body>
</html>