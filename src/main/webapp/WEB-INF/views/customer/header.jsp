<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="/cream/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="/cream/resources/css/font-awesome.min.css" rel="stylesheet">
	<link href="/cream/resources/css/prettyPhoto.css" rel="stylesheet">
	<link href="/cream/resources/css/price-range.css" rel="stylesheet">
	<link href="/cream/resources/css/animate.css" rel="stylesheet">
	<link href="/cream/resources/css/main.css" rel="stylesheet">
	<link href="/cream/resources/css/responsive.css" rel="stylesheet">

	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
				function() {
					var session = '${!empty customer}';
					if (session == "true") {
						$("#logincheck")
								.after(
								"<li><a href='/cream/customer/myorder'><i class='fa fa-star'></i> Orderlist</a></li>"+
								"<li><a href='/cream/customer/cart'><i class='fa fa-shopping-cart'></i>Cart</a></li>"+
								"<li><a href='/cream/customer/logout'><i class='fa fa-lock'></i>Logout</a></li>");
					} else if (session == "false") {
						$("#logincheck")
								.after(
								"<li><a href='/cream/customer/login'><i class='fa fa-lock'></i>Login & SignUp</a></li>")
					}
				});
	</script>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>

<div class="background">
	<!-- 배경 이미지 적용 start -->
	<header id="header"> <!--header-->
		<div class="header_top">
			<!--header_top-->

			<div class="row">


				<div class="container">
					<div class="row">
						<div class="col-sm-9">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle"
										data-toggle="collapse" data-target=".navbar-collapse">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
							</div>

						</div>

					</div>
				</div>

				<div class="col-sibal">
					<!--  mainmenu pull-left -->
					<div class="shop-menu pull-right">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<div id="logincheck"></div>
							</ul>
						</div>

						<ul class="nav navbar-nav collapse navbar-collapse">
							<li><a href="/cream" class="active">메인</a></li>
							<li><a href="/cream/customer/shop" class="sub-menu">제품</a></li>





						</ul>
					</div>


				</div>

				.
			</div>
		</div>
		<!--/header_top-->

		<div class="header-image">
			<!--header-middle-->
			<div class="head-image-container">





			</div>	
			<div class="name">
				<a href="/cream/customer/home"><img
						src="/cream/resources/images/home/biglogo2.png" alt="" /></a>
			</div>


		</div>
</div>
<!--/header-middle--> <!-- <div class="header-bottom">
			header-bottom
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="home.jsp" class="active">메인</a></li>
								<li class="dropdown"><a href="#">메뉴<i
										class="fa fa-angle-down"></i></a>
									<ul role="menu" class="sub-menu">
										<li><a href="shop.jsp">Products</a></li>
										<li><a href="product-details.jsp">Product Details</a></li>
										<li><a href="cart.jsp">Cart</a></li>
										<li><a href="/cream/customer/login">Login</a></li>
									</ul></li>
								<li><a href="contact-us.jsp">Contact</a></li>


							</ul>
						</div>
					</div>

				</div>
			</div>
		</div> --> <!--/header-bottom-->
</div>
<!-- 배경 이미지 적용 end -->
</header>


<!--/header-->
</body>
</html>