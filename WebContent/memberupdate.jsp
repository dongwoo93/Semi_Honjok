
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="honjok.web.dao.MemberDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
	<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>회원정보수정</title>

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
	
	
	

  $('#updateForm').validate({

		rules : {
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
        phone : {
           required : "전화번호를 입력해주세요.",
           digits : "숫자만 입력해주세요",
           minlength : "전화번호형식이아닙니다.",
           phone : "휴대폰 형식에 맞게 입력해주세염."

		},
		submitHandler : function(frm) {

			frm.submit(); //유효성 검사를 통과시 전송

		},
		success : function(e) {

     },
     submitHandler : function(frm) {
        frm.submit(); //유효성 검사를 통과시 전송
     },
     success : function(e) {

     }

  },

});
})
					
</script>

<style>



</style>


</head>

<body>
	<div class="container">
		<h2 class="text-center">회원 정보 수정하기</h2>

		<form id="updateForm" action="memberupdate.mem" method="post">

			<table class="table table-striped">
				<tr>
					<td>아이디</td>
					<td id="id" name="id">${result[0].id}</td>

				</tr>

				<tr>

					<td>패스워드</td>
					<td><input type="password" id="pw" name="pw"
						class="form-control"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type=text id="name" name="name"
						class="form-control"></td>

				</tr>
				<tr>

					<td>전화</td>
					<td><input type=text id="phone" name="phone"
						class="form-control"></td>
				</tr>

				<tr>
					<td>이메일</td>
					<td><input type=text id="email" name="email"
						class="form-control"></td>
				</tr>


				<tr>
					<td>집주소</td>
					<td colspan="3"><input type="button" class="form-control"
							onclick="sample2_execDaumPostcode()" value="우편번호 찾기"> <input
							type="text" class="form-control" id="sample2_postcode"
							placeholder="우편번호" name=zipcode> <input type="text"
							class="form-control" id="sample2_address" placeholder="한글주소"
							name=address> <input type="text" class=" form-control "
							id="sample2_addressEnglish" placeholder="영문주소 "></td>
				
				
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
					</tr>

				<tr>
					<td colspan="2" class="text-center"><input type="submit"
						value="수정하기" class="btn btn-outline-dark">
						<button type="button" class="btn btn-outline-dark"
							onclick="location.href='myinfo.jsp'">회원 정보 보기</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>