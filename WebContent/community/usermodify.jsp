<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/top.jsp" %>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
    <script type="text/javascript" src="js/freeboardWrite.js"></script>
    <div class="container">
		<form action="fixcomplete.freeb" method="post" enctype="multipart/form-data">
			<div id="wrapper">
			<div id="head1">말머리</div>
				<div id="head2">
				<c:choose>
				<c:when test="${result.category eq 'free'}">
				<input type="hidden" name="hcat" value="free">
				<select name="header" id="header">
					<option value="잡담">잡담</option>
					<option value="유머">유머</option>
					<option value="동물">동물</option>
				</select>
				</c:when>
				<c:when test="${result.category eq 'tip'}">
				<input type="hidden" name="hcat" value="tip">
				<select name="header" id="header">
					<option value="생활">생활</option>
					<option value="레시피">레시피</option>
					<option value="맛집">맛집</option>
					<option value="여행">여행</option>
				</select>
				</c:when>
				<c:when test="${result.category eq 'coun'}">
				<input type="hidden" name="hcat" value="coun">
				<select name="header" id="header">
					<option value="취미">취미</option>
					<option value="게임">게임</option>
					<option value="이성">이성</option>
					<option value="인생">인생</option>
					<option value="친구">친구</option>
					<option value="컴플렉스">컴플렉스</option>
				</select>
				</c:when>
				<c:when test="${result.category eq 'qna'}">
				<input type="hidden" name="hcat" value="qna">
				<input type="hidden" name="header" value="질문">
				</c:when>
				</c:choose>
				</div>
			<div id="title">제목</div>
			<div id="titlediv"><input type="text" name="titlemodi" id="titleinput" value="${result.title}"></div>
			</div>
			<div id=summer>
			<textarea id="summernote" name="summernote">${result.contents}</textarea>
			</div>
			<div id=filediv>
			<input type="file" name="file0" id="file"><input type="hidden" id="plus"><br>
			</div>
			<input type="hidden" id="imgBackUp" name="contentsImg">
			<input type="hidden" id="hiddenseq" name="hiddenseq" value="${no}">
			<input type="hidden" id="hiddencount" name="hiddencount" value="${result.viewcount}">
			<div id="btmbtn">
				<button type="submit" class="btn btn-primary" id="writebt">수정</button>
				<button type="button" class="btn btn-danger" id="cancelbt">취소</button>
			</div>
		</form>
	</div>
	<link rel="stylesheet" href="communitycss/boardWrite.css">
	<%@ include file="../include/bottom.jsp"%>
