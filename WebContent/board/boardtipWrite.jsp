<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$('#clickBtn').on('click', function(event) {
		if ($('#divText').text().length == 0) {
			alert('글자를 입력해주세요.')
		} else {
			var sendData = $('#divText').text();
			alert(sendData);
		}

	})
</script>
<style>
[contenteditable=true]:empty:before {
	content: attr(placeholder);
	display: block; /* For Firefox */
}

div[contenteditable=true] {
	border: 1px solid #ddd;
	background-color: #fdfdfd;
	color: #333;
	font-size: 12px;
	width: 300px;
	padding: 5px;
}
</style>
</head>
<body>
	<div id="divText" contenteditable="true" placeholder="여기에 글자를 입력해주세요."></div>
	<button type="button" id="clickBtn">확인</button>
	<p id="status">File API & FileReader API not supported</p>
	<p>
		<input type=file>
	</p>
	<p>Select an image from your machine to read the contents of the
		file without using a server</p>
	<div id="holder"></div>
	<article>
		<p id="status">File API & FileReader API not supported</p>
		<p>
			<input type=file>
		</p>
		<p>Select an image from your machine to read the contents of the
			file without using a server</p>
		<div id="holder"></div>
		<a href="data:image/jpeg;base64,/9j/4AAQSkZ..."
			download="filename.jpg"></a>
	</article>
	<script>
		var upload = document.getElementsByTagName('input')[0], holder = document
				.getElementById('holder'), state = document
				.getElementById('status');

		if (typeof window.FileReader === 'undefined') {
			state.className = 'fail';
		} else {
			state.className = 'success';
			state.innerHTML = 'File API & FileReader available';
		}

		upload.onchange = function(e) {
			e.preventDefault();

			var file = upload.files[0], reader = new FileReader();
			reader.onload = function(event) {
				var img = new Image();
				img.src = event.target.result;
				// note: no onload required since we've got the dataurl...I think! :)
				if (img.width > 560) { // holder width
					img.width = 560;
				}
				holder.innerHTML = '';
				/* $("#contents").append("<img src="+ img + ">"); */

				
				
				divText.appendChild(img);

			};
			reader.readAsDataURL(file);

			return false;
		};
		var img = document.images[0];
		img.onclick = function() {
		    // atob to base64_decode the data-URI
		    var image_data = atob(img.src.split(',')[1]);
		    // Use typed arrays to convert the binary data to a Blob
		    var arraybuffer = new ArrayBuffer(image_data.length);
		    var view = new Uint8Array(arraybuffer);
		    for (var i=0; i<image_data.length; i++) {
		        view[i] = image_data.charCodeAt(i) & 0xff;
		    }
		    try {
		        // This is the recommended method:
		        var blob = new Blob([arraybuffer], {type: 'application/octet-stream'});
		    } catch (e) {
		        // The BlobBuilder API has been deprecated in favour of Blob, but older
		        // browsers don't know about the Blob constructor
		        // IE10 also supports BlobBuilder, but since the `Blob` constructor
		        //  also works, there's no need to add `MSBlobBuilder`.
		        var bb = new (window.WebKitBlobBuilder || window.MozBlobBuilder);
		        bb.append(arraybuffer);
		        var blob = bb.getBlob('application/octet-stream'); // <-- Here's the Blob
		    }

		    // Use the URL object to create a temporary URL
		    var url = (window.webkitURL || window.URL).createObjectURL(blob);
		    location.href = url; // <-- Download!
		};
	</script>
</body>
</html>