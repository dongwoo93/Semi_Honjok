<%@page import="honjok.web.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://fonts.googleapis.com/css?family=Roboto|Courgette|Pacifico:400,700"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel=”stylesheet”
	href=”http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css“>

<script src="http://code.jquery.com/jquery-1.3.2.min.js"></script>
<!-- jQuery.validate 플러그인 삽입 -->
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>

<style type="text/css">
#registerForm {
	width: 600px;
}

#registerForm label.error {
	margin-left: 10px;
	color: #3366cc;
}
</style>


<script type="text/javascript">
	$(document).ready(function() {
		
		$.validator.addMethod("phone", function(phone_number, element) {
			phone_number = phone_number.replace(/\s+/g, ""); 
			return this.optional(element) || phone_number.length > 9 &&
				phone_number.match(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/);
		}, "Please specify a valid phone number");
		
		$.validator.addMethod("names", function(names, element){
			return this.optional(element) || names.length > 1 && names.match(/^[가-힣]+$/);
		});
		
		$.validator.addMethod("ids",function(ids, element){
			return this.optional(element) || ids.match(/^[a-z](?=.*[a-z0-9])(?=.*[0-9]).[a-z0-9]{4,20}$/);
		});
		
		$.validator.addMethod("pass",function(pass,element){
			return this.optional(element) || pass.match(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,20}$/);
		})
		
		
		$("#id").keyup(function() {
			var val = $("#id").val();
			$.ajax({
				url : "idcheck.mem",
				type : "get",
				data : {
					value : val
				},

				success : function(response) {
					$("#chkmsg").text(response);

				},
				error : function() {

				}
			})
		});

		$('#registerForm').validate({

			rules : {
				id : {
					required : true,
					minlength : 6,
					maxlength : 20,
					ids : true,

				},
				pw : {
					required : true,
					rangelength: [8, 20],
					pass : true
				},
				pw2 : {
					required : true,
					equalTo : '#pw'
				},
				name : {
					required : true,
					names : true,
				},
				phone : {
					required : true,
					digits : true,
					minlength : 3,
					maxlength : 13,
					phone: true

				},
				email : {
					required : true,
					email : true
				},
				zipcode : {
					required : true
				},
				adress : {
					required : true
				},
				agree : {
					required : true
				},
			},

			messages : {
				id : {
					required : "아이디를  입력해주세요.",
					minlength : "아이디는 최소6글자 이상입니다.",
					maxlength : "범위를 초과하였습니다. (20자리 이하로 입력해주세요)",
					ids : "영문+숫자 조합으로 6자리이상 20자리 이하로 입력해주세요",


				},
				pw : {
					required : "암호를 입력하시오.",
					rangelength: $.validator.format("패스워드 최소 8글자 이상 20글자 이하로 입력하세요."),
					pass : "최소 1개의 숫자 혹은 특수문자를 포함시켜야 합니다."
				},
				pw2 : {
					required : "비밀번호확인을 입력해주세요.",
					equalTo : "비밀번호가일치하지않습니다"
				},

				name : {
					required : "이름을 입력해주세요.",
					names : "한글로 입력해주세요(2글자 이상)"

				},
				phone : {
					required : "전화번호를 입력해주세요.",
					digits : "숫자만 입력해주세요",
					minlength : "전화번호형식이아닙니다.",
					phone : "휴대폰 형식에 맞게 입력해주세염."

				},
				email : {
					required : "이메일을 입력해주세요.",
					email : "올바른  이메일형식이 아닙니다."
				},
				zipcode : {
					required : "우편번호를 입력해주세요."
				},
				adress : {
					required : "주소를 입력해주세요."
				},
				gender : {
					required : "성별을 체크해주세요."
				},
				agree : {
					required : "약관을 확인하시고 체크해주세요."
				},

			},
			submitHandler : function(frm) {

				frm.submit(); //유효성 검사를 통과시 전송

			},
			success : function(e) {

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
	font-family: 'Pacifico', sans-serif;
}

.form-header p {
	margin: 20px 0 15px;
	font-size: 18px;
	line-height: normal;
	font-family: 'Courgette', sans-serif;
}

.signup-form {
	width: 490px;
	margin: 0 auto;
	padding: 30px 0;
}

.signup-form form {
	color: #696969;
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

.radio-green-gap [type="radio"].with-gap:checked+label:before {
	border-color: #00C851;
}

.radio-green-gap [type="radio"]:checked+label:after {
	border-color: #00C851;
	background-color: #00C851;
}

.p1 {
	color: #3366cc;
	margin-left: 10px;
}

.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: white;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 80);
}

.white_content {
	display: none;
	position: absolute;
	top: 25%;
	left: 25%;
	width: 50%;
	height: 50%;
	padding: 16px;
	border: 2px solid black;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
</style>



</head>

<body>
	<c:choose>
	<c:when test="${result>0}">
		<script>
			alert("회원 가입 완료!");			
			location.href = "hollo.com";
		</script>
	</c:when>
	<c:otherwise>
		<div class="signup-form">
		<form id="registerForm" action="signup.mem" method="post">
			<div class="form-header">
				<h2>Hollo</h2>
				<p>Fill out this form to start your free trial :)</p>
			</div>

			<div class="form-group">

				<label>아이디</label> <input type="text" class="form-control" id="id"
					name="id" required="required">
				<p id="chkmsg" class="p1"></p>
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
				<label>성별</label> <input type="radio" required="required"
					name=gender value="남">남<input type="radio"
					required="required" name=gender value="여">여
			</div>



			<div class="form-group">
				<label class="checkbox-inline"><input type="checkbox"
					required="required" id="agree" name="agree"> 개인정보이용에동의합니다 <a
					href="javascript:void(0)"
					onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">이용약관</a>
					&amp; <a href="javascript:void(0)"
					onclick="document.getElementById('light2').style.display='block';document.getElementById('fade2').style.display='block'">개인
						정보 취급 방침</a></label>
				<div id="light" class="white_content">
					<a href="javascript:void(0)"
						onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"><span
						class="fa fa-window-close" aria-hidden="true"></span>이용약관을 확인하였으므로
						닫습니다.</a> <br> <br> 이용약관 제 1 장 총칙 제1조 (목적)<br> 이 이용약관은
					Hollo 홈페이지(이하 “당 사이트”)에서 제공하는 인터넷 서비스(이하 '서비스')의 가입조건 및 이용에 관한 제반
					사항과 기타 필요한 사항을 구체적으로 규정함을 목적으로 합니다.<br> 제 2 조 (용어의 정의) ①
					"이용자"라 함은 당 사이트에 접속하여 이 약관에 따라 당<br> 사이트가 제공하는 서비스를 받는 회원 및
					비회원을 말합니다.<br> ② "회원"이라 함은 서비스를 이용하기 위하여 당 사이트에 개인정보를 제공하여
					아이디(ID)와 비밀번호를 부여 받은 자를 말합니다.<br> ③ "회원 아이디(ID)"라 함은 회원의 식별 및
					서비스 이용을 위하여 자신이 선정한 문자 및 숫자의 조합을 말합니다.<br> ④ "비밀번호(패스워드)"라 함은
					회원이 자신의 비밀보호를 위하여 선정한 문자 및 숫자의 조합을 말합니다.<br> ⑤ "Hollo 패밀리
					사이트"는 당 사이트가 운영 또는 제휴하고 있는 회원제 웹 사이트로서 "[부칙] 3. (Hollo 패밀리 사이트)"에
					명시되어 있습니다.<br> 제 3 조 (이용약관의 효력 및 변경) <br>① 이 약관은 당 사이트에
					게시하거나 기타의 방법으로 회원에게 공지함으로써 효력이 발생합니다.<br> ② 당 사이트는 이 약관을 개정할
					경우에 적용일자 및 개정사유를 명시하여 현행 약관과 함께 당 사이트의 초기화면에 그 적용일자 7일 이전부터 적용일자
					전일까지 공지합니다. 다만, 회원에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고
					공지합니다. 이 경우 당 사이트는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. 제
					4 조 (약관 외 준칙) ① 이 약관은 당 사이트가 제공하는 서비스에 관한 이용안내와 함께 적용됩니다. ② 이 약관에
					명시되지 아니한 사항은 관계법령의 규정이 적용됩니다. 제 2 장 이용계약의 체결 제 5 조 (이용계약의 성립 등) ①
					이용계약은 이용고객이 당 사이트가 정한 약관에 「동의합니다」를 선택하고, 당 사이트가 정한 온라인신청양식을 작성하여
					서비스 이용을 신청한 후, 당 사이트가 이를 승낙함으로써 성립합니다. ② 제1항의 승낙은Hollo 패밀리 사이트와 당
					사이트가 제공하는 과학기술정보검색, 맞춤정보, 서지정보 등 다른 서비스의 이용승낙을 포함합니다. 다만, Hollo 패밀리
					사이트에서 개별적으로 적용되는 약관에 대한 동의는 회원이 Hollo 패밀리 사이트를 최초로 이용할 때 별도의 동의절차를
					거칠 수 있습니다. 제 7 조 (개인정보의 보호 및 사용) 당 사이트는 관계법령이 정하는 바에 따라 회원 등록정보를
					포함한 회원의 개인정보를 보호하기 위해 노력합니다. 회원 개인정보의 보호 및 사용에 대해서는 관련법령 및 당 사이트의
					개인정보 보호정책이 적용됩니다. 제 8 조 (이용 신청의 승낙과 제한) ① 당 사이트는 제6조의 규정에 의한
					이용신청고객에 대하여 서비스 이용을 승낙합니다. ② 당 사이트는 아래사항에 해당하는 경우에 대해서 승낙하지 아니 합니다.
					- 이용계약 신청서의 내용을 허위로 기재한 경우 - 기타 규정한 제반사항을 위반하며 신청하는 경우 제 9 조 (회원 ID
					부여 및 변경 등) ① 당 사이트는 이용고객에 대하여 약관에 정하는 바에 따라 자신이 선정한 회원 ID를 부여합니다. ②
					회원 ID는 원칙적으로 변경이 불가하며 부득이한 사유로 인하여 변경 하고자 하는 경우에는 해당 ID를 해지하고 재가입해야
					합니다. ③ 당 사이트의 회원 ID는 회원 본인의 동의 하에 Hollo 패밀리 사이트의 회원 ID로 사용될 수 있습니다.
					④ 기타 회원 개인정보 관리 및 변경 등에 관한 사항은 서비스별 안내에 정하는 바에 의합니다. 제 3 장 계약 당사자의
					의무 제 10 조 (Hollo의 의무) ① 당 사이트는 이용고객이 희망한 서비스 제공 개시일에 특별한 사정이 없는 한
					서비스를 이용할 수 있도록 하여야 합니다. ② 당 사이트는 개인정보 보호를 위해 보안시스템을 구축하며 개인정보 보호정책을
					공시하고 준수합니다. ③ 당 사이트는 회원으로부터 제기되는 의견이나 불만이 정당하다고 객관적으로 인정될 경우에는 적절한
					절차를 거쳐 즉시 처리하여야 합니다. 다만, 즉시 처리가 곤란한 경우는 회원에게 그 사유와 처리일정을 통보하여야 합니다.
					제 11 조 (회원의 의무) ① 이용자는 회원가입 신청 또는 회원정보 변경 시 실명으로 모든 사항을 사실에 근거하여
					작성하여야 하며, 허위 또는 타인의 정보를 등록할 경우 일체의 권리를 주장할 수 없습니다. ② 당 사이트가 관계법령 및
					개인정보 보호정책에 의거하여 그 책임을 지는 경우를 제외하고 회원에게 부여된 ID의 비밀번호 관리소홀, 부정사용에 의하여
					발생하는 모든 결과에 대한 책임은 회원에게 있습니다. ③ 회원은 당 사이트 및 제 3자의 지적 재산권을 침해해서는 안
					됩니다. 제 4 장 서비스의 이용 제 12 조 (서비스 이용 시간) ① 서비스 이용은 당 사이트의 업무상 또는 기술상
					특별한 지장이 없는 한 연중무휴, 1일 24시간 운영을 원칙으로 합니다. 단, 당 사이트는 시스템 정기점검, 증설 및
					교체를 위해 당 사이트가 정한 날이나 시간에 서비스를 일시 중단할 수 있으며, 예정되어 있는 작업으로 인한 서비스
					일시중단은 당 사이트 홈페이지를 통해 사전에 공지합니다. ② 당 사이트는 서비스를 특정범위로 분할하여 각 범위별로
					이용가능시간을 별도로 지정할 수 있습니다. 다만 이 경우 그 내용을 공지합니다. 제 13 조 (홈페이지 저작권) ① 당
					사이트가 게시한 본 홈페이지의 모든 콘텐트에 대한 저작권은 당 사이트에 있습니다. 다만, 게시물의 원저작자가 별도로 있는
					경우 그 출처를 명시하며 해당 게시물의 저작권은 원저작자에게 있습니다. ② 회원이 직접 게시한 저작물의 저작권은 회원에게
					있습니다. 다만, 회원은 당 사이트에 무료로 이용할 수 있는 권리를 허락한 것으로 봅니다. ③ 당 사이트 소유의 콘텐트에
					대하여 제3자가 허락 없이 다른 홈페이지에 사용 또는 인용하는 것을 금지합니다. 제 14 조 (유료서비스) ① 당 사이트
					및 협력기관이 정한 유료서비스(원문복사 등)는 별도로 정해진 바에 따르며, 변경사항은 시행 전에 당 사이트 홈페이지를
					통하여 회원에게 공지합니다. ② 유료서비스를 이용하려는 회원은 정해진 요금체계에 따라 요금을 납부해야 합니다. 제 5 장
					계약 해지 및 이용 제한 제 15 조 (계약 해지) 회원이 이용계약을 해지하고자 하는 때에는 Hollo 패밀리사이트의
					[가입해지] 메뉴를 이용해 직접 해지해야 합니다. 제 16 조 (서비스 이용제한) ① 당 사이트는 회원이 서비스
					이용내용에 있어서 본 약관 제 11조 내용을 위반하거나, 다음 각 호에 해당하는 경우 서비스 이용을 제한할 수 있습니다.
					- 2년 이상 서비스를 이용한 적이 없는 경우 - 기타 정상적인 서비스 운영에 방해가 될 경우 ② 상기 이용제한 규정에
					따라 서비스를 이용하는 회원에게 서비스 이용에 대하여 별도 공지 없이 서비스 이용의 일시정지, 이용계약 해지 할 수
					있습니다. 제 17 조 (전자우편주소 수집 금지) 원은 전자우편주소 추출기 등을 이용하여 전자우편주소를 수집 또는
					제3자에게 제공할 수 없습니다. 제 6 장 손해배상 및 기타사항 제 18 조 (손해배상) 당 사이트는 무료로 제공되는
					서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 당 사이트가 고의 또는 과실로 인한 손해발생을 제외하고는 이에
					대하여 책임을 부담하지 아니합니다. 제 19 조 (관할 법원) 서비스 이용으로 발생한 분쟁에 대해 소송이 제기되는 경우
					민사 소송법상의 관활 법원에 제기합니다. 부칙 1. (시행일) 이 약관은 2018년 7월 2일부터 적용되며, 종전 약관은
					본 약관으로 대체되며, 개정된 약관의 적용일 이전 가입자도 개정된 약관의 적용을 받습니다. 2. (경과규정) 당 사이트는
					패밀리 사이트에 대한 통합인증 서비스를 제공함에 있어 기존 패밀리 사이트의 회원인 경우 본 약관에 동의함으로써 별도
					가입절차 없이 서비스를 이용할 수 있도록 합니다. 3. (Hollo 패밀리 사이트) Hollo 홈페이지,
					과학기술정보포털서비스, 북한과학기술네트워크, 한민족과학기술자네트워크, 원로과학기술인, 사이버테크노마트,
					기술가치평가시스템, 남북기술이전네트워크, 나노기술정보지원시스템, 부품소재종합정보망, 바이오인포매틱스센터,
					종합기업서비스정보망, 초고속연구망, 과학기술학회마을, 기술시장지식정보시스템, 무기결정구조DB, 디지털한국인인체모델,
					과학기술동영상지식정보, 신약설계화합물구조, 미래선도기술네트워크, 과학기술협회마을 등
				</div>
				<div id="fade" class="black_overlay"></div>





				<div id="light2" class="white_content">
					<a href="javascript:void(0)"
						onclick="document.getElementById('light2').style.display='none';document.getElementById('fade2').style.display='none'">개인
						정보 취급 방침을 확인하고 닫습니다 </a> <br> <br> 'Hollo'는 (이하 '회사'는) 고객님의
					개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다. 회사는 개인정보취급방침을
					통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가
					취해지고 있는지 알려드립니다. 회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할
					것입니다. ■ 수집하는 개인정보 항목 회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고
					있습니다. ο 수집항목 : 로그인ID , 비밀번호 , 전화번호 , 이메일 , 주소 ,성별 ο 개인정보 수집방법 :
					홈페이지(회원가입) ■ 개인정보의 수집 및 이용목적 회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다. ο 서비스
					제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등
					발송 ο 회원 관리 회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 연령확인 , 만14세 미만 아동 개인정보 수집
					시 법정 대리인 동의여부 확인 , 고지사항 전달 ο 마케팅 및 광고에 활용 접속 빈도 파악 또는 회원의 서비스 이용에
					대한 통계 ■ 개인정보의 보유 및 이용기간 회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체
					없이 파기합니다. ■ 개인정보의 파기절차 및 방법 회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당
					정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다. ο 파기절차 회원님이 회원가입 등을 위해 입력하신
					정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호
					사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다. 별도 DB로 옮겨진 개인정보는 법률에 의한
					경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다. ο 파기방법 - 전자적 파일형태로 저장된
					개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다. ■ 개인정보 제공 회사는 이용자의 개인정보를
					원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다. - 이용자들이 사전에 동의한 경우 - 법령의
					규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우 ■ 수집한 개인정보의
					위탁 회사는 서비스 제공 및 향상을 위하여 아래와 같이 개인정보를 위탁하고 있으며, 관계 법령에 따라 위탁계약시
					개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다. 화사의 개인정보 수탁업체 및 위탁업무의 내용은
					아래와 같습니다. ─────────────────────────────────── 수탁업체 : 위탁업무 내용
					─────────────────────────────────── ⅩⅩ : 상품배송
					─────────────────────────────────── ⅩⅩ : 결제, 구매안전서비스 제공등
					─────────────────────────────────── ⅩⅩ : 실명확인, 본인인증
					─────────────────────────────────── ■ 이용자 및 법정대리인의 권리와 그 행사방법 이용자 및
					법정 대리인은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며
					가입해지를 요청할 수도 있습니 다. 이용자 혹은 만 14세 미만 아동의 개인정보 조회?수정을 위해서는 ‘개인정보변
					경’(또는 ‘회원정보수정’ 등)을 가입해지(동의철회)를 위해서는 “회원탈퇴”를 클릭 하여 본인 확인 절차를 거치신 후
					직접 열람, 정정 또는 탈퇴가 가능합니다. 혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조
					치하겠습니다. 귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까 지 당해 개인정보를 이용 또는
					제공하지 않습니다. 또한 잘못된 개인정보를 제3자 에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여
					정정이 이루어지도록 하겠습니다. oo는 이용자 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 “oo 가
					수집하는 개인정보의 보유 및 이용기간”에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고
					있습니다. ■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항 회사는 귀하의 정보를 수시로 저장하고
					찾아내는 ‘쿠키(cookie)’ 등을 운용합니다. 쿠키란 oo의 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에
					보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다. 회사은(는) 다음과 같은 목적을 위해 쿠키를
					사용합니다. ▶ 쿠키 등 사용 목적 - 회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를
					파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공 귀하는
					쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나,
					쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다. ▶ 쿠키 설정 거부 방법 예:
					쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를
					저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다. 설정방법 예(인터넷 익스플로어의 경우) : 웹
					브라우저 상단의 도구 > 인터넷 옵션 > 개인정보 단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을
					수 있습니다. ■ 개인정보에 관한 민원서비스 회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여
					아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다. 고객서비스담당 부서 : 혼자조 전화번호 :
					OO-OOOO-OOOO 이메일 : OOOOO@OOOO 개인정보관리책임자 성명 : 이동우 전화번호 :
					OO-OOOO-OOOO 이메일 : OOOOO@OOOO 귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호
					관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. 회사는 이용자들의 신고사항에 대해 신속하게 충분한
					답변을 드릴 것입니다. 기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.
					1.개인분쟁조정위원회 (www.1336.or.kr/1336) 2.정보보호마크인증위원회
					(www.eprivacy.or.kr/02-580-0533~4) 3.대검찰청 인터넷범죄수사센터
					(http://icic.sppo.go.kr/02-3480-3600) 4.경찰청 사이버테러대응센터
					(www.ctrc.go.kr/02-392-0330)
				</div>
				<div id="fade2" class="black_overlay"></div>


			</div>



			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-block btn-lg" name=join>가입하기</button>
			</div>


		</form>
		
		<div class="text-center small">
			이미 아이디가 있으신가요? <a href="login.html">로그인</a>
		</div>
	</div>
	</c:otherwise>
	</c:choose>
	

</body>

</html>