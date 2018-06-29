<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Meta Tags for Bootstrap 4 -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap 4 CSS -->
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="boardcss/boardtipcss.css" type="text/css">

</head>
<body>
	<div class="container-fluid">
		<div class="card-deck">
			<c:choose>
				<c:when test="${board.size() > 0}">
					<c:forEach var="tmp" items="${board}" varStatus="status">
						<div class="col-lg-3" id="card1">
							<div class="card">
								<a href="selectView.tip?seq=${tmp.seq}"><img
									class="card-img-top" src="files/${thumbnail[status.index].thum_sysFileName}"
									alt="Card image cap"></a><br>
								<div class="card-body">
									<h5 class="card-title">
										<a href="selectView.tip?seq=${tmp.seq}">${tmp.title}</a>
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
				<div class="col-lg-15" style="text-align:center; padding-top:40%;"><b>표시할 내용이 없습니다.</b></div>
				</div>
				</c:otherwise>
			</c:choose>

		</div>
		<br>
		<div class="row text-center">
        <div class="col-md-2" style="margin:auto">
          <ul class="pagination">
            ${navi}
          </ul>
        </div>
      </div>
		<%-- <ul class="pagination">${navi}</ul> --%>
	</div>
	<script>
		/*document.getElementById("${page}").style.fontWeight = "bold";
		document.getElementById("${page}").removeAttribute("href");*/
	</script>
</body>
</html>