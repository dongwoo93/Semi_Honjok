<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/top.jsp" %>
<link href="https://fonts.googleapis.com/css?family=Hi+Melody" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Caveat" rel="stylesheet">
<div class="span10 offset1" style="margin-top: 78px;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">내 정보</h3>
			</div>
			<div class="panel-body">
				<div class="row-fluid">
				<!-- 	<div class="span3" align=center>
						<i class="fa fa-child" style="font-size: 140px;"></i>

					</div> -->
					<div class="span6">
						<table
							style="margin-left: 120px; margin-top: 140px;">
							<tbody>
								<tr>
									<th>아이디</th>
									<td id="id" name="id">${result[0].id}</td>
								</tr>
								<tr>
									<th>이름</th>
									<td id="name" name="name" >${result[0].name}</td>
								</tr>
								<tr>
									<th>성별</th>
									<td id="gender" name="gender" >${result[0].gender}</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td id="phone" name="phone">${result[0].phone}</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td id="email" name="email">${result[0].email}</td>
								</tr>
								<tr>
									<th>우편번호</th>
									<td id="zipcode" name="zipcode">${result[0].zipcode}</td>
								</tr>
								<tr>
									<th>주소</th>
									<td id="address" name="address">${result[0].address}</td>
								</tr>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="panel-footer">
				<a href="memberupdate.mp">
				<button class="btn btn-outline-dark" type="button"
					data-toggle="tooltip" data-original-title="Edit this user">
					<i class="fa fa-pencil-square-o"></i> 회원정보수정
				</button>
				</a>
				
				<a href="mypage.jsp">
				<button class="btn btn-outline-dark" type="button"
					data-toggle="tooltip" data-original-title="Remove this user">
					<i class="fa fa-tasks"></i> 마이페이지
				</button>
				</a>

			</div>
		</div>
	</div>
	<link rel="stylesheet" href="css/myinfo.css">
	<%@ include file="../include/bottom.jsp"%>