<%@page import="honjok.web.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="honjok.web.dao.MemberDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"></script>

<title>회원정보수정</title>
</head>
<style>
</style>




<body>
	

	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="col-sm-2"></div>
				<div class="col-sm-9">
					<h2 class="text-center">회원 정보 수정하기</h2>

					<form action="memberupdate.mem" method="post">

						<table class="table table-striped">
							<tr>
								<td>아이디</td>
								<td>{result.id}</td>

							</tr>
							<tr>

								<td>패스워드</td>
								<td><input type="password" id="pw" name="pw" class="form-control">
								</td>
							</tr>

							<tr>
								<td>전화</td>
								<td><input type=text id="phone" name="phone" class="form-control">
								</td>
							</tr>

							<tr>
								<td>이메일</td>
								<td><input type=text id="email" name="email" class="form-control">
								</td>
							</tr>


							<tr>
								<td>집주소</td>
								<td><input type=text id="zipcode" name="zipcode" class="form-control">
								<td><input type=text id="address" name="address" class=form-control">
								</td>
							</tr>






							<tr>
								<td colspan="2" class="text-center"><input type="submit"
									value="수정하기" class="btn btn-success">
									<button type="button" class="btn btn-warning"
										onclick="location.href='MemberList.jsp'">회원 정보 보기</button></td>
							</tr>

						</table>

					</form>
</body>
</html>