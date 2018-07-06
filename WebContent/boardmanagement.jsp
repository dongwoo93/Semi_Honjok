<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<script type="text/javascript" src="js/boardmanagement.js"></script>
<div class="container">
	<table class="table table-hover">
		<thead class="head" id="head">
			<tr style="background-color: gray">
				<td id="check"><input type="checkbox" id="chk_all"
					name="chk_all"></td>
				<td id="category">게시판</td>
				<td id="title">제목</td>
				<td id="date">작성일</td>
				<td id="view">조회</td>
				<td id="like">추천</td>
			</tr>
		</thead>
		<c:choose>
			<c:when test="${result.size() > 0}">
				<c:forEach var="item" items="${result}">
					<tbody id="body_a">
						<tr>
							<td id="articlecheck"><input type="checkbox" class="chk"
								name="chk" id="chk" value="${item.seq}">
							<td id="category">${item.category}
							<td id="title"><a
								href="Board_Controller.freeb?no=${item.seq}&count=${item.viewcount}"
								class="no-uline">${item.title}</a>
							<td id="date">${item.writedate}
							<td id="view">${item.viewcount}
							<td id="like">${item.like}
						</tr>
					</tbody>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tbody id="body_b">
					<tr id="shit">
						<td id="nothing" colspan=7>표시할 내용이 없습니다.</td>
					</tr>
				</tbody>
			</c:otherwise>
		</c:choose>
	</table>
	<div id="bottom" align=center>${navi}</div>
	<div id="btn">
	<input type=button id="delete" value="삭제"></div>
</div>
<link rel="stylesheet" href="css/boardmanagement.css">
<%@ include file="../include/bottom.jsp"%>