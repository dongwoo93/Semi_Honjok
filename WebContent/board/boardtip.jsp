<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Meta Tags for Bootstrap 4 -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap 4 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="boardcss/boardtipcss.css" type="text/css">
<script>
	
</script>

</head>
<body>
	<div class="card-deck">
		<c:choose>
			<c:when test="${board.size() > 0}">
				<c:forEach var="tmp" items="${board}">
					<div class="col-sm-3" id="card1">
						<div class="card">
							<img class="card-img-top" src="files/${tmp.systemFileName}"
								alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">${tmp.title}</h5>
								<p class="card-text">${tmp.contents}</p>
								<p class="card-text">
									<small class="text-muted">${tmp.writedate}</small>
								</p>
							</div>
						</div>

					</div>
				</c:forEach>
			</c:when>
		</c:choose>

	</div>
	<div>${navi}</div>

</body>
</html>