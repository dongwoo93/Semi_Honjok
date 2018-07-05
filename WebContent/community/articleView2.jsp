<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/top.jsp" %>
    <script>
var num = 1;

	$(document).ready(function() {
		$("#confirm").click(function() {
			$("#formid").submit();
		})
		
						$("#fix").click(function() {
							$(location).attr('href', "fix.freeb?no=${no}")
						})
						$("#delete").click(function(){
							var yes = confirm("삭제 하시겠습니까?");
							if (yes) {
							$(location).attr('href',"delete.freeb?no=${no}&cat=${result[0].category}")
							} else {
							return;
							}
						})
						$("#tolist").click(function(){
							$(location).attr('href',"boardView.freeb?cat=${result[0].category}")
							})
										
						$("#fix2").click(function() {
							$(location).attr('href', "fix.freeb?no=${no}")
						})
						$("#delete2").click(function(){
							var yes = confirm("삭제 하시겠습니까?");
							if (yes) {
							$(location).attr('href',"delete.freeb?no=${no}&cat=${result[0].category}")
							} else {
							return;
							}
						})
						$("#tolist2").click(function(){
							$(location).attr('href',"boardView.freeb?cat=${result[0].category}")
						})
						
						/* $("#comodify").click(function(){
							$(location).attr('href',"comodify.freeb?")
						})*/
						$("#codelete").click(function(){
							$(location).attr('href',"codelete.freeb?")
						})

						$("#like").click(function() {
							if ('${id}' == 'nonmember') {
								$("#loginbt").trigger('click');
							} else {
								$.ajax({
									url : "like.com",
									type : "get",
									data : {
										boardno : "${no}",
										memberid : "${id}",
										likecount : "${result[0].like}"
									},
									success : function(resp) {
										$("#likecancel").show();
										$("#like").hide();
										$("#likespan").text(resp);
									},
									error : function() {
										console.log("에러 발생!");
									}
								})
							}

						})
						$("#likecancel").click(function() {
							$.ajax({
								url : "like.com",
								type : "get",
								data : {
									boardno : "${no}",
									memberid : "${id}",
									likecount : "${result[0].like}"
								},
								success : function(resp) {
									$("#like").show();
									$("#likecancel").hide();
									$("#likespan").text(resp);
								},
								error : function() {
									console.log("에러 발생!");
								}
							})
						})
					})
</script>
<div style="height: 100px"></div>
	<div class="container">
		<form method=post action="comment.freeb" id=formid>
			<table class="table">
				<tbody class="head" id="head">
					<tr>
						<td width=100px>제목<input type="hidden" id="seq1" name="seq"
							value="${result[0].seq}"></td>
						<th colspan=2>[${result[0].header}]${result[0].title}</th>
						<td width=180px><b id="date">${result[0].writedate}</b></td>

					</tr>
					<tr>
						<td width=100px height=20px>글쓴이</td>
						<th colspan=3>${result[0].writer}</th>
					</tr>
					<tr>
         
        
        <c:if test="${file.size() > 0}">
        <td>첨부파일
        ${file.size()}개 </td>
        <td colspan="3">
 
        <c:forEach var="tmp" items="${file}">
        <a href="DownloadController?fileName=${tmp.file_system_name}">${tmp.file_original_name}</a>
          <br>
        </c:forEach>
        </c:if>
        </td>
        </tr>
					<tr>
						<td colspan=4 height=400px>${result[0].contents}</td>
					</tr>
					<tr>
						<td align=center colspan=4><c:choose>
								<c:when test="${likeStat == 0}">
									<button type=button id=like>
										<img src="kejang/good.jpg">
									</button>
									<button type=button id=likecancel style="display: none">
										<img src="kejang/no.png">
									</button>
									<!-- <button type="button" id=like>좋아요</button>
									<button type="button" id=likecancel style="display: none">좋아요
										취소</button> -->
									<span id=likespan>${result[0].like}</span>
								</c:when>
								<c:otherwise>
									<button type=button id=likecancel>
										<img src="kejang/no.png">
									</button>
									<button type=button id=like style="display: none">
										<img src="kejang/good.jpg">
									</button>
									<!-- <button type="button" id=likecancel>좋아요 취소</button>
									<button type="button" id=like style="display: none">좋아요</button> -->
									<span id=likespan>${result[0].like}</span>
								</c:otherwise>
							</c:choose></td>
					</tr>
					<tr>
						<td width=100px height=20px>작성자IP</td>
						<th colspan=3>${result[0].ip}</th>
					</tr>
					<c:choose>
					<c:when test="${sessionScope.loginId!=null}">
					<tr align=right>
						<td colspan=4 height=20px align=right>
						<input type="hidden" name="hiddenheader" value="${result[0].header}">
							<button type="button" id=fix>수정</button>
							<button type="button" id=delete>삭제</button>
							<button type="button" id=tolist>목록</button>
						</td>
					</tr>
					</c:when>
					<c:otherwise>
					<tr align=right>
					<td colspan=4 height=20px><button type="button" id=tolist>목록</button></td>
					</tr>
					</c:otherwise>
					</c:choose>
					

					<c:choose>
						<c:when test="${result2.size() > 0}">
							<c:forEach var="result2" items="${result2}">
								<tr>
								
									<td width=100px height=20px>${result2.comment_writer}</td>
									<td>${result2.comment_content}</td>
									<td id="delbtn" width=180px><b id="date">${result2.comment_wridate}</b>
									<%-- <c:when test="${sessionScope.loginId==id}"> --%>
									<script>
                 	 				$("#delbtn:last-child").after("<td align=center><button id="+num+" type=button><b>X</b></button></td>");
                  					</script>
                  					<%-- </c:when> --%>
									</td>
		
								</tr>
								<script>
                  document.getElementById(num).onclick = function() {
                     location.href = "delete_comment.freeb?comSeq=${result2.comment_seq}&no=${result[0].seq}&count=${result[0].viewcount}";
                  }
                  num++;
            </script>
							</c:forEach>
						</c:when>
					</c:choose>
					<tr>
						<th width=80px height=40px>${sessionScope.loginId}</th>

						<input type="hidden" id="viewcount" name=count value="${count}">
						<input type="hidden" id="seq" name=no value="${result[0].seq}">
						<td colspan=2><textarea id="comment" name=comment
									placeholder="바른말 고운말을 사용하여 미연에 고소를 방지합시다." cols="110" rows="2"></textarea></td>
							<td align=center><input type="button" value="확인" id="confirm"></td>

						
						
					</tr>
					<c:choose>
					<c:when test="${sessionScope.loginId!=null}">
					<tr align=right>
						<td colspan=4 height=20px align=right>
						<input type="hidden" name="hiddenheader" value="${result[0].header}">
							<button type="button" id=fix2>수정</button>
							<button type="button" id=delete2>삭제</button>
							<button type="button" id=tolist2>목록</button>
						</td>
					</tr>
					</c:when>
					<c:otherwise>
					<tr align=right>
					<td colspan=4 height=20px><button type="button" id=tolist2>목록</button></td>
					</tr>
					</c:otherwise>
					</c:choose>

				</tbody>
			</table>

		</form>
	</div>
<link rel="stylesheet" href="communitycss/articleView.css">
<%@ include file="../include/bottom.jsp"%>