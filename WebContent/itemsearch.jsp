<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
$(document).ready(function() {
	$("#search").click(function() {
		$("#itemresult").remove();
		var keyword = $("#keyword").val();
		$.ajax({
			url:"ShoppingController",
			type:"get",
			data:{keyword:keyword},
			success:function(resp) {
				for(var i = 0; i < resp.length;i++) {
					var title = resp[i].title;
					var link = resp[i].link;
					var image = resp[i].image;
					var lprice = resp[i].lprice;
					var hprice = resp[i].hprice;
					var mallName = resp[i].mallName
					var line = $("<tr id=itemresult><td>" + title + "<td><a target=_blank href="+link+">이동하기</a><td id=img><img src="+image+"><td>" + lprice + "<td>" + hprice + "<td>" + mallName + "</tr>");
					$("#item").after(line);
				}
			},
			error : function() {
				console.log("에러 발생!");
			}
		})
	})
})
</script>
<style>
table {
width: 1200px;
}
img {
width: 400px;
height: 400px;
}
#img {
width: 500px;
height: 500px;
}
</style>
</head>
<body>

<div><input id="keyword" type="text"><button id="search">검색</button></div>
<table border="1">
		<tr id="title">
			<th colspan="6">쇼핑몰검색</th>
		</tr>
		<tr id="item">
			<th>상품명</th>
			<th>링크</th>
			<th>이미지</th>
			<th>최저가</th>
			<th>최고가</th>
			<th>쇼핑몰</th>
		</tr>
</table>
</body>
</html>