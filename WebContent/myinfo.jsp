<%@page import="honjok.web.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="honjok.web.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="UTF-8">
<title>내정보</title>
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/4.1.0/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.panel {
	background-color: #FFFFFF;
	border: 1px solid rgba(0, 0, 0, 0);
	border-radius: 5px 5px 5px 5px;
	box-shadow: 0 1px 1px margin-bottom: 20px;
}

.panel-primary {
	border-color: #dde7e7;
}

.panel-primary>.panel-heading {
	background-color: #803232;
	border-color: #803232;
	color: #FFFFFF;
}

.panel-heading {
	border-bottom: 1px border-top-left-radius: 3px;
	border-top-right-radius: 3px;
	padding: 10px 15px;
	max-width: 800px;
	margin: 50px auto;
}

.panel-title {
	font-size: 25px;
	margin-bottom: 0;
	margin-top: 0;
}

.panel-body {
	padding: 15px;
	max-width: 800px;
	margin: 50px auto;
}

.panel-footer {
	background-color: #F5F5F5;
	border-top: 1px solid #DDDDDD;
	padding: 20px 14px;
	max-width: 800px;
	margin: 50px auto;
}

.user-row:last-child {
	margin-bottom: 0;
}

/* .dropdown-user {
	margin: 13px 0;
	padding: 5px;
	height: 100%;
} */

.dropdown-user:hover {
	cursor: pointer;
}

 .table-user-information>tbody>tr {
	border-top: 1px solid rgb(221, 221, 221);
}

/* .table-user-information>tbody>tr:first-child {
	border-top: 0;
}

.table-user-information>tbody>tr>td {
	border-top: 0;
} */

.
/* span6:stongid {
	font-size: 16px;
} */
</style>
</head>

<body>

	<div class="span10 offset1">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">내 정보</h3>
			</div>
			<div class="panel-body">
				<div class="row-fluid">
					<div class="span3" align=center>
						<i class="fa fa-child" style="font-size: 140px;"></i>

					</div>
					<div class="span6">
						<strong id="id" name="id">${result[0].id}</strong><br
							data-brackets-id='3872'>
						<table
							class="table table-condensed table-responsive table-user-information">
							<tbody>
								<tr>
									<td>이름</td>
									<td id="name" name="name">${result[0].name}</td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td id="phone" name="phone">${result[0].phone}</td>
								</tr>
								<tr>
									<td>이메일</td>
									<td id="email" name="email">${result[0].email}</td>
								</tr>
								<tr>
									<td>주소</td>
									<td id="zipcod" name="zipcode">${result[0].zipcode}</td>
									<td id="address" name="address">${result[0].address}</td>
								</tr>
								<tr>
									<td>성별</td>
									<td id="gender" name="gender">${result[0].gender}</td>

								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="panel-footer">

				<button class="btn btn-outline-dark" type="button"
					data-toggle="tooltip" data-original-title="Edit this user">
					<i class="fa fa-pencil-square-o"></i> 회원정보수정
				</button>
				<button class="btn btn-outline-dark" type="button"
					data-toggle="tooltip" data-original-title="Remove this user">
					<i class="fa fa-tasks"></i> 마이페이지
				</button>

			</div>
		</div>
	</div>



</body>

</html>