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
<link rel="stylesheet" href="communitycss/boardWrite.css">

<script>
$(document).ready(function(){
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
	$("#cancelbt").click(function(){
		$(location).attr('href',"boardView.freeb?cat=${result[0].category}")
	})
	$("#plus").click(function(){
        	var count = 2;
            $("#filediv").after("<input type='file' name='file"+count+"'><br>");
            count++;
        })
     
	var sysFileList=[];
     function sendFile(file, editor) {
           var data = new FormData();
           data.append("uploadFile", file);
           $.ajax({
              data : data,
              type : "POST",
              url : '../upload.img',
              cache : false,
              contentType : false,
              /* enctype : 'multipart/form-data', */
              processData : false,
              success : function(data) {
                 // 에디터에 이미지 출력(아직은 안합니다.)
                 $(editor).summernote('editor.insertImage', data.url);
                 sysFileList.push(data.systemFileName);
              }
           });
        }
     
})
         
         </script>
</head>
<body>
	<div class="container">
		<form action="boardWrite.freeb" method="post"
			enctype="multipart/form-data">
			<div id="wrapper">
			<div id="head1">말머리</div>
				<div id="head2">
				<c:choose>
				<c:when test="${cat eq 'free'}">
				<input type="hidden" name="hcat" value="free">
				<select name="header" id="header">
					<option value="chat">잡담</option>
					<option value="humor">유머</option>
					<option value="beast">동물</option>
				</select>
				</c:when>
				<c:when test="${cat eq 'tip'}">
				<input type="hidden" name="hcat" value="tip">
				<select name="header" id="header">
					<option value="living">생활</option>
					<option value="recipe">레시피</option>
					<option value="rest">맛집</option>
					<option value="trip">여행</option>
				</select>
				</c:when>
				<c:when test="${cat eq 'coun'}">
				<input type="hidden" name="hcat" value="coun">
				<select name="header" id="header">
					<option value="hobby">취미</option>
					<option value="game">게임</option>
					<option value="rela">이성</option>
					<option value="life">인생</option>
					<option value="friend">친구</option>
					<option value="complex">컴플렉스</option>
				</select>
				</c:when>
				<c:when test="${cat eq 'qna'}">
				<input type="hidden" name="hcat" value="qna">
				</c:when>
				</c:choose>
				</div>
			<div id="title">제목</div>
			<div id="titlediv"><input type="text" name="title" id="titleinput"></div>
			</div>
			<div id=summer>
			<textarea id="summernote" name="summernote"></textarea>
			</div>
			<div id=filediv>
			<input type="file" name="file" id="file"><button type="button" id="plus">+</button>
			</div>
			<input type="hidden" id="imgBackUp" name="contentsImg">
			
			<div id="btmbtn">
				<button type="submit" class="btn btn-primary" id="writebt">작성</button>
				<button type="button" class="btn btn-danger" id="cancelbt">취소</button>
			</div>
		</form>
	</div>
</body>
</html>