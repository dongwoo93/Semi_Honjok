<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../include/top.jsp"%>


<div class="container-fluid">
	<div class="card-deck">
		<c:choose>
			<c:when test="${board.size() > 0}">
				<c:forEach var="tmp" items="${board}" varStatus="status">
					<div class="col-md-3" id="card1">
						<div class="card">
							<a
								href="selectView.tip?seq=${tmp.seq}&viewcount=${tmp.viewcount}"><img
								class="card-img-top"
								src="files/${thumbnail[status.index].thum_sysFileName}"
								alt="Card image cap"></a><br>
							<div class="card-body">
								<h5 class="card-title">
									<a
										href="selectView.tip?seq=${tmp.seq}&viewcount=${tmp.viewcount}">${tmp.title}</a>
								</h5>
								<br>
								<%-- <p class="card-text">${tmp.contents}</p> --%>
								<p class="card-text" style="text-align: right;">
									<small class="text-muted">${tmp.writedate}</small>
								</p>
							</div>
						</div>

					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="container">
					<div class="col-lg-15"
						style="text-align: center; padding-top: 40%;">
						<b>표시할 내용이 없습니다.</b>
					</div>
				</div>
			</c:otherwise>
		</c:choose>

	</div>
	<br>
	<div class="row text-center">
		<div class="col-md-1" style="margin: auto">
			<ul class="pagination">${navi}
			</ul>
		</div>
		<c:choose>
			<c:when test="${sessionScope.loginId == 'admin'}">
				<span class="col-md-1">
					<button type="button" class="btn btn-outline-success" id="writebt">글쓰기</button>
				</span>
			</c:when>
		</c:choose>
	</div>
</div>
<script>
	$("#writebt").click(function(){
		$(location).attr('href','board/boardtipWrite.jsp');
	})
</script>
<link rel="stylesheet" href="boardcss/boardtipcss.css" type="text/css">
<%@ include file="../include/bottom.jsp"%>