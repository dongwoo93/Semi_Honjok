<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <%@ include file="../include/top.jsp" %>
    <link rel="stylesheet" type="text/css" href="communitycss/hontalkView.css">
	<script type="text/javascript" src="js/hontalkView.js"></script>
    <div id="demo" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="imges/sky.jpg" alt="Los Angeles" width="1200" height="700">
				<div class="carousel-caption">
					<h3>Los Angeles</h3>
					<p>We had such a great time in LA!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="imges/nature-3042751_1280.jpg" alt="Chicago" width="1200"
					height="700">
				<div class="carousel-caption">
					<h3>Chicago</h3>
					<p>Thank you, Chicago!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="imges/hiker-1149898_1280.jpg" alt="New York" width="1200"
					height="700">
				<div class="carousel-caption">
					<h3>New York</h3>
					<p>We love the Big Apple!</p>
				</div>
			</div>
		</div>
	</div>

	<div class="container2">
		<div id="free">
			<h5>
				<a href="boardView.freeb?cat=free">자유게시판</a>
			</h5>

			<table class="table table-hover" id="first-table"
				style="width: 500px; table-layout: fixed;">
				<thead class="thead-dark">
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="free" items="${free}" varStatus="status">
						<tr>
							<td class="td-contents">${free.seq}</td>
							<td class="td-contents">${free.title}</td>
							<td class="td-contents">${free.contents}</td>
							<td class="td-contents">${free.writer}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

		</div>

		<div id="free2">
			<h5>
				<a href="boardView.freeb?cat=qna">질문/답변</a>
			</h5>

			<table class="table table-hover" id="second-table"
				style="width: 500px; table-layout: fixed;">
				<thead class="thead-dark">
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="qna" items="${qna}" varStatus="status">
						<tr>
							<td class="td-contents">${qna.seq}</td>
							<td class="td-contents">${qna.title}</td>
							<td class="td-contents">${qna.contents}</td>
							<td class="td-contents">${qna.writer}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>

		<div id="free3">
			<h5>
				<a href="#">베스트</a>
			</h5>

			<table class="table table-hover" id="second-table"
				style="width: 350px; height: 300px; table-layout: fixed;">
				<thead class="thead-dark">
					<tr>
						<th>좋아요 수</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
					</tr>
				</thead>
				
				<tbody>
					
					<c:forEach var="best" items="${best}" varStatus="status">
					<tr>
						<th scope="row">${best.like}</th>
						<td class="td-contents2"><a href="#">${best.title}</a></td>
						<td class="td-contents2">${best.contents}</td>
						<td class="td-contents2">${best.writer}</td>
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>

		<div id="free4">
			<h5>
				<a href="boardView.freeb?cat=coun">고민상담</a>
			</h5>

			<table class="table table-hover" id="second-table"
				style="width: 500px; table-layout: fixed;">
				<thead class="thead-dark">
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="counsel" items="${counsel}" varStatus="status">
						<tr>
							<td class="td-contents">${counsel.seq}</td>
							<td class="td-contents">${counsel.title}</td>
							<td class="td-contents">${counsel.contents}</td>
							<td class="td-contents">${counsel.writer}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>

		<div id="free5">
			<h5>
				<a href="boardView.freeb?cat=tip">혼팁</a>
			</h5>

			<table class="table table-hover" id="second-table"
				style="width: 500px; table-layout: fixed;">
				<thead class="thead-dark">
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="tip" items="${tip}" varStatus="status">
						<tr>
							<td class="td-contents">${tip.seq}</td>
							<td class="td-contents">${tip.title}</td>
							<td class="td-contents">${tip.contents}</td>
							<td class="td-contents">${tip.writer}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
		<%@ include file="../include/bottom.jsp"%>