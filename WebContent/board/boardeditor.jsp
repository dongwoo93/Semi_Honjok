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
    
	<script>
	$(document).ready(function() {
	      $('#summernote').summernote();

	      $("#listButton").click(function() {
	         $.ajax({
	            type : 'post',
	            url : '../boardWrite',
	            dataType : 'text',
	            data : $("#summernote").val(),
	            success : function(data) {
	              // $("#listDiv").html(data);
	            }
	         });
	      })

	   });

	</script>
</head>
<body>
	
	<textarea id="summernote" name="summernote"></textarea>
	<input type="button" value="완료" id="listButton">

</body>
</html>