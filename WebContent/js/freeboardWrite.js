var count = 1;

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
            $("#filediv").append("<input type='file' name='file"+count+"'><br>");
            count++;
            $("#filediv > input:file").last().change(function (){
   	    	 $("#plus").trigger("click");
   	     });
        })
        
        $("#filediv > input:file").change(function (){
   	    	 $("#plus").trigger("click");
   	     });
	   
     
	var sysFileList=[];
     function sendFile(file, editor) {
           var data = new FormData();
           data.append("uploadFile", file);
           $.ajax({
              data : data,
              type : "POST",
              url : 'upload.img',
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