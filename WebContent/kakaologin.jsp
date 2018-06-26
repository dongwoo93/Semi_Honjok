<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Custom Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>



<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
 
  Kakao.init('7b5cebd6ff38bcc35f50a75797895963');    
 
  Kakao.Auth.login({ 
     success: function() { 
            // 로그인 성공시, API를 호출합니다. 
            Kakao.API.request({ 
                   url: '/v1/user/me', 
                   success: function(res) { 
                            
                         var id = JSON.stringify(res.id)
                         var email = JSON.stringify(res.kaccount_email) 
                         var name = JSON.stringify(res.properties.nickname) 
                              
                           
                          console.log(id+email+name); 
                       	  location.href="test.do?id="+id+"&email="+email+"&name="+name; 
                   }, 
                   fail: function(error) { 
                          console.log(JSON.stringify(error)); 
                   } 
            }); 
     }, 
     fail: function(err) { 
            console.log(JSON.stringify(err)); 
     } 
}); 
    
  	
  	
      
  
  
  //]]>
</script>

	



</body>
</html>