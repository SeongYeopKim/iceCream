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
    $(document).ready(function () {
        var session = '${!empty customer}';
        var basketDup = '${basketDup}';
        if (basketDup == -1) {
            swal("이미 장바구니에 존재하는 상품입니다");
            <% session.removeAttribute("basketDup"); %>
        }
        if (session == "true") {
            kpu("/cream/item/sortedList");
            var sex = '${customer.sex}';
            console.log("sex"+sex);
            if(sex =="0"){
            	sex="남성";
            }else{
            	sex="여성";
            }
            var age = '${customer.age}';
            age =age.substring(0,1);
            var result = age+"0대 "+sex+"이 선호하는 상품";
            myConcept(result);
        } else if (session == "false") {
            kpu_not_login("/cream//item/default");
        }

    });
    function myConcept(result){
    	 $("#dddd").prepend("<div class='category-tab'><div class='col-sm-12'><ul class='nav nav-tabs'><li class='active'><a href='#tshirt' data-toggle='tab'>"+
    			    result+
    			    "</a></li></ul></div>	<div class='tab-content'><div class='tab-pane fade active in' id='myConcept' ></div></div></div>");
    	$.ajax({
            type: "get",
            url: "/cream/item/myConcept",
            success: function (data) {
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
                	var b =JSON.stringify(k)
                	  $("#myConcept").after("<div class='col-sm-4'><div class='product-image-wrapper'><div class='single-products'><div class='productinfo text-center'><img src='"+
 							list[z].photo +"'/><h2>"+list[z].price+"원</h2><p>"+list[z].title+"</p>"+
 							"<button class='btn btn-default add-to-cart' onclick='btnclick_shop("+ b+")'><i class='fa fa-shopping-cart'></i>주문하긔</button></div>	</div></div></div>");

                }
            }
        });
    }

   
    
    function kpu(inja) {
        $.ajax({
            type: "get",
            url: inja,
            success: function (data) {
                var list = data;
                var perpage = 16;
                var totalpage = parseInt(list.length / perpage) + 1;
                for (z = 0; z < perpage; z++) {
                	var a = new Object();
                	a.photo = list[perpage - z - 1].photo;
                	a.title = list[perpage-z-1].title;
                	a.content = list[perpage-z-1].content;
                	a.price = list[perpage-z-1].price;
                	a.meterial = list[perpage-z-1].meterial;
                	a.srl = list[perpage-z-1].srl;
                	var b =JSON.stringify(a);
                    $("#trView").after("<div class='col-sm-4'><div class='product-image-wrapper'><div class='single-products'> <div class='productinfo text-center'>" + "" +
                    "<img src='" + list[perpage - z - 1].photo + "'/>" +
                    "<h2>"+list[perpage-z-1].price+"원</h2>"+"<p>"+list[perpage-z-1].title+"</p>"+
                    "<button class='btn btn-default add-to-cart' onclick='btnclick_shop("+b+")'><i class='fa fa-shopping-cart'></i>주문하기</button></div></div></div></div>");

                }
                for (a = 0; a < totalpage; a++) {
                    $("#page").append("<button id='btn" + a + "' value=" + a + ">" + (a + 1) + "</button>");
                    $("body").on("click", "#btn" + a, function () {
                        $("#trView").nextAll().remove();
                        var perpagestorage = 16;

                        var cur = parseInt($(this).attr("value"));
                        var end = (perpage * (cur + 1) < list.length) ? perpage * (cur + 1) : list.length;

                        if (cur == (totalpage - 1)) {
                            perpagestorage = list.length - (perpagestorage * cur);
                        }
                        for (c = 0; c < perpagestorage; c++) {
                        	var k = new Object();
                        	k.photo = list[end - c - 1].photo;
                        	k.title = list[end - c - 1].title;
                        	k.content = list[end - c - 1].content;
                        	k.price = list[end - c - 1].price;
                        	k.meterial = list[end - c - 1].meterial;
                        	k.srl = list[end - c - 1].srl;
                        	var b =JSON.stringify(k)
                            $("#trView").after("<div class='col-sm-4'><div class='product-image-wrapper'><div class='single-products'> <div class='productinfo text-center'>" + "" +
                                    "<img src='" + list[end - c - 1].photo + "'/>" +
                                    "<h2>"+list[end-c-1].price+"원</h2>"+"<p>"+list[end-c-1].title+"</p>"+
                                    "<button class='btn btn-default add-to-cart' onclick='btnclick_shop("+b+")'><i class='fa fa-shopping-cart'></i>주문하긔</button></div></div></div></div>"
                            );
                        }
                    });
                }
            },
            beforeSend: function () {
                $('.wrap-loading').removeClass('display-none');
            },
            complete: function () {
                $('.wrap-loading').addClass('display-none');

            }
        });
    }

    function kpu_not_login(inja) {
        $.ajax({
            type: "get",
            url: inja,
            success: function (data) {
                var list = data;
                var perpage = 16;
                var totalpage = parseInt(list.length / perpage) + 1;
                for (z = 0; z < perpage; z++) {
                    $("#trView").after("<div class='col-sm-4'><div class='product-image-wrapper'><div class='single-products'> <div class='productinfo text-center'>" + "" +
                    "<img src='" + list[perpage - z - 1].photo + "'/>" +
                    "<h2>"+list[perpage-z-1].price+"원</h2>"+"<p>"+list[perpage-z-1].title+"</p>"+
                    "<button class='btn btn-default add-to-cart' onclick='btn_not_login_click()'><i class='fa fa-shopping-cart'></i>주문하기</button></div></div></div></div>");

                }
                for (a = 0; a < totalpage; a++) {
                    $("#page").append("<button id='btn" + a + "' value=" + a + ">" + (a + 1) + "</button>");
                    $("body").on("click", "#btn" + a, function () {
                        $("#trView").nextAll().remove();
                        var perpagestorage = 16;

                        var cur = parseInt($(this).attr("value"));
                        var end = (perpage * (cur + 1) < list.length) ? perpage * (cur + 1) : list.length;

                        if (cur == (totalpage - 1)) {
                            perpagestorage = list.length - (perpagestorage * cur);
                        }
                        for (c = 0; c < perpagestorage; c++) {
                            $("#trView").after("<div class='col-sm-4'><div class='product-image-wrapper'><div class='single-products'> <div class='productinfo text-center'>" + "" +
                                    "<img src='" + list[end - c - 1].photo + "'/>" +
                                    "<h2>"+list[end-c-1].price+"원</h2>"+"<p>"+list[end-c-1].title+"</p>"+
                                    "<button class='btn btn-default add-to-cart' onclick='btn_not_login_click()'><i class='fa fa-shopping-cart'></i>주문하긔</button></div></div></div></div>"
                            );
                        }
                    });
                }
            },
            beforeSend: function () {
                $('.wrap-loading').removeClass('display-none');
            },
            complete: function () {
                $('.wrap-loading').addClass('display-none');

            }
        });
    }
</script>


<body>

	<jsp:include page="header.jsp"></jsp:include>
    <div class="wrap-loading display-none">
        <div><img src="/cream/resources/images/viewLoading.gif"/></div>
    </div>
	
<section>
    <div class="container">
        <div class="row">

                <br><br><br>
            <div class="col-sm-9" id ="dddd">
            
            
                <div class='features_items'>
                    <!--features_items-->
                    <%
                        if(session.getAttribute("customer")!=null){
                    %>
                    <h2 class="title text-center">내게 맞는 제품</h2>
                    <%
                        } else {
                    %>
                    <h2 class="title text-center">상품 목록</h2>
                    <%
                        }
                    %>
                    <div id="page" align="center"></div>
                    <!-- 상품 !! -->
                    <div id="trView"></div>

                    <!-- 상품 !! -->


                </div>
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