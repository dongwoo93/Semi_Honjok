<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<title>Card Design</title>
	 <link href="https://fonts.googleapis.com/css?family=Abel" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="custom.css">
<style>
.main-section{
	margin-top:50px;
	font-family: 'Abel', sans-serif;
}
.card-header-first{
	margin-top:-40px;
	background: linear-gradient(-90deg, #BF019F, #F28A57); 
	box-shadow:1px 5px 15px #a2a2a2;
}
.card-section{
	box-shadow: 0 2px 5px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12);
}
.card-header-first span i,.card-section-third span i{
	padding:17px;
	margin:0px 10px;
	color:#fff;
	height:50px;
	width:50px;
	box-shadow:1px 6px 24px #d2d2d2;
	background: linear-gradient(-90deg,  #ED5B80,#BF019F); 
}
.card-header-first span i:hover,.card-section-third span i:hover{
	box-shadow:1px 1px 15px #000;
}
.card-header-second{
	box-shadow:1px 5px 15px #a2a2a2;
    margin:-25px -25px 0px -25px;
	background: linear-gradient(-90deg, #90E8FC, #0080FF); 
}
.card-header-third{
    margin-top:-25px;
	box-shadow:1px 5px 15px #a2a2a2;
	background: linear-gradient(-90deg, #F2635F, #F4D00C); 
}
.card-section-third span i{
	background: linear-gradient(-90deg, #F4D00C, #F2635F); 
}
.card-section:hover{
	box-shadow:1px 1px 20px #d2d2d2;
}


</style>
</head>
<body>
    <div class="container main-section">
		<div class="row">
			<div class="col-lg-12 text-center">
	            <div class="row">
	                <div class="col-lg-4 col-md-12 mb-4 card-main">
	                  	<div class="card-section border rounded p-3">
	                  		<div class="card-header-first card-header-first rounded pb-5">
		                      	<h2 class="card-header-title text-white pt-3">회원정보수정</h2>
		                      	<h5 class="mb-0 pb-4 pt-2 text-white">회원정보수정</h5>
		                      	<span><a href="#"><i class="fa fa-instagram rounded-circle" aria-hidden="true"></i></a></span>
		                      	<span><a href="#"><i class="fa fa-facebook rounded-circle" aria-hidden="true"></i></a></span>
		                      	<span><a href="#"><i class="fa fa-twitter rounded-circle" aria-hidden="true"></i></a></span>
	                  		</div>
	                    	<div class="card-body text-center">
	                      		<p class="card-text">Lorem ipsum dolor sit amet  veritatis sequi.Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi.</p>
	                    	</div>
	                  	</div>
	                </div>
	                <div class="col-lg-4 col-md-12 mb-4 card-main">
		                 <div class="card-section card-section-second border rounded ml-4 mr-4">
		                    <div class="card-header card-header-second rounded">
		                       <h2 class="card-header-title mb-3 mt-1 text-white">Developer</h2>
		                       <p class="mb-0 text-white"><i class="fa fa-calendar mr-2 text-white pb-3"></i>01-05-2018</p>
		                    </div>
		                    <div class="card-body text-center card-body-second">
		                      	<p class="card-text">Lorem ipsum dolor sit amet, Voluptatibus, ex minis recusandae. Facere modi sunt, quod quibusdam dignissimos neque rem nihil ratione est placeat vel, natus non quos laudantium veritatis sequi.Ut enim ad minima veniam, quis nostrum.</p>
		                      	<a href="http://nicesnippets.com" target="_blank" class="orange-text d-flex flex-row-reverse p-1">
		                        	<h5 class="waves-effect waves-light btn btn-primary text-white">Read more<i class="fa fa-angle-double-right ml-2"></i></h5>
		                      	</a>
		                    </div>
	                	</div>
	                </div>
	                <div class="col-lg-4 col-md-12 mb-4 card-main">
	                  	<div class="card-section card-section-third border rounded">
		                    <div class="card-header card-header-third rounded">
		                      	<h2 class="card-header-title mb-3 text-white">Management</h2>
		                      	<h5 class="card-header-subtitle mb-0 text-white pb-3">Deserve for her own card</h5>
		                    </div>
		                    <div class="card-body text-center mb-2">
			                     <p class="card-text">Lorem ipsum dolor sit amet, quod quibusdam dignissimos neque rem nihil ratione est placeat vel, natus non quos laudantium veritatis sequi.Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.</p>
			                     <hr>
			                    <span><a href="#"><i class="fa fa-instagram rounded-circle" aria-hidden="true"></i></a></span>
		                      	<span><a href="#"><i class="fa fa-facebook rounded-circle" aria-hidden="true"></i></a></span>
		                      	<span><a href="#"><i class="fa fa-twitter rounded-circle" aria-hidden="true"></i></a></span>
		                    </div>
	                  	</div>
	                </div>
	            </div>
			</div>
		</div>
	</div>
</body>
</html>