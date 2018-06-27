<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="../communitycss/boardWrite.css">

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
          }
      }
 /* codemirror: { // codemirror options
  theme: 'paper'
} */
         
 });
 
  
 function sendFile(file, editor) {
       var data = new FormData();
       data.append("uploadFile", file);
       $.ajax({
          data : data,
          type : "POST",
          url : '../upload.utip',
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
</script>
</head>
<body>
	<div class="container">
		<form action="../BoardUserTipController" method="post"
			enctype="multipart/form-data">
			<div id="wrapper">
				제목: <input type="text" name="title" id="title"> 말머리: <select
					name="header" id="header">
					<option value="chat">히오스</option>
					<option value="humor">와우</option>
					<option value="beast">배그</option>
				</select>
			</div>
			<textarea id="summernote" name="summernote"></textarea>
			<input type="file" name="file" id="file"> <input
				type="submit" value="완료" id="listButton">
		</form>
	</div>
</body>
</html>