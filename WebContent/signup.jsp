<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://fonts.googleapis.com/css?family=Roboto|Courgette|Pacifico:400,700"
	rel="stylesheet">
<title>Bootstrap Start Free Trail Sign up Form</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>





<script src="http://code.jquery.com/jquery-1.3.2.min.js"></script>
<!-- jQuery.validate 플러그인 삽입 -->
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>
<script type="text/javascript">
                   
      $(document).ready(function () {    
    	  $("#id").keyup(function() {
  			var val = $("#id").val();
  			$.ajax({
  				url : "idcheck.mem",
  				type : "get",
  				data : {
  					value : val
  				},

  				success : function(response) {
  					console.log(response);
  					$("#chkmsg").text(response);

  				},
  				error : function() {

  				}
  			})
  		});
  
        $('#registerForm').validate({
        	
        	
            rules: {
                id:{required:true, minlength:3, remote:"Validate"},
                pw: "required",
                pw2: {required:true, equalTo:'#pw'},               
                name: {required:true},
                phone: {required:true},
                email: {required:true, email:true},
                zipcode:{required:true},
                adress:{required:true}               
            },
           
            
            
            messages: {
                id: {
                     required:"아이디를  입력해주세요.",
                     minlength: jQuery.format("아이디는 {0}자 이상 입력해주세요!"),
                     remote : jQuery.format("입력하신 {0}는 이미존재하는 아이디입니다. ")
                },
                pw:"암호를 입력하시오.",
                pw2: {
                    required: "비밀번호확인을 입력해주세요.",
                    equalTo:"비밀번호가일치하지않습니다" },
                    
                name: {
                	required:"이름을  입력해주세요."},
                phone: {
                   required:"전화번호를  입력해주세요."},
                email: {
                    required:"이메일을  입력해주세요.",
                    email:"올바른  이메일형식이 아닙니다."},
                zipcode:{
                	 required: "우편번호를 입력해주세요."
                },
                adress:{
                	 required: "주소를 입력해주세요."
                },
                gender:{
                	 required: "성별을 입력해주세요."	
                    }
               
            },
            submitHandler: function (frm){
                frm.submit();   //유효성 검사를 통과시 전송
            },
            success: function(e){
             
            }
           
        });
      }); 
 
    </script>

<style type="text/css">
body {
	color: #999;
	background: #f5f5f5;
	font-family: 'Roboto', sans-serif;
}

.registerForm label.error {
	margin-left: 10px;
	color: red;
}

.form-control {
	min-height: 30px;
	box-shadow: none;
	border-color: #e1e1e1;
}

.form-control:focus {
	border-color: #179b81;
}

.form-control, .btn {
	border-radius: 3px;
}

.form-header {
	margin: -30px -30px 20px;
	padding: 30px 30px 10px;
	text-align: center;
	background: #179b81;
	border-bottom: 1px solid #eee;
	color: #fff;
}

.form-header h2 {
	font-size: 50px;
	font-weight: bold;
	margin: 0 0 10px;
	font-family: "나눔손글씨 펜", sans-serif;
}

.form-header p {
	margin: 20px 0 15px;
	font-size: 25px;
	line-height: normal;
	font-family: "나눔손글씨 펜", sans-serif;
}

.signup-form {
	width: 490px;
	margin: 0 auto;
	padding: 30px 0;
}

.signup-form form {
	color: #999;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #fff;
	box-shadow: 0px 2px 3px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.signup-form .form-group {
	margin-bottom: 5px;
}

.signup-form label {
	font-weight: normal;
	font-size: 13px;
}

.signup-form input[type="checkbox"] {
	margin-top: 2px;
}

.signup-form .btn {
	font-size: 16px;
	font-weight: bold;
	background: #179b81;
	border: none;
	min-width: 200px;
}

.signup-form .btn:hover, .signup-form .btn:focus {
	background: #00b073 !important;
	outline: none;
}

.signup-form a {
	color: #00cb82;
}

.signup-form a:hover {
	text-decoration: underline;
}

.checkbox-gender {
	margin-top: 10px;
}

.radio-green [type="radio"]:checked+label:after {
	border-color: #00C851;
	background-color: #00C851;
}

/*Gap*/
.radio-green-gap [type="radio"].with-gap:checked+label:before {
	border-color: #00C851;
}

.radio-green-gap [type="radio"]:checked+label:after {
	border-color: #00C851;
	background-color: #00C851;
}
</style>



</head>

<body>
	<div class="signup-form">
	
		<form id="registerForm" action="signup.mem" method="post">
			<div class="form-header">
				<h2>나 혼자 산다</h2>
				<p>회원가입 양식을 작성해주세요 :)</p>
			</div>

			<div class="form-group">

				<label>아이디</label> <input type="text" class="form-control" id="id"
					name="id" required="required">
					<p id="chkmsg"></p>
			</div>
			
			<div class="form-group">
				<label>비밀번호</label> <input type="password" class="form-control"
					id="pw" name="pw" required="required">
			</div>
			
			<div class="form-group">
				<label>비밀번호확인</label> <input type="password" class="form-control"
					id="pw2" name="pw2" required="required">
			</div>

			<div class="form-group">
				<label>이름</label> <input type="text" class="form-control" id="name"
					name="name" required="required">
			</div>
			<div class="form-group">
				<label>전화번호</label> <input type="text" class="form-control"
					id="phone" name="phone" required="required">
			</div>
			<div class="form-group">
				<label>이메일</label> <input type="email" class="form-control"
					id="email" name="email" required="required">
			</div>

			<div class="form-group">
				<label>주소</label> <input type="button" class="form-control"
					onclick="sample2_execDaumPostcode()" value="우편번호 찾기"> <input
					type="text" class="form-control" id="sample2_postcode"
					placeholder="우편번호" name=zipcode> <input type="text"
					class="form-control" id="sample2_address" placeholder="한글주소"
					name=address> <input type="text" class=" form-control "
					id="sample2_addressEnglish" placeholder="영문주소 ">


				<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
				<div id="layer"
					style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
					<img
						src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
						id="btnCloseLayer"
						style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
						onclick="closeDaumPostcode()" alt="닫기 버튼">
				</div>

				<script>
					src = "http://dmaps.daum.net/map_js_init/postcode.v2.js"
				</script>
				<script>
					// 우편번호 찾기 화면을 넣을 element
					var element_layer = document.getElementById('layer');

					function closeDaumPostcode() {
						// iframe을 넣은 element를 안보이게 한다.
						element_layer.style.display = 'none';
					}

					function sample2_execDaumPostcode() {
						new daum.Postcode(
								{
									oncomplete : function(data) {
										// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

										// 각 주소의 노출 규칙에 따라 주소를 조합한다.
										// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
										var fullAddr = data.address; // 최종 주소 변수
										var extraAddr = ''; // 조합형 주소 변수

										// 기본 주소가 도로명 타입일때 조합한다.
										if (data.addressType === 'R') {
											//법정동명이 있을 경우 추가한다.
											if (data.bname !== '') {
												extraAddr += data.bname;
											}
											// 건물명이 있을 경우 추가한다.
											if (data.buildingName !== '') {
												extraAddr += (extraAddr !== '' ? ', '
														+ data.buildingName
														: data.buildingName);
											}
											// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
											fullAddr += (extraAddr !== '' ? ' ('
													+ extraAddr + ')'
													: '');
										}

										// 우편번호와 주소 정보를 해당 필드에 넣는다.
										document
												.getElementById('sample2_postcode').value = data.zonecode; //5자리 새우편번호 사용
										document
												.getElementById('sample2_address').value = fullAddr;
										document
												.getElementById('sample2_addressEnglish').value = data.addressEnglish;

										// iframe을 넣은 element를 안보이게 한다.
										// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
										element_layer.style.display = 'none';
									},
									width : '100%',
									height : '100%',
									maxSuggestItems : 5
								}).embed(element_layer);

						// iframe을 넣은 element를 보이게 한다.
						element_layer.style.display = 'block';

						// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
						initLayerPosition();
					}

					// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
					// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
					// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
					function initLayerPosition() {
						var width = 300; //우편번호서비스가 들어갈 element의 width
						var height = 400; //우편번호서비스가 들어갈 element의 height
						var borderWidth = 5; //샘플에서 사용하는 border의 두께

						// 위에서 선언한 값들을 실제 element에 넣는다.
						element_layer.style.width = width + 'px';
						element_layer.style.height = height + 'px';
						element_layer.style.border = borderWidth + 'px solid';
						// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
						element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
								+ 'px';
						element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
								+ 'px';
					}
				</script>
			</div>


			<div class="radio-green-gap" align=center>
				<label>성별</label> <input type="radio"
					required="required" name=gender value="남">남<input
					type="radio" required="required" name=gender value="여">여
			</div>



			<div class="form-group">
				<label class="checkbox-inline"><input type="checkbox"
					required="required"> 개인정보이용에동의합니다 <a href="#">Terms of
						Use</a> &amp; <a href="#">Privacy Policy</a></label>
			</div>



			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-block btn-lg">가입하기</button>
			</div>
			
	
		</form>
		<div class="text-center small">
			이미 아이디가 있으신가요? <a href="login.html">로그인</a>
		</div>
		</div>


</body>

</html>