<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<script>
	$(document)
			.ready(
					function() {
						var panels = $('.user-infos');
						var panelsButton = $('.dropdown-user');
						panels.hide();

						//Click dropdown
						panelsButton
								.click(function() {
									//get data-for attribute
									var dataFor = $(this).attr('data-for');
									var idFor = $(dataFor);

									//current button
									var currentButton = $(this);
									idFor
											.slideToggle(
													400,
													function() {
														//Completed slidetoggle
														if (idFor
																.is(':visible')) {
															currentButton
																	.html('<i class="icon-chevron-up text-muted"></i>');
														} else {
															currentButton
																	.html('<i class="icon-chevron-down text-muted"></i>');
														}
													})
								});

						$('[data-toggle="tooltip"]').tooltip();

						$('button').click(function(e) {
							e.preventDefault();
							alert("This is a demo.\n :-)");
						});
					});
</script>



<style>
.panel {
	background-color: #FFFFFF;
	border: 1px solid rgba(0, 0, 0, 0);
	border-radius: 5px 5px 5px 5px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
	margin-bottom: 20px;
}

.panel-primary {
	border-color: #428BCA;
}

.panel-primary>.panel-heading {
	background-color: #428BCA;
	border-color: #428BCA;
	color: #FFFFFF;
}

.panel-heading {
	border-bottom: 1px solid rgba(0, 0, 0, 0);
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
	padding: 10px 15px;
}

.panel-title {
	font-size: 20px;
	margin-bottom: 0;
	margin-top: 0;
}

.panel-body:before, .panel-body:after {
	content: " ";
	display: table;
}

.panel-body:before, .panel-body:after {
	content: " ";
	display: table;
}

.panel-body:after {
	clear: both;
}

.panel-body {
	padding: 15px;
}

.panel-footer {
	background-color: #F5F5F5;
	border-bottom-left-radius: 3px;
	border-bottom-right-radius: 3px;
	border-top: 1px solid #DDDDDD;
	padding: 10px 15px;
}

//
CSS from v3 snipp
        .user-row {
	margin-bottom: 14px;
}

.user-row:last-child {
	margin-bottom: 0;
}

.dropdown-user {
	margin: 13px 0;
	padding: 5px;
	height: 100%;
}

.dropdown-user:hover {
	cursor: pointer;
}

.table-user-information>tbody>tr {
	border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information>tbody>tr:first-child {
	border-top: 0;
}

.table-user-information>tbody>tr>td {
	border-top: 0;
}
</style>
</head>

<body>

	<br>
	<br>
	<div class="container">
		<div class="well span8 offset2">
			<div class="row-fluid user-row">
				<div class="span1">
					<i class="fa-id-card-o"></i>
				</div>
				<div class="span10">
					<strong id="id" name="id">in님!</strong><br> <span
						class="text-muted">회원님반갑습니다 : )</span>
				</div>
				<div class="span1 dropdown-user" data-for=".cyruxx">
					<i class="icon-chevron-down text-muted"></i>
				</div>
			</div>
			<div class="row-fluid user-infos cyruxx">
				<div class="span10 offset1">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">내 정보</h3>
						</div>
						<div class="panel-body">
							<div class="row-fluid">
								<div class="span3">
									<i class="fa fa-child" style="font-size: 140px;"></i>

								</div>
								<div class="span6">
									<strong id="id" name="id">id</strong><br>
									<table
										class="table table-condensed table-responsive table-user-information">
										<tbody>
											<tr>
												<td>이름:</td>
												<td id="name" name="name">Administrator</td>
											</tr>
											<tr>
												<td>전화번호:</td>
												<td id="phone" name="phone">01000001234</td>
											</tr>
											<tr>
												<td>이메일</td>
												<td id="email" name="email">____@______</td>
											</tr>
											<tr>
												<td>주소</td>
												<td id="address" name="address">인천</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="panel-footer">
							<button class="btn  btn-primary" type="button"
								data-toggle="tooltip" data-original-title="Send message to user">
								<i class="icon-envelope icon-white"></i>
							</button>
							<span class="pull-right">
								<button class="btn btn-warning" type="button"
									data-toggle="tooltip" data-original-title="Edit this user">
									<i class="icon-edit icon-white"></i>
								</button>
								<button class="btn btn-danger" type="button"
									data-toggle="tooltip" data-original-title="Remove this user">
									<i class="icon-remove icon-white"></i>
								</button>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>

</html>