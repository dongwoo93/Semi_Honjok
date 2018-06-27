<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
	<meta charset="uft-8" />
	<title>summernote</title>
	<!-- include jquery -->
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<!-- include Bootstrap and fontawesome-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" />

<!-- include summernote css/js-->
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css">
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>

<!-- include summernote plugin-->
<script type="text/javascript" src="summernote-map-plugin.js"></script>
	<script type="text/javascript">
        /* summernote에서 이미지 업로드시 실행할 함수 */
	 	
	</script>
</head>
<body>
	<h1>summernote</h1>
	<form name="writeForm" action="./summernote_insert.jsp" method="post">
		<textarea id="summernote">Hello Summernote</textarea>
		</form>
        <script>
            $(document).ready(function() {
                $('#summernote').summernote({ // summernote를 사용하기 위한 선언
                    height: 400,
					
                map: {
                    apiKey: 'GOOGLE_MAP_API_BROWSER_KEY',
                    // This will be used when map is initialized in the dialog.
                    center: {
                      lat: -33.8688,
                      lng: 151.2195
                    },
                    zoom: 13
                },
                toolbar: [
                    ['insert',  'map']]
                
				});
			});
		</script>
</body>
</html>
