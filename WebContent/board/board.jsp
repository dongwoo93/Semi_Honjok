<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>bootstrap4</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
   <script>
   	$(document).ready(function(){
   		$("#submit").onclick(function(){
   			$(location).attr("href","board")
   		})
   	})
   </script>

    
    <style>
    	#summernote{
    		
    	}
    </style>
    
  </head>
  <body>
  

  
    <div id="summernote"></div>
    <button type="button" id="submit">글쓰기</button>
    <script>
      $('#summernote').summernote({
        placeholder: 'Hello bootstrap 4',
        tabsize: 2,
        height: 700,
        width: 1000,
        callbacks: {

	   		onImageUpload: function(image) {

				uploadImage(image[0]);

	   		}

	   },
        minHeight: null,      // 최소 높이값(null은 제한 없음)
        maxHeight: null,      // 최대 높이값(null은 제한 없음)
        focus: true,          // 페이지가 열릴때 포커스를 지정함
        lang: 'ko-KR',         // 한국어 지정(기본값은 en-US)
        
	   codemirror: { // codemirror options

		   theme: 'monokai'

		  }
	   function uploadImage(image) {

	        var data = new FormData();

	        data.append("image", image);

	        $.ajax({

	            type: "post",

	            cache: false,

	            contentType:false,

	            processData: false,

	            dataType :'jsonp',

	            url: '/cop/bbs/insertSummberNoteFile.do',

	            data: data,

	            success: function(data) {

	//이미지 경로를 작성하면 됩니다 ^  ^

	                var image = $('<img>').attr('src', '/cmm/fms/getImage.do?atchFileId='+data[0].atchFileId+'&fileSn=0');

	                $('#nttCn').summernote("insertNode", image[0]);

	            },

	            error: function(data) {

	            	alert('error : ' +data);

	            }

	        });

	    }
      });
    </script>
  </body>
</html>