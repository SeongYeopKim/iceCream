<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>^^</title>
<link href="/cream/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/cream/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/cream/resources/css/prettyPhoto.css" rel="stylesheet">
<link href="/cream/resources/css/price-range.css" rel="stylesheet">
<link href="/cream/resources/css/animate.css" rel="stylesheet">
<link href="/cream/resources/css/main.css" rel="stylesheet">
<link href="/cream/resources/css/responsive.css" rel="stylesheet">
<script src="/cream/resources/js/sweetalert.min.js"></script>
<script src="/cream/resources/js/main_test.js"></script>
<link rel="stylesheet" href="/cream/resources/css/sweetalert.css">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
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
</head>
<style type="text/css">
.wrap-loading {
	/*화면 전체를 어둡게 합니다.*/
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	background: rgba(0, 0, 0, 0.2); /*not in ie */
	filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000',
		endColorstr='#20000000'); /* ie */
}

.wrap-loading div {
	/*로딩 이미지*/
	position: fixed;
	top: 50%;
	left: 50%;
	margin-left: -21px;
	margin-top: -21px;
}

.display-none {
	/*감추기*/
	display: none;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var session = '${!empty customer}';
		var basketDup = '${basketDup}';
		var orderResult = '${orderResult}';
		if (orderResult == "주문성공") {
			swal("주문 완료!");
			orderResult == "asd";
		}
		if (basketDup == -1) {
			swal("이미 장바구니에 존재하는 상품입니다");
<%session.removeAttribute("basketDup");%>
	}
		if (session == "true") {
			best();
		} else if (session == "false") {
			best_not_login();
		}
	});
	function best() {
		$
				.ajax({
					type : "get",
					url : "/cream/item/bestItem",
					success : function(data) {
						var list = data;
						var z;
						for (z = 0; z < list.length; z++) {
							var k = new Object();
							k.photo = list[z].photo;
							k.title = list[z].title;
							k.content = list[z].content;
							k.price = list[z].price;
							k.meterial = list[z].meterial;
							k.srl = list[z].srl;
							var b = JSON.stringify(k)
							$("#bestItem")
									.after(
											"<div class='col-sm-4'><div class='product-image-wrapper'><div class='single-products'><div class='productinfo text-center'><img src='"+
							list[z].photo +"'/><h2>"
													+ list[z].price
													+ "원</h2><p>"
													+ list[z].title
													+ "</p>"
													+ "<button class='btn btn-default add-to-cart' onclick='btnclick_home("
													+ b
													+ ")'><i class='fa fa-shopping-cart'></i>주문하기</button></div>	</div></div></div>");

						}
					},
					beforeSend : function() {
						$('.wrap-loading').removeClass('display-none');
					},
					complete : function() {
						$('.wrap-loading').addClass('display-none');

					}
				});
	}
	function best_not_login() {
		$
				.ajax({
					type : "get",
					url : "/cream/item/bestItem",
					success : function(data) {
						var list = data;
						var z;
						for (z = 0; z < list.length; z++) {
							$("#bestItem")
									.after(
											"<div class='col-sm-4'><div class='product-image-wrapper'><div class='single-products'><div class='productinfo text-center'><img src='"+
                list[z].photo +"'/><h2>"
													+ list[z].price
													+ "원</h2><p>"
													+ list[z].title
													+ "</p>"
													+ "<button class='btn btn-default add-to-cart' onclick='btn_not_login_click()'><i class='fa fa-shopping-cart'></i>주문하기</button></div>	</div></div></div>");

						}
					},
					beforeSend : function() {
						$('.wrap-loading').removeClass('display-none');
					},
					complete : function() {
						$('.wrap-loading').addClass('display-none');

					}
				});
	}
</script>

<body>

	<jsp:include page="header.jsp"></jsp:include>



	<div class="wrap-loading display-none">
		<div>
			<img src="/cream/resources/images/viewLoading.gif" />
		</div>
	</div>
	<section id="slider"> <!--slider-->
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div id="slider-carousel" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#slider-carousel" data-slide-to="0"
							class="active"></li>
						<li data-target="#slider-carousel" data-slide-to="1"></li>
						<li data-target="#slider-carousel" data-slide-to="4"></li>
						<li data-target="#slider-carousel" data-slide-to="5"></li>
						<li data-target="#slider-carousel" data-slide-to="6"></li>
						<li data-target="#slider-carousel" data-slide-to="7"></li>
						
					</ol>


					<div class="carousel-inner">
						<div class="item active single-products">
							<div>
								<img src="/cream/resources/images/home/1.jpeg"
									class="girl img-responsive" alt="" />

							</div>
							<div class="product-overlay">
								<div class="overlay-content">
									<button class='btn btn-default add-to-cart'
										onclick='btnclick_home1()'>
										<i class='fa fa-shopping-cart'></i>주문하기
									</button>
								</div>
							</div>
						</div>

						<div class="item single-products">
							<div>
								<img src="/cream/resources/images/home/2.jpeg"
									class="girl img-responsive" alt="" />

							</div>
							<div class="product-overlay">
								<div class="overlay-content">
									<button class='btn btn-default add-to-cart'
										onclick='btnclick_home4()'>
										<i class='fa fa-shopping-cart'></i>주문하기
									</button>
								</div>
							</div>
						</div>
						
						<div class="item single-products">
							<div>
								<img src="/cream/resources/images/home/5.jpeg"
									class="girl img-responsive" alt="" />

							</div>
							<div class="product-overlay">
								<div class="overlay-content">
									<button class='btn btn-default add-to-cart'
										onclick='btnclick_home5()'>
										<i class='fa fa-shopping-cart'></i>주문하기
									</button>
								</div>
							</div>
						</div>
						
						<div class="item single-products">
							<div>
								<img src="/cream/resources/images/home/6.jpeg"
									class="girl img-responsive" alt="" />

							</div>
							<div class="product-overlay">
								<div class="overlay-content">
									<button class='btn btn-default add-to-cart'
										onclick='btnclick_home6()'>
										<i class='fa fa-shopping-cart'></i>주문하기
									</button>
								</div>
							</div>
						</div>
						
						<div class="item single-products">
							<div>
								<img src="/cream/resources/images/home/7.jpeg"
									class="girl img-responsive" alt="" />

							</div>
							<div class="product-overlay">
								<div class="overlay-content">
									<button class='btn btn-default add-to-cart'
										onclick='btnclick_home7()'>
										<i class='fa fa-shopping-cart'></i>주문하기
									</button>
								</div>
							</div>
						</div>
						
						<div class="item single-products">
							<div>
								<img src="/cream/resources/images/home/8.jpeg"
									class="girl img-responsive" alt="" />

							</div>
							<div class="product-overlay">
								<div class="overlay-content">
									<button class='btn btn-default add-to-cart'
										onclick='btnclick_home8()'>
										<i class='fa fa-shopping-cart'></i>주문하기
									</button>
								</div>
							</div>
						</div>
						
						

					</div>


					<a href="#slider-carousel" class="left control-carousel hidden-xs"
						data-slide="prev"> <i class="fa fa-angle-left"></i>
					</a> <a href="#slider-carousel"
						class="right control-carousel hidden-xs" data-slide="next"> <i
						class="fa fa-angle-right"></i>
					</a>

				</div>


			</div>
		</div>
	</div>
	</section>

	<!--/slider-->

	<section>
	<div class="container">
		<div class="row">

			<div class="col-sm-9">

				<div class="recommended_items">
					<!--recommended_items-->
					<h2 class="title text-center">Best Item</h2>

					<div id="recommended-item-carousel"
						data-ride="carousel">
						<div class="carousel-inner">
							<div class="item active" id="bestItem"></div>
						</div>
					</div>
				</div>
				<!--/recommended_items-->


			</div>
		</div>
	</div>


	</section>

	<jsp:include page="footer.jsp"></jsp:include>


	<script src="/cream/resources/js/bootstrap.min.js"></script>
	<script src="/cream/resources/js/jquery.scrollUp.min.js"></script>
	<script src="/cream/resources/js/price-range.js"></script>
	<script src="/cream/resources/js/jquery.prettyPhoto.js"></script>
	<script src="/cream/resources/js/main.js"></script>
	<script src="/cream/resources/js/alert.js"></script>
</body>
</html>