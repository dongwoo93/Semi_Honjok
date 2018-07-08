<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오류</title>
</head>
<body>
잘 못된 접근입니다.
	<br> 3초 후 자동으로 로그인 페이지로 이동합니다.
	<script>
		setTimeout(function() {
			location.href = "hollo.com";
		}, 3000);
		/* 3초 후에 실행 하겠다 */
	</script>
</body>
</html>