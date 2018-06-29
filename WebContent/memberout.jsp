<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

    <script type="text/javascript">
/*     $(document).ready(function() {
    $.function chk() {
            var req = document.form.req.checked;
            var num = 0;
            if (req == true) {
                num = 1;
            }
            if (num == 1) {
                document.form.submit();
            } else {
                alert("탈퇴약관에 동의하셔야 합니다.");
            }
        } */

        function nochk() {
            alert("동의하지 않으면 가입하실 수 없습니다");
            location.href = "hollo.com";
        }
    </script>




<style>
body {
	margin-top: 40px;
}

.stepwizard-step p {
	margin-top: 10px;
}

.stepwizard-row {
	display: table-row;
}

.stepwizard {
	display: table;
	width: 100%;
	position: relative;
}

.stepwizard-step button[disabled] {
	opacity: 1 !important;
	filter: alpha(opacity = 100) !important;
}

.stepwizard-row:before {
	top: 14px;
	bottom: 0;
	position: absolute;
	content: " ";
	width: 100%;
	height: 1px;
	background-color: #ccc;
	z-order: 0;
}

.stepwizard-step {
	display: table-cell;
	text-align: center;
	position: relative;
}

.btn-circle {
	width: 30px;
	height: 30px;
	text-align: center;
	padding: 6px 0;
	font-size: 12px;
	line-height: 1.428571429;
	border-radius: 15px;
}

b {
	font-size: 20px;
	font-family: 돋음;
	font-weight: bolder;
	color: #0BC904;
}

hr {
	border-color: #0BC904;
	border-width: 4px;
	padding-left: 160px;
	width: 1000px;
}
</style>
<script>
	
</script>
</head>
<body>
	<div class="container">
		<div class="stepwizard">
			<div class="stepwizard-row setup-panel">
				<div class="stepwizard-step">
					<a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
					<p>Step 1</p>
				</div>
				<div class="stepwizard-step">
					<a href="#step-2" type="button" class="btn btn-default btn-circle"
						disabled="disabled">2</a>
					<p>Step 2</p>
				</div>
				<div class="stepwizard-step">
					<a href="#step-3" type="button" class="btn btn-default btn-circle"
						disabled="disabled">3</a>
					<p>Step 3</p>
				</div>
			</div>
		</div>

		<form action="memberout.mem" method="post">
			<div class="row setup-content" id="step-1">
				<div class="col-xs-12">
					<div class="col-md-12">
						<h3>Hollo 회원탈퇴안내</h3>

						<tr>
							<td height="60%" align="center">
								<hr> <br>
								<p align="left">
									<span style="padding-left: 160px"> </span>
								</p> <br> <textarea rows="20" cols="150">
                   √ 회원 탈퇴 전 다음 사항을 꼭 확인하시기 바랍니다.
                                
                                
                                
                                
                    - 사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
                    
                    - 탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제 됩니다.
                                                 회원정보 및 게시글, 자료 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.
                                                 삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.
                    
                    - 탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다. 
                                               혼톡게시판 게시글, 댓글, 업로드파일등 올린 자료는 탈퇴시 자동 삭제되지 않고 그대로 남아 있습니다.
                                               삭제를 원하는 게시글이 있다면 반드시 탈퇴전 삭제하시거나 비공개 처리하시기 바랍니다.
                                                탈퇴후에는 회원정보가 삭제되며 본인 여부를 확인할 수 있는 방법이 없어, 게시글, 자료 등은 임의로 삭제해드릴 수 없습니다. 
                    
                    - Hollo 아이디를 사용해 다른 서비스에 로그인 할 수 없게됩니다. 
                    
                    - 탈퇴 후에는 사용하고 계신 아이디로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.    
                    
                    √ 탈퇴회원 회원정보 보존기간
                                                회원탈퇴가 완료되더라도 다음과 같이 회원정보가 일정기간 보존됨을 알려드립니다.
                    
                    - 관계법령에 의거하여 보존이 필요한 경우에 한하여 보존됩니다.
                          
                     </textarea>            
             <br> <br> <input type="checkbox" class="control-label" name="req"> 
                                 안내 사항을 모두 확인하였으며, 이에 동의합니다. <br>
								<hr>
							</td>
						</tr>

						<div class="form-group">
							<label class="control-label">
								<button class="btn btn-primary nextBtn btn-lg pull-right"
									type="button" id="button1" name="button1">Next</button>
							</label>
						</div>
					</div>
				</div>
			</div>

			<div class="row setup-content" id="step-2">
				<div class="col-xs-12">
					<div class="col-md-12">
						<h3>Step 2</h3>
						<div class="form-group">
							<label class="control-label">아이디</label> <input maxlength="50"
								type="text" id="id" name="id" required="required"
								class="form-control" placeholder="아이디를 입력해주세요">
						</div>
						<div class="form-group">
							<label class="control-label">패스워드</label> <input maxlength="50"
								type="password" id="id" name="id" required="required"
								class="form-control" placeholder="패스워드를 입력해주세요">
						</div>
						<button class="btn btn-primary nextBtn btn-lg pull-right"
							type="button" id="button2" name="button2">Next</button>
					</div>
				</div>
			</div>
			<div class="row setup-content" id="step-3">
				<div class="col-xs-12">
					<div class="col-md-12">
						<h3>Step 3</h3>
						<button class="btn btn-success btn-lg pull-right" type="submit">회원탈퇴</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>