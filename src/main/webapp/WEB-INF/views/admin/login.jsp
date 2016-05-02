<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/cream/resources/css/admin/reset.css">
<link rel="stylesheet" href="/cream/resources/css/admin/animate.css">
<link rel="stylesheet" href="/cream/resources/css/admin/styles.css">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
</head>

<!-- Main HTML -->
<script type="text/javascript">
	$(document).ready(function() {
		var loginStatus = '${loginStatus}';

		function loginCheck() {
			if (loginStatus == "fail") {
				alert("로그인 실패! 아이디 비번 다시 입력");
			}
		}
		loginCheck();
	});
</script>
<body>

	<!-- Begin Page Content -->

	<div id="container">

		<form action = "/cream/admin/loginProcess" method="post">

			<label for="name">Username:</label> 
			<input type="name" name=id> 
			<label	for="username">Password:</label>

			<p>
				<input type="password" name=pw>
			<div id="lower">

				<input type="submit" value="Login">

			</div>

		</form>

	</div>


	<!-- End Page Content -->

</body>
</body>
</html>