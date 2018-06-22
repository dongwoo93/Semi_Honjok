<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style>
/* Make the image fully responsive */
.carousel-inner img {
	width: 100%;
	height: 700px;
}

.card-deck {

	margin: 0 350px 80px 250px;
}

.card {
	width: 300px;
	height: 300px;
}

.col-sm-2 {
	margin: auto;
}


</style>
</head>
<body>
	<div id="demo" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="la.jpg" alt="Los Angeles" width="1200" height="700">
				<div class="carousel-caption">
					<h3>Los Angeles</h3>
					<p>We had such a great time in LA!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="chicago.jpg" alt="Chicago" width="1200" height="700">
				<div class="carousel-caption">
					<h3>Chicago</h3>
					<p>Thank you, Chicago!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="ny.jpg" alt="New York" width="1200" height="700">
				<div class="carousel-caption">
					<h3>New York</h3>
					<p>We love the Big Apple!</p>
				</div>
			</div>
		</div>
	</div>
	<div><h1 style="margin-top: 30px; margin-left: 330px; margin-bottom: 20px">Latest Contents</h1>
	<div class="card-deck">
		<div class="col-sm-2" id="card1">
			<div class="card">
				<img class="card-img-top" src="fjords.jpg" alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-2" id="card1">
			<div class="card">
				<img class="card-img-top" src="fjords.jpg" alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-2" id="card1">
			<div class="card">
				<img class="card-img-top" src="fjords.jpg" alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-2" id="card1">
			<div class="card">
				<img class="card-img-top" src="fjords.jpg" alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="card-deck">
		<div class="col-sm-2" id="card1">
			<div class="card">
				<img class="card-img-top" src="fjords.jpg" alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-2" id="card1">
			<div class="card">
				<img class="card-img-top" src="fjords.jpg" alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-2" id="card1">
			<div class="card">
				<img class="card-img-top" src="fjords.jpg" alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-2" id="card1">
			<div class="card">
				<img class="card-img-top" src="fjords.jpg" alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>