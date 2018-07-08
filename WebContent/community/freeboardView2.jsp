<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    
<%@ include file="../include/top.jsp" %>
<script type="text/javascript" src="js/freeboardView.js"></script>
    <div class="container">
		<table class="table table-hover">
			<thead class="head" id="head">
				<tr>
					<td colspan=8>
					<c:choose>
					 <c:when test="${cat eq 'free'}">
					 <div class="headSelect">
					 <a href="boardView.freeb?cat=free" id="freeboard" name="freeboard">자유게시판</a>
					 <input id="hiddenCategory" type="hidden" value="free">
							<a href="boardView.freeb?cat=free"><button class="header" type="button" id="all">전체</button></a>
							<a href="boardView.freeb?cat=free&head=잡담"><button class="header" type="button" id="chat">잡담</button></a>
							<a href="boardView.freeb?cat=free&head=유머"><button class="header" type="button" id="humor">유머</button></a>
							<a href="boardView.freeb?cat=free&head=동물"><button class="header" type="button" id="beast">동물</button></a>
						</div>
					 </c:when>
					  <c:when test="${cat eq 'qna'}">
					  <div class="headSelect">
					  		<a href="boardView.freeb?cat=qna" id="qnaboard" name="qnaboard">Q & A</a>
					  		<input id="hiddenCategory" type="hidden" value="qna">
							<a href="boardView.freeb?cat=qna"><button class="header" type="button" id="all">전체</button></a>
						</div>
					  </c:when>
					   <c:when test="${cat eq 'tip'}">
					   <div class="headSelect">
					   		<a href="boardView.freeb?cat=tip" id="tipboard" name="tipboard">Tip</a>
					   		<input id="hiddenCategory" type="hidden" value="tip">
							<a href="boardView.freeb?cat=tip"><button class="header" type="button" id="all">전체</button></a>
							<a href="boardView.freeb?cat=tip&head=생활"><button class="header" type="button" id="living">생활</button></a>
							<a href="boardView.freeb?cat=tip&head=레시피"><button class="header" type="button" id="recipe">레시피</button></a>
							<a href="boardView.freeb?cat=tip&head=맛집"><button class="header" type="button" id="rest">맛집</button></a>
							<a href="boardView.freeb?cat=tip&head=여행"><button class="header" type="button" id="trip">여행</button></a>
						</div>
					   </c:when>
					    <c:when test="${cat eq 'coun'}">
					    <div class="headSelect">
					    	<a href="boardView.freeb?cat=coun" id="counboard" name="counboard">고민상담</a>
					    	<input id="hiddenCategory" type="hidden" value="coun">
							<a href="boardView.freeb?cat=coun"><button class="header" type="button" id="all">전체</button></a>
							<a href="boardView.freeb?cat=coun&head=취미"><button class="header" type="button" id="hobby">취미</button></a>
							<a href="boardView.freeb?cat=coun&head=게임"><button class="header" type="button" id="game">게임</button></a>
							<a href="boardView.freeb?cat=coun&head=이성"><button class="header" type="button" id="rela">이성</button></a>
							<a href="boardView.freeb?cat=coun&head=인생"><button class="header" type="button" id="life">인생</button></a>
							<a href="boardView.freeb?cat=coun&head=친구"><button class="header" type="button" id="friend">친구</button></a>
							<a href="boardView.freeb?cat=coun&head=컴플렉스"><button class="header" type="button" id="complex">컴플렉스</button></a>
						</div>
					    </c:when>
					    <c:when test="${cat eq 'best'}">
					    <a href="boardView.freeb?cat=best" id="bestboard" name="bestboard">베스트 게시판</a>
					    </c:when>
					</c:choose>
						
					</td>
				</tr>
				
				<c:choose>
				<c:when test="${sessionScope.loginId == 'admin'}">
				<c:choose>
				<c:when test="${cat eq 'best'}">
				<tr style="background-color:#1e73be; color: #ffffff;">
					<td id="check"><input type="checkbox" id="chk_all" name="chk_all"></td>
					<td id="no">No.</td>
					<td id="header"></td>
					<td id="title">제목</td>
					<td id="writer">작성자</td>
					<td id="date">작성일</td>
					<td id="view">조회</td>
					<td id="like">추천</td>
				</tr>
				</c:when>
				<c:otherwise>
				<tr style="background-color:#1e73be; color: #ffffff;">
					<td id="check"><input type="checkbox" id="chk_all" name="chk_all"></td>
					<td id="no">No.</td>
					<td id="header">말머리</td>
					<td id="title">제목</td>
					<td id="writer">작성자</td>
					<td id="date">작성일</td>
					<td id="view">조회</td>
					<td id="like">추천</td>
				</tr>
				</c:otherwise>
				</c:choose>
				
			<c:choose>
				<c:when test="${result2.size() > 0}">
					<c:forEach var="item2" items="${result2}">
					<tbody id="notice">
				<tr>
					<td id="noticecheck"><input type="checkbox" name="nocheck">
					<td id="noticeno">${item2.cat_seq}</td>
					<td id="noticeheader"><b>${item2.header}</b></td>
					<td id="noticetitle"><a href="Board_Controller.freeb?no=${item2.seq}&count=${item2.viewcount}" class="no-uline"><b>${item2.title}</b></a></td>
					<td id="noticewriter"><b>${item2.writer}</b></td>
					<td id="noticedate">${item2.writedate}</td>
					<td id="noticeview">${item2.viewcount}</td>
					<td id="noticelike">${item2.like}</td>
				</tr>
				</tbody>
				</c:forEach>
				</c:when>
			</c:choose>
				
			</thead>
			
			<c:choose>
				<c:when test="${result.size() > 0}">
					<c:forEach var="item" items="${result}">
						<tbody id="body_a">
							<tr>
								<td id="articlecheck"><input type="checkbox" class="chk" name="chk" id="chk" value="${item.seq}">
								<td id="no">${item.cat_seq}
								<td id="header">${item.header}
								<c:choose>
								<c:when test="${item.commentcount > 0}">
								<td id="title"><a
									href="Board_Controller.freeb?no=${item.seq}&count=${item.viewcount}"
									class="no-uline">${item.title} [${item.commentcount}]</a>
								</c:when>
								<c:otherwise>
								<td id="title"><a
									href="Board_Controller.freeb?no=${item.seq}&count=${item.viewcount}"
									class="no-uline">${item.title}</a>
								</c:otherwise>
								</c:choose>
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
							<td id="nothing" colspan=7>작성하신 글이 없습니다.</td>
						</tr>
					</tbody>
				</c:otherwise>
			</c:choose>
							
				</c:when>
				<c:otherwise>
				<c:choose>
				<c:when test="${cat eq 'best'}">
				<tr style="background-color:#1e73be; color:#ffffff; text-align: center;">
					<td id="no">No.</td>
					<td id="header"></td>
					<td id="title">제목</td>
					<td id="writer">작성자</td>
					<td id="date">작성일</td>
					<td id="view">조회</td>
					<td id="like">추천</td>
				</tr>
				</c:when>
				<c:otherwise>
				<tr style="background-color:#1e73be; color:#ffffff; text-align: center;">
					<td id="no">No.</td>
					<td id="header">말머리</td>
					<td id="title">제목</td>
					<td id="writer">작성자</td>
					<td id="date" style="text-align: center;">작성일</td>
					<td id="view" style="text-align: center;">조회</td>
					<td id="like">추천</td>
				</tr>
				</c:otherwise>
				</c:choose>
				
			<c:choose>
				<c:when test="${result2.size() > 0}">
					<c:forEach var="item2" items="${result2}">
					<tbody id="notice">
				<tr>
					<td id="noticeno" style="text-align: center;">${item2.seq}</td>
					<td id="noticeheader" style="text-align: center;"><b>${item2.header}</b></td>
					<td id="noticetitle"><a href="Board_Controller.freeb?no=${item2.seq}&count=${item2.viewcount}" class="no-uline"><b>${item2.title}</b></a></td>
					<td id="noticewriter"><b>${item2.writer}</b></td>
					<td id="noticedate" style="text-align: center;">${item2.writedate}</td>
					<td id="noticeview" style="text-align: center;">${item2.viewcount}</td>
					<td id="noticelike" style="text-align: center;">${item2.like}</td>
				</tr>
				</tbody>
				</c:forEach>
				</c:when>
			</c:choose>
				
			</thead>
			
			<c:choose>
				<c:when test="${result.size() > 0}">
					<c:forEach var="item" items="${result}">
						<tbody id="body_a">
							<tr>
								<td id="no" style="text-align: center;">${item.seq}
								<td id="header" style="text-align: center;">${item.header}
								<c:choose>
								<c:when test="${item.commentcount > 0}">
								<td id="title"><a
									href="Board_Controller.freeb?no=${item.seq}&count=${item.viewcount}"
									class="no-uline">${item.title} [${item.commentcount}]</a>
								</c:when>
								<c:otherwise>
								<td id="title"><a
									href="Board_Controller.freeb?no=${item.seq}&count=${item.viewcount}"
									class="no-uline">${item.title}</a>
								</c:otherwise>
								</c:choose>
								<td id="writer">${item.writer}
								<td id="date" style="text-align: center;">${item.writedate}
								<td id="view" style="text-align: center;">${item.viewcount}
								<td id="like" style="text-align: center;">${item.like}
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
				
				
				
				
				
				
				
				</c:otherwise>
				</c:choose>
				
				
		</table>
		
		<div id="bottom" align=center>${navi}</div> 
		<div id="btn" style="margin-top: 20px;">
			<form method=post action="search.freeb" id=formid>
			<input type="hidden" name="scat" value="${cat}">
			<c:if test="${cat ne 'best'}">
			<select name="select" id="select">
				<option value="title">제목</option>
				<option value="writer">작성자</option>
				<option value="content">내용</option>
			</select>
		<input type="search" id="search" name="search"><button type=button id="sbtn">검색</button>
			</c:if>
			<c:choose>
		<c:when test="${sessionScope.loginId == 'admin'}">
		<input type=button id="delete" value="삭제">
		<input type=button id="write" value="글 쓰기">
		</div>
		</c:when>
		<c:otherwise>
		<c:if test="${cat ne 'best'}">
		<input type=button id="write" value="글 쓰기"></div>
		</c:if>
		
		</c:otherwise>
		</c:choose>
		</form>
		
		

	</div>
	<script>
	$("#write").click(function() {
		if ('${id}' == 'nonmember') {
			$("#loginbt").trigger('click');
		}else {
			$(location).attr('href', "writecategory.freeb?cat=${cat}");
		}
		
	})
	</script>
	<link rel="stylesheet" href="communitycss/freeboard.css">
	<%@ include file="../include/bottom.jsp"%>