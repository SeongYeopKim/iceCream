<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015-07-28
  Time: 오후 1:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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

</head>
<body>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
    var firstList;
    var lastList;


    //    $(function (e) {
    //       init();
    //        setInterval(function (e) {
    //            $("#view *").remove();
    //            init();
    //        },5000);
    //    });

    function init() {
        $.ajax({
            url: "/cream/customer/orderlist",
            method: "get",
            dataType: "json",
            success: function (data) {
                $("#cartView").append("<tr class='cart_menu'><td>주문한 사람</td><td>주문 내용</td><td>금액</td><td>주문 확인</td></tr>");
                for (i = 0; i < data.length; i++) {
                    var item = data[i].orderItemlist[0];
                    $("#view").append("<tr><td rowspan='" + data[i].orderItemlist.length + "'>"+ data[i].orders.title + "</td><td>"+"<img src='" + item.photo + "' width='100px' height='100px' alt=''>" + item.title + "\t" + item.amount + "개"
                    + "</td><td rowspan='" + data[i].orderItemlist.length + "'>" + data[i].orders.price + "원\t</td> <td rowspan='" + data[i].orderItemlist.length + "'>" + phase(data[i].orders.phase) + "</td></tr>");
                    for (k = 1; k < data[i].orderItemlist.length; k++) {
                        $("#view").append("<tr><td>" +"<img src='" + data[i].orderItemList[k].photo + "' width='100px' height='100px' alt=''>"+ data[i].orderItemlist[k].title + "\t" + data[i].orderItemlist[k].amount + "개" + "</td></tr>");
                    }
                }
            }
        });
    }
    function phase(e){
    	if(e==1){
    		return "결제완료";
    	}else
    		return "결제대기";
    }

    function firstgetting(){
        $.ajax({
            url: "/cream/customer/orderlist",
            method: "get",
            dataType: "json",
            success: function (data) {
                firstList=data;
                $("#cartView").append("<tr class='cart_menu'><td align='center'  width='20%'>주문한 사람</td><td align='center'  width='45%'>주문 내용</td><td align='center'  width='20%'>금액</td><td align='center'  width='15%'>주문 확인</td></tr>");
                for (i = 0; i < data.length; i++) {
                    var item = data[i].orderItemlist[0];
                    $("#cartView").append("<tr><td align='center'  rowspan='" + data[i].orderItemlist.length + "'>"+data[i].orders.title + "</td><td align='center' >" +"<img src='" + item.photo + "' width='100px' height='100px' alt=''>"+ item.title + "\t" + item.amount + "개"
                    + "</td><td align='center'  rowspan='" + data[i].orderItemlist.length + "'>" + data[i].orders.price + "원\t</td><td align='center'  rowspan='" + data[i].orderItemlist.length + "'>" + phase(data[i].orders.phase) + "</td></tr>");
                    for (k = 1; k < data[i].orderItemlist.length; k++) {
                        $("#cartView").append("<tr><td align='center' >"+"<img src='" + data[i].orderItemlist[k].photo + "' width='100px' height='100px' alt=''>" + data[i].orderItemlist[k].title + "\t" + data[i].orderItemlist[k].amount + "개" + "</td></tr>");
                    }
                }
            }
        });
    }

    function button_complete(e){
        var $form = $('<form></form>');
        $form.attr('action', '/cream/store/alterPhase');
        $form.attr('method', 'post');
        $form.appendTo('body');
        $form.append('<input type="hidden" value="' + e + '" name="srl">');
        $form.submit();
    }

    function lastgetting(){
        $.ajax({
            url: "/cream/customer/orderlist",
            method: "get",
            dataType: "json",
            success: function (data) {
                lastList=data;
            }
        })
    }

    $(function () {
        firstgetting();
    });
</script>
<table id="view">
</table>

<jsp:include page="../customer/header.jsp"></jsp:include>
<br><br><br>
<section id="cart_items">
    <div class="container">
        <div class="table-responsive cart_info">
            <table class="table table-condensed" id="cartView">
                <div ></div>
                </tbody>
            </table>
        </div>
    </div>
</section>
<!--/#cart_items-->
<!--/#do_action-->

<jsp:include page="../customer/footer.jsp"></jsp:include>
</body>
</html>