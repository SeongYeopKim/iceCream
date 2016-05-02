<%@ page import="kr.ice.cream.dto.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Login | E-Shopper</title>
<link href="/cream/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/cream/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/cream/resources/css/prettyPhoto.css" rel="stylesheet">
<link href="/cream/resources/css/price-range.css" rel="stylesheet">
<link href="/cream/resources/css/animate.css" rel="stylesheet">
<link href="/cream/resources/css/main.css" rel="stylesheet">
<link href="/cream/resources/css/responsive.css" rel="stylesheet">
	<script src="/cream/resources/js/sweetalert.min.js"></script>
	<link rel="stylesheet" href="/cream/resources/css/sweetalert.css">
<!--[if lt IE 9]>
    <script src="/cream/resources/js/html5shiv.js"></script>
    <script src="/cream/resources/js/respond.min.js"></script>
    <![endif]-->
<link rel="shortcut icon" href="/cream/resources/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="/cream/resources/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="/cream/resources/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="/cream/resources/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="/cream/resources/images/ico/apple-touch-icon-57-precomposed.png">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var idcheck;
		var joinResult = '${joinResult}';
		var loginStatus = '${loginStatus}';

		function loginCheck() {
			if (loginStatus == "fail") {
				swal("로그인 실패! 아이디 비번 다시 입력");
			}
		}
		function check() {
			if (joinResult == 1) {
				swal("회원가입 성공임ㅋㅋ");
			} else if (joinResult == -1) {
				swal("회원가입 실패임 ㅠㅠ");
			}
		}
		check();
		loginCheck();
		$("#sign_id").focusout(function(e) {
			$.ajax({
				url : "/cream/customer/idDupCheck",
				method : "post",
				data : {
					id : $("#sign_id").attr("value")
				},
				dataType : "text",
				success : function(responseData, status, xhr) {
					if (responseData == 1) {
						$("#idcheck").text("아이디 사용가능");
						idcheck = 1;
					} else if (responseData == 0) {
						$("#idcheck").text("아이디 중복, 사용불가");
						idcheck = 0;
					}
				}
			});
		});

		$("#sign_btn").click(function(e) {
			if (idcheck == 0) {
				alert("아이디 딴거 입력해라ㅡㅡ");
				e.preventDefault(); // 이벤트를 멈춤

			}
		})

	});
</script>
</head>
<!--/head-->

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<section id="form"><!--form-->
	<div class="container">
		<div class="row" align="center">
			<div class="col-sm-4 col-sm-offset-2">
				<div class="login-form">
					<!--login form-->
					<h2>Login to your account</h2>
					<form id="loginup" method="post"
						action="/cream/customer/loginProcess">
						<input type="text" placeholder="ID" name="id" /> <input
							type="password" placeholder="Password" name="password" />
						<button type="submit" class="btn btn-default">Login</button>
					</form>
				</div>
				<!--/login form-->
			</div>
			<div class="col-sm-1">
				<h2 class="or">OR</h2>
			</div>
			<div class="col-sm-4">
				<div class="signup-form">
					<!--sign up form-->
					<h2>New User Signup!</h2>
					<form id="signup" method="post"
						action="/cream/customer/joinProcess">
						<input class="good" type="text" placeholder="ID" name="id"
							id="sign_id" />
						<div id="idcheck"></div>
						<input class="good" type="password" placeholder="Password"
							name="password" id="sign_password" /> <input class="good"
							type="text" placeholder="Name" name="name" id="sign_name" /> <input
							class="good" type="text" placeholder="Age" name="age"
							id="sign_age" /> <input class="good" type="text"
							placeholder="Phone" name="phone" id="sign_phone" />
						<div class="nogood">
							남자 <input type="radio" name="sex" value="0" checked="checked">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							여자 <input type="radio" name="sex" value="1">
						</div>
						"달콤한 맛" 선호도 <input class="good" type="range" name="sweet"
							id="sweet" value="5" min="0" max="10"> "부드러운 맛" 선호도 <input
							class="good" type="range" name="soft" id="soft" value="5"
							min="0" max="10"> "상콤한 맛" 선호도<input class="good"
							type="range" name="sour" id="sour" value="5" min="0" max="10">

						<button type="submit" id="sign_btn">Signup</button>
					</form>
				</div>
				<!--/sign up form-->
			</div>

		</div>
	</div>
	</section>
	<!--/form-->


	<jsp:include page="footer.jsp"></jsp:include>

	<script src="/cream/resources/js/price-range.js"></script>
	<script src="/cream/resources/js/jquery.scrollUp.min.js"></script>
	<script src="/cream/resources/js/bootstrap.min.js"></script>
	<script src="/cream/resources/js/jquery.prettyPhoto.js"></script>
	<script src="/cream/resources/js/main.js"></script>
</body>
</html>