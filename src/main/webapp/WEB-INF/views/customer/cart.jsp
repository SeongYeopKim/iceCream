<%@page import="kr.ice.cream.dto.ItemDTO" %>
<%@page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="kr.ice.cream.dto.ItemlistDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Cart | E-Shopper</title>
    <link href="/cream/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/cream/resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="/cream/resources/css/prettyPhoto.css" rel="stylesheet">
    <link href="/cream/resources/css/price-range.css" rel="stylesheet">
    <link href="/cream/resources/css/animate.css" rel="stylesheet">
    <link href="/cream/resources/css/main.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="/cream/resources/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="/cream/resources/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
          href="/cream/resources/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72"
          href="/cream/resources/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/cream/resources/images/ico/apple-touch-icon-57-precomposed.png">
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <%--<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>--%>
    <script type="text/javascript">
        var orderResult = '${orderResult}';

        if(orderResult=="주문실패"){
            swal("다시 주문하세요!");
            orderResult=="asd";
        }
        var listed = '${cartList}';
        var list = JSON.parse(listed);
        $(document).ready(function () {
            dodo();
        });

        function dodo() {
            var total = 0;
            for (a = 0; a < list.length; a++) {
                total += list[a].price;
            }
            $("#item_total_boo").html((total * 0.1) + " 원");
            $("#item_total_gwa").html((total * 0.9) + " 원");
            $("#item_total_price").html(total + " 원");

            if (list.length == 0) {
                $("#cartView").append("<tr><td colspan='5'>" +
                "<div align='center'><h2 > 상품을 추가하세요</h2></div>" +
                "</td></tr>");
            } else {
                $("#cartView").append("<thead><tr class='cart_menu'><td class='image' width = '15%'>제품</td>" +
                "<td class='description' width = '50%'></td><td class='price' width = '10%'>가격</td>" +
                "<td class='quantity' width = '10%'>수량</td><td class='total' width = '10%'>금액</td>" +
                "<td></td width = '5%'></tr></thead><tbody>");
                for (i = 0; i < list.length; i++) {
                    $("#cartView").append("<tr><td class='cart_product' width='300px'>" +
                    "<a href=''><img src='" + list[i].photo + "' width='200px' height='200px' alt=''></a>" +
                    "</td><td class='cart_description' >" +
                    "<h4><a href=''>" + list[i].title + "</a></h4>" +
                    "<p>" + list[i].content + "</p>" +
                    "</td><td class='cart_price'>" +
                    "<p id='cart_save_price" + i + "'>" + list[i].price + "원</p>" +
                    "</td><td class='cart_quantity' style='margin:5px' ><div class='cart_quantity_button'>" +
                    "<button class='cart_quantity_up'  id='cart_item_plus" + i + "'> + </button>" +
                    "<button class='cart_quantity_down'  id='cart_item_minus" + i + "'> - </button>" +
                    "<input class='cart_quantity_input' style='margin-right:5px'  type='text' name='quantity' id='cart_item_quantity" + i + "' value='1' size='2'>" +
                    "</div></td><td class='cart_total' style='margin:5px'>" +
                    "<p class='cart_total_price' id='cart_item_price" + i + "'>" + list[i].price + "원</p>" +
                    "</td><td class='cart_delete' style='margin:5px'>" +
                    "<a class='cart_quantity_delete' id='delete" + i + "'><i class='fa fa-times'></i></a></td></tr>");

                    $(document).on("click", "#delete" + i, function () {
                        var id = $(this).attr("id");
                        var v = parseInt(id.substring(id.length - 1, id.length));
                        var save = list[v].srl;

                        var $form = $('<form></form>');
                        $form.attr('action', '/cream/customer/basket_delete');
                        $form.attr('method', 'get');
                        $form.appendTo('body');
                        $form.append('<input type="hidden" value="' + save + '" name="srl">');
                        $form.submit();


                    });

//                    $(document).on("click", "#delete" + i, function () {
//                        var id = $(this).attr("id");
//                        var v = parseInt(id.substring(id.length - 1, id.length));
//                        var save = list[v].srl;
//                        console.log(save)
//                        $.ajax({
//                            url: "/cream/customer/basket_delete",
//                            method: "post",
//                            data: {srl: save},
//                            dataType: "json",
//                            success: function (data) {
//                                list = data;
//                                $("#cartView").nextAll().remove();
//                                dodo();
//                            }
//                        });
//                    });

                    $(document).on("click", "#cart_item_plus" + i, function () {
                        var id = $(this).attr("id");
                        var v = parseInt(id.substring(id.length - 1, id.length));

                        var value = $("#cart_item_quantity" + v).attr("value");
                        console.log(value);
                        value++;
                        list[v].amount = value;

                        $("#cart_item_quantity" + v).val(value);
                        var price = $("#cart_item_price" + v).text();
                        var save_price = $("#cart_save_price" + v).text();
                        total += parseInt(save_price);
                        $("#item_total_boo").html((total * 0.1) + " 원");
                        $("#item_total_gwa").html((total * 0.9) + " 원");
                        $("#item_total_price").html(total + " 원");


                        var save_price_int = parseInt(save_price.substring(save_price.length - 1, save_price));
                        var real_price = parseInt(price.substring(price.length - 1, price));
                        $("#cart_item_price" + v).text((save_price_int * value) + "원");
                    });
                    $("body").on("click", "#cart_item_minus" + i, function () {
                        var id = $(this).attr("id");
                        var v = parseInt(id.substring(id.length - 1, id.length));

                        var value = parseInt($("#cart_item_quantity" + v).attr("value"));
                        if (value == 1) {
                            alert("1개 이하로 내릴수 없습니다");
                            return false;
                        }
                        value--;
                        list[v].amount = value;
                        $("#cart_item_quantity" + v).val(value);
                        var price = $("#cart_item_price" + v).text();
                        var save_price = $("#cart_save_price" + v).text();

                        total -= parseInt(save_price);

                        $("#item_total_boo").html((total * 0.1) + " 원");
                        $("#item_total_gwa").html((total * 0.9) + " 원");
                        $("#item_total_price").html(total + " 원");

                        var save_price_int = parseInt(save_price.substring(save_price.length - 1, save_price));
                        var real_price = parseInt(price.substring(price.length - 1, price));
                        $("#cart_item_price" + v).text((save_price_int * value) + "원");
                    });

                }
            }




            $("#item_buy").click(function (e) {
                if(list.length!=0) {
                    var $form = $('<form></form>');
                    $form.attr('action', '/cream/customer/orderinput');
                    $form.attr('method', 'post');
                    $form.appendTo('body');
                    for (b = 0; b < list.length; b++) {
                        if (typeof list[b].amount == "undefined") {
                            list[b].amount = 1;
                        }
                        $form.append('<input type="hidden" value="' + list[b].srl + '" name="srl">');
                        $form.append('<input type="hidden" value="' + list[b].amount + '" name="amount">');
                        $form.append('<input type="hidden" value="' + list[b].itemsrl + '" name="itemsrl">');
                    }
                    $form.submit();
                } else {
                    swal("상품이 없어요");
                }
            });

            /*$("#fo").submit(function () {
                var list_json = JSON.stringify(list);
                $.ajax({
                    type:"post",
                    url:"/cream/customer/buy",
                    data: {item : list_json},
                    dataType:"text",
                    success: function (data) {
                        console.log(data);
                        if(data==1){
                            console.log('${ttt}');
                            return true;
                        }else{
                            return false;
                        }
                    }
                });
            });*/
        }

        function JSONtoString(object) {
            var results = [];
            for (var property in object) {
                var value = object[property];
                if (value)
                    results.push(property.toString() + ': ' + value);
            }

            return '{' + results.join(', ') + '}';
        }
    </script>
</head>
<!--/head-->

<body>
<jsp:include page="header.jsp"></jsp:include>

<section id="cart_items">
    <div class="container">
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active">Shopping Cart</li>
            </ol>
        </div>
        <div class="table-responsive cart_info">
            <table class="table table-condensed" id="cartView">
              

                </tbody>
            </table>
        </div>
    </div>
</section>
<!--/#cart_items-->

<section id="do_action">
    <div class="container">
        <div class="heading">
            <h3>상품 주문후 계산은 카운트에서 해주세요</h3>

            <p>주문 후 바로 상품을 준비합니다. 상품이 준비가 다된다면 호출해 드릴게요!</p>
        </div>
        <div class="row">
            <div class="col-sm-6">

            </div>
            <div class="col-sm-6">
                <div class="total_area">
                    <ul>
                        <li>과세금액 <span id="item_total_gwa"></span></li>
                        <li>부가세 <span id="item_total_boo"></span></li>
                        <li>총 금액 <span id="item_total_price"></span></li>
                    </ul>
                    <div>
                        <input type="button" class="btn btn-default check_out" id="item_buy" value="구매하기">
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
<!--/#do_action-->

<jsp:include page="footer.jsp"></jsp:include>

<script src="/cream/resources/js/bootstrap.min.js"></script>
<script src="/cream/resources/js/jquery.scrollUp.min.js"></script>
<script src="/cream/resources/js/jquery.prettyPhoto.js"></script>
</body>
</html>