<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forEach var="item" items="${result}">
		<div class="container">
			<div class="col-sm-3">${item.title}</div>
			<div>-------------------------------------------------------------------------------</div>
			<div class="col-lg-9">${item.contents}</div>
			<div>-------------------------------------------------------------------------------</div>
			<span class="cos-sm-2">${item.like}</span> <span class="cos-sm-2">${item.viewcount}</span>
			<span class="cos-sm-2">${item.writedate}</span>
		</div>
	</c:forEach>


</body>
</html>