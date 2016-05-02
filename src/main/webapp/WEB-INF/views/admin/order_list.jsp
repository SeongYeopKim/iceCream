<%@ page import="kr.ice.cream.dto.CustomizedPageDTO" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015-07-29
  Time: 오후 1:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
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
<script type="text/javascript">
  var ee = '${curpage}';
  if(ee==0||ee==null){
    ee=1;
  }
  $(document).ready(function () {
    console.log(ee);
    init(ee);
  });

  function init(ee){
    $.ajax({
      type: "get",
      url: "/cream/store/order_data",
      data: {curpage: ee},
      dataType: "json",
      success: function (data1) {
        var data = data1.list;
        $("#cartView").append("<tr class='cart_menu'><td align='center'  width='20%'>주문한 사람</td><td align='center'  width='45%'>주문 내용</td><td align='center'  width='20%'>금액</td></tr>");
        for (i = 0; i < data.length; i++) {
          var item = data[i].orderItemlist[0];
          if (data[i].orderItemlist.length > 1) {
            $("#cartView").append("<tr><td style='border-bottom:1pt solid black' align='center'  rowspan='" + data[i].orderItemlist.length + "'>" + data[i].orders.title + "</td><td align='center' >" + item.title + "\t" + item.amount + "개"
            + "</td><td style='border-bottom:1pt solid black' align='center'  rowspan='" + data[i].orderItemlist.length + "'>" + data[i].orders.price + "원\t</td></tr>");
          } else {
            $("#cartView").append("<tr><td style='border-bottom:1pt solid black' align='center'  rowspan='" + data[i].orderItemlist.length + "'>" + data[i].orders.title + "</td><td style='border-bottom:1pt solid black' align='center' align='center' >" + item.title + "\t" + item.amount + "개"
            + "</td><td style='border-bottom:1pt solid black' align='center'  rowspan='" + data[i].orderItemlist.length + "'>" + data[i].orders.price + "원\t</td></tr>");
          }
          for (k = 1; k < data[i].orderItemlist.length; k++) {
            if (data[i].orderItemlist.length > 2) {
              if(k== data[i].orderItemlist.length-1){
                $("#cartView").append("<tr><td style='border-bottom:1pt solid black' align='center' align='center' >" + data[i].orderItemlist[k].title + "\t" + data[i].orderItemlist[k].amount + "개" + "</td></tr>");
              } else {
                $("#cartView").append("<tr><td align='center' >" + data[i].orderItemlist[k].title + "\t" + data[i].orderItemlist[k].amount + "개" + "</td></tr>");

              }
            } else {
              $("#cartView").append("<tr><td style='border-bottom:1pt solid black' align='center' align='center' >" + data[i].orderItemlist[k].title + "\t" + data[i].orderItemlist[k].amount + "개" + "</td></tr>");
            }
          }


        }

        var page = parseInt(data1.totalCount/data1.perpage)+1;
        for (n=0; n<page; n++) {
          $("#page").append("<button id='btn" + n + "' value=" + n + ">" + (n + 1) + "</button>");
          $("body").on("click", "#btn" + n, function () {
            var cur = parseInt($(this).attr("value"));
            location.href = "/cream/store/order_list?curpage=" + (parseInt(cur)+1);
          });
        }
      }
    });
  }
</script>
<h1 align="center">주문 리스트</h1>
<div align="right"><a href="/cream/admin/">관리자 페이지로 돌아가기</a></div>
<br>
<section id="cart_items">
  <div class="container">
    <div class="table-responsive cart_info">

      <table class="table table-condensed" id="cartView">
        <div ></div>
        </tbody>
      </table>
    </div>
    <div id="page" align="center"></div>
  </div>
</section>
</body>
</html>
