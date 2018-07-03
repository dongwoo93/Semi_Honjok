<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    
    <%@ include file="../include/top.jsp" %>
    <link rel="stylesheet" href="communitycss/freeboard.css">
<script type="text/javascript" src="js/freeboardView.js"></script>
    <div class="container">
		<table class="table table-hover">
			<thead class="head" id="head">
				<tr>
					<td colspan=7>
					<c:choose>
					 <c:when test="${cat eq 'free'}">
					 <div class="headSelect">
							<a href="boardView.freeb?cat=free"><button class="header" type="button" id="all">전체</button></a>
							<a href="boardView.freeb?cat=free&head=잡담"><button class="header" type="button" id="chat">잡담</button></a>
							<a href="boardView.freeb?cat=free&head=유머"><button class="header" type="button" id="humor">유머</button></a>
							<a href="boardView.freeb?cat=free&head=동물"><button class="header" type="button" id="beast">동물</button></a>
						</div>
					 </c:when>
					  <c:when test="${cat eq 'qna'}">
					  <div class="headSelect">
							<a href="boardView.freeb?cat=qna"><button class="header" type="button" id="all">전체</button></a>
						</div>
					  </c:when>
					   <c:when test="${cat eq 'tip'}">
					   <div class="headSelect">
							<a href="boardView.freeb?cat=tip"><button class="header" type="button" id="all">전체</button></a>
							<a href="boardView.freeb?cat=tip&head=생활"><button class="header" type="button" id="chat">생활</button></a>
							<a href="boardView.freeb?cat=tip&head=레시피"><button class="header" type="button" id="humor">레시피</button></a>
							<a href="boardView.freeb?cat=tip&head=맛집"><button class="header" type="button" id="beast">맛집</button></a>
							<a href="boardView.freeb?cat=tip&head=여행"><button class="header" type="button" id="beast">여행</button></a>
						</div>
					   </c:when>
					    <c:when test="${cat eq 'coun'}">
					    <div class="headSelect">
							<a href="boardView.freeb?cat=coun"><button class="header" type="button" id="all">전체</button></a>
							<a href="boardView.freeb?cat=coun&head=취미"><button class="header" type="button" id="chat">취미</button></a>
							<a href="boardView.freeb?cat=coun&head=게임"><button class="header" type="button" id="humor">게임</button></a>
							<a href="boardView.freeb?cat=coun&head=이성"><button class="header" type="button" id="beast">이성</button></a>
							<a href="boardView.freeb?cat=coun&head=인생"><button class="header" type="button" id="beast">인생</button></a>
							<a href="boardView.freeb?cat=coun&head=친구"><button class="header" type="button" id="beast">친구</button></a>
							<a href="boardView.freeb?cat=coun&head=컴플렉스"><button class="header" type="button" id="beast">컴플렉스</button></a>
						</div>
					    </c:when>
					</c:choose>
						
					</td>
				</tr>
				<tr>
					<td id="no">No.</td>
					<td id="header">말머리</td>
					<td id="title">제목</td>
					<td id="writer">작성자</td>
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
								<td id="no">${item.seq}
								<td id="header">${item.header}
								<td id="title"><a
									href="Board_Controller.freeb?no=${item.seq}&count=${item.viewcount}"
									class="no-uline">${item.title}</a>
								<td id="writer">${item.writer}
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
		<div id="bottom" align=center>
			${navi}</div> <div id="btn"><input type=button id="write" value="글 쓰기">
		</div>
	</div>
	<%@ include file="../include/bottom.jsp"%>