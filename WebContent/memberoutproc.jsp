<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴경고창</title>
<script>
if (${result>0}) {
	alert("그동안 Hollo사이트를 이용해주셔서 감사합니다. 회원탈퇴되었습니다.")
	location.href="hollo.com";
} else {
    alert("다시확인해주세요.");
    location.href="memberout.jsp";
}

</script>

</head>
<body>


</body>
</html>