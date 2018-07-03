$(document).ready(function() {

	$('ul.nav li.dropdown').hover(
			function() {
				$(this).find('.dropdown-menu').stop(
						true, true).delay(200).fadeIn(
								500);
			},
			function() {
				$(this).find('.dropdown-menu').stop(
						true, true).delay(200).fadeOut(
								500);
			});
	
	function login() {
		var id = $("#id").val();
		var pw = $("#pass").val();

		$.ajax({
					url : "login.do",
					type : "post",
					data : {
						id : id,
						pw : pw
					},
					success : function(
							data) {
						var result = data.result;
						if (result == 'true') {
							$(location).attr("href", "hollo.com");
						} else {
							$("#response").text("Incorrect ID or password!");
							$("#id").val("");
							$("#pass").val("");
						}

					},
					error : function(
							response) {
						console.log("에러다");
						console.log(response);
					}
				});
	
	}
	
	$("#login").click(login);
	
	$('#pass').keypress(function (e) {
		  if (e.which == 13) {
		   login();   //<---- Add this line
		  }
		});

	$('#hontalkView').click(function() {
		window.location = $(this).attr('href');
	});

	$('#cook').click(function() {
		window.location = $(this).attr('href');
	});

	$('#logoutbt').click(function() {
		$(location).attr('href', 'logout.do');
	});

	var googleUser = {};
	var startApp = function() {gapi.load('auth2', function() {

					// Retrieve the singleton for the GoogleAuth library and set up the client.
					auth2 = gapi.auth2
					.init({
						client_id : '593657004380-quv6o52kji1ov5cabpji96q95nn2afkn.apps.googleusercontent.com',
						cookiepolicy : 'single_host_origin',
						// Request scopes in addition to 'profile' and 'email'
						//scope: 'additional_scope'z
					});
					attachSignin(document
							.getElementById('customBtn'));
				});

	};

	function attachSignin(element) {

		auth2.attachClickHandler(element, {}, function(googleUser) {
			console.log("들어옴")
			var name = googleUser.getBasicProfile().getName();
			var id = googleUser.getBasicProfile().getId();
			var email = googleUser.getBasicProfile().getEmail();

			location.href = "google.do?id=" + id + "&email=" + email
			+ "&name=" + name;

		}, function(error) {

			alert(JSON.stringify(error, undefined, 2));
		});
	}

	var kakaologin = function() {

		Kakao.init('7b5cebd6ff38bcc35f50a75797895963');

		Kakao.Auth.login({
			success : function() {
				// 로그인 성공시, API를 호출합니다. 
				Kakao.API.request({
					url : '/v1/user/me',
					success : function(res) {
						var id = JSON.stringify(res.id)
						var email = JSON.stringify(res.kaccount_email)
						var name = JSON.stringify(res.properties.nickname)
						console.log(id + email + name);
						location.href = "kakaotest.do?id="+id+"&email="+email+"&name="+name;
					},
					fail : function(error) {
						console.log(JSON.stringify(error));
					}
				});
			},
			fail : function(err) {
				console.log(JSON.stringify(err));
			}
		});

	}
	var $nav = $("#navbar");
	$nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
	$(window).scroll(
			function() {
				var $nav = $("#navbar");
				$nav.toggleClass('scrolled',
						$(this).scrollTop() > $nav.height());
			});
})