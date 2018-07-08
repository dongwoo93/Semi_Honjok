window.onload = function() {
		document.getElementById('modifybt').onclick = function() {
			var pw = document.getElementById('pw').value;
			var name = document.getElementById('name').value;
			var phone = document.getElementById('phone').value;
			var email = document.getElementById('email').value;
			var zipcode = document.getElementById('sample2_postcode').value;
			var address = document.getElementById('sample2_address').value;

			if (pw != "" && name != "" && phone != "" && email != ""
					&& zipcode != "" && address != "" && zipcode != ""
					&& address != "") {
					function validate() {
					var rxpw = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,20}$/;
					var rxname =  /^[가-힣]{2,4}$/;
					var rxphone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
					var rxemail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
					
					if (rxpw.test(pw)) {
						if(rxname.test(name)){
							if(rxphone.test(phone)){
								if(rxemail.test(email)){
									return true;
								}else{
									alert("이메일 형식을 확인해주세요.");
									return false;
								}
								
							}else{
								alert("전화번호형식이아닙니다.");
								return false;
							}
							
						}else{
							alert("한글로 입력해주세요(2글자 이상)");
							return false;
						}
					}else{
						alert("문자, 숫자 혹은 특수문자가 포함되야 합니다(8-20자)");
						return false;
					}
				}
				var rex = validate();
				
				if (rex) {
					$('#modifybt').attr('disabled', true);
					makeFunction("memberupdate.mem");
				}
				function makeFunction(dst) {
					document.getElementById("updateForm").action = dst;
					document.getElementById("updateForm").submit();
				}
			} else {
				alert("입력사항을 확인하세요.");
			}

		}
	}