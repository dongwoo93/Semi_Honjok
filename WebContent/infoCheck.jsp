<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/parallax.js/1.3.1/parallax.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<style>
.input-group {
    margin-top: 1em;
    margin-bottom: 1em;
} 
#btdiv{
	margin-top: 20px;
	width: 100%;
	height: 30px;
	padding-left:81%;
}
.login-box {
    line-height: 2.3em;
    font-size: 1em;
    color: #aaa;
    margin-top: 1em;
    margin-bottom: 1em;
    padding-top: 0.5em;
    padding-bottom: 0.5em;
}
</style>
<script>
$(function() {
    // 로그인 처리
    $('#login-submit').click(function(e) {
        e.preventDefault();
        if ($("#userid").val() == '') {
            alert('아이디를 입력하세요');
            $("#userid").focus();
            return false;
        }

        if ($("#password").val() == '') {
            alert('비밀번호를 입력하세요');
            $("#password").focus();
            return false;
        }

        $.ajax({
            url : 'idpwChk.do',
            type : 'POST',
            data : {
                id : $('#userid').val(),
                pw : $('#password').val()
            },
            dataType : "json",
            success : function(response) {
                if (response.result == true) {
                    //alert('로그인 성공');
                    window.opener.location.href="memberupdate.mp";
                    //opener.location.href("memberupdate.mp");
                    window.close();
                    //location.reload(); // 화면 갱신
                } else if (response.result == false) {
                    alert('아이디와 비밀번호를 확인해주세요');
                } else {
                    alert('로그인 실패');
                }
            },
            error : function(jqXHR, textStatus, errorThrown) {
                alert("arjax error : " + textStatus + "\n" + errorThrown);
            }
        });
    });
    
});

</script>
</head>
<body>
	<div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div class="login-box well">
                        <form accept-charset="UTF-8" method="post" action="">
                            <h4>회원정보 확인</h4>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" id="userid" placeholder="아이디를 입력하세요" class="form-control" style="margin-left: 5px;"/>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                <input type="password" id="password" placeholder="비밀번호를 입력하세요" class="form-control" style="margin-left: 8px;"/>
                            </div>
                            <div class="col-md-13" id="btdiv">
                            <button type="submit" id="login-submit" class="btn btn-default btn-block" >확인</button>
							</div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

</body>
</html>