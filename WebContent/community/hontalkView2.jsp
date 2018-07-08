<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <%@ include file="../include/top.jsp" %>
    <link rel="stylesheet" type="text/css" href="communitycss/hontalkView.css">
	<script type="text/javascript" src="js/hontalkView.js"></script>
    <div id="demo" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="imges/혼톡메인.jpg" alt="Los Angeles" width="100%" height="700">
				<div class="carousel-caption">
					<p id="title">혼족들을 위한 커뮤니티, 혼톡</p>
				</div>
			</div>
		</div>
	</div>

	<div class="container2">
		<div id="free">
			<h5>
				<a href="boardView.freeb?cat=free" style="font-weight: bold;">&nbsp;자유게시판</a>
			</h5>

			<table class="table table-hover" id="first-table"
				style="width: 500px; table-layout: fixed; ">
				<thead class="thead">
					<tr>
						<th width="17%" style="text-align: center; color: #ffffff">글번호</th>
						<th width="64%" style="text-align: center; color: #ffffff">제목</th>
						<th width="17%" style="text-align: center; color: #ffffff">작성자</th>
						<th width="15%" style="text-align: center; color: #ffffff">추천</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="free" items="${free}" varStatus="status">
						<tr>
							<td class="td-contents" style="text-align: center;">${free.cat_seq}</td>
							<td class="td-contents"><a href="Board_Controller.freeb?no=${free.seq}&count=${free.viewcount}"
									class="no-uline">${free.title}</a></td>
							<%-- <td class="td-contents">${free.contents}</td> --%>
							<td class="td-contents" style="text-align: center;">${free.writer}</td>
							<td style="text-align: center;"><b>${free.like}</b></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

		</div>

		<div id="free2">
			<h5>
				<a href="boardView.freeb?cat=qna" style="font-weight: bold;">&nbsp;질문/답변</a>
			</h5>

			<table class="table table-hover" id="second-table"
				style="width: 500px; table-layout: fixed;">
				<thead class="thead">
					<tr>
						<th width="17%" style="text-align: center; color: #ffffff">글번호</th>
						<th width="64%" style="text-align: center; color: #ffffff">제목</th>
						<th width="17%" style="text-align: center; color: #ffffff">작성자</th>
						<th width="15%" style="text-align: center; color: #ffffff">추천</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="qna" items="${qna}" varStatus="status">
						<tr>
							<td class="td-contents" style="text-align: center;">${qna.cat_seq}</td>
							<td class="td-contents"><a href="Board_Controller.freeb?no=${qna.seq}&count=${qna.viewcount}"
									class="no-uline">${qna.title}</a></td>
							<%-- <td class="td-contents">${qna.contents}</td> --%>
							<td class="td-contents" style="text-align: center;">${qna.writer}</td>
							<td style="text-align: center;"><b>${qna.like}</b></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>

		<div id="free3">
			<h5>
				<a href="boardView.freeb?cat=best" style="font-weight: bold;">&nbsp;베스트</a>
			</h5>

			<table class="table table-hover" id="second-table"
				style="width: 400px; height: 300px; table-layout: fixed;">
				<thead class="thead">
					<tr>
						<th width="20%" style="text-align: center; color: #ffffff">추천</th>
						<th width="50%" style="text-align: center; color: #ffffff">제목</th>
						<th width="30%" style="text-align: center; color: #ffffff">작성자</th>
					</tr>
				</thead>
				
				<tbody>
					
					<c:forEach var="best" items="${best}" varStatus="status">
					<tr>
						<th scope="row" style="text-align: center;">${best.like}</th>
						<td class="td-contents2"><a href="Board_Controller.freeb?no=${best.seq}&count=${best.viewcount}"
									class="no-uline">${best.title}</a></td>
						<%-- <td class="td-contents2">${best.contents}</td> --%>
						<td class="td-contents2" style="text-align: center;">${best.writer}</td>
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>

		<div id="free4">
			<h5>
				<a href="boardView.freeb?cat=coun" style="font-weight: bold;">&nbsp;고민상담</a>
			</h5>

			<table class="table table-hover" id="second-table"
				style="width: 500px; table-layout: fixed;">
				<thead class="thead">
					<tr>
						<th width="17%" style="text-align: center; color: #ffffff">글번호</th>
						<th width="64%" style="text-align: center; color: #ffffff">제목</th>
						<th width="17%" style="text-align: center; color: #ffffff">작성자</th>
						<th width="15%" style="text-align: center; color: #ffffff">추천</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="counsel" items="${counsel}" varStatus="status">
						<tr>
							<td class="td-contents" style="text-align: center;">${counsel.cat_seq}</td>
							<td class="td-contents"><a href="Board_Controller.freeb?no=${counsel.seq}&count=${counsel.viewcount}"
									class="no-uline">${counsel.title}</a></td>
							<%-- <td class="td-contents">${counsel.contents}</td> --%>
							<td class="td-contents" style="text-align: center;">${counsel.writer}</td>
							<td style="text-align: center;"><b>${counsel.like}</b></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>

		<div id="free5">
			<h5>
				<a href="boardView.freeb?cat=tip" style="font-weight: bold;">&nbsp;&nbsp;혼팁</a>
			</h5>

			<table class="table table-hover" id="second-table"
				style="width: 500px; table-layout: fixed;">
				<thead class="thead">
					<tr>
						<th width="17%" style="text-align: center; color: #ffffff">글번호</th>
						<th width="64%" style="text-align: center; color: #ffffff">제목</th>
						<th width="17%" style="text-align: center; color: #ffffff">작성자</th>
						<th width="15%" style="text-align: center; color: #ffffff">추천</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="tip" items="${tip}" varStatus="status">
						<tr>
							<td class="td-contents" style="text-align: center;">${tip.cat_seq}</td>
							<td class="td-contents"><a href="Board_Controller.freeb?no=${tip.seq}&count=${tip.viewcount}"
									class="no-uline">${tip.title}</a></td>
							<%-- <td class="td-contents">${tip.contents}</td> --%>
							<td class="td-contents" style="text-align: center;">${tip.writer}</td>
							<td style="text-align: center;"><b>${tip.like}</b></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
		<%@ include file="../include/bottom.jsp"%>