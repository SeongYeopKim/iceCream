<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015-07-16
  Time: 오전 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta content="no" http-equiv="imagetoolbar" />

    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

    <!-- Latest compiled and minified JavaScript -->
<%--
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
--%>

    <style>
        /* CSS By NHN Nuli */

        .paginate_complex{padding:15px 0;line-height:normal;text-align:center}
        .paginate_complex a,
        .paginate_complex strong{display:inline-block;position:relative;z-index:2;margin:0 -3px;padding:1px 8px;border-left:1px solid #d6d6d6;border-right:1px solid #d6d6d6;background-color:#fff;font:bold 12px/16px Tahoma, Sans-serif;color:#323232;text-decoration:none;vertical-align:top}
        .paginate_complex a:hover,
        .paginate_complex a:active,
        .paginate_complex a:focus{background-color:#f8f8f8}
        .paginate_complex strong{color:#ff8600}
        .paginate_complex .direction{border:0;font-weight:normal;color:#767676;text-decoration:none !important;z-index:1}
        .paginate_complex .direction:hover,
        .paginate_complex .direction:active,
        .paginate_complex .direction:focus{color:#323232;background-color:#fff}
        .paginate_complex .sprev{border-left:0}
        .paginate_complex .snext{border-right:0}
        .paginate_complex .direction span{display:inline-block;position:relative;top:4px;width:0;height:0;font-size:0;line-height:0;vertical-align:top}
        .paginate_complex .sprev span{*left:-4px;margin-right:1px;border:3px solid;border-top:solid #fff;border-bottom:solid #fff;border-left:0}
        .paginate_complex .snext span{margin-left:1px;border:3px solid;border-top:solid #fff;border-bottom:solid #fff;border-right:0}
    </style>
    <title></title>
    <script type="text/javascript" language="javascript" charset="UTF-8" src="http://code.jquery.com/jquery-1.6.2.min.js"></script>

    <script type="text/javascript" language="javascript" charset="UTF-8" src="/resources/jquery.pagenavigator.js"></script>

    <script type="text/javascript">
        /*      $(document).ready(function () {
         $.ajax({
         url:"../item/default",
         method:"get",
         dataType:"text",
         success: function (responseData, status, xhr) {
         $.each(responseData, function (idx, value) {
         console.log(responseData[idx].toString());
         })
         }
         });
         });*/
      /*  $(document).ready(function () {
         $.getJSON("../item/default", function (data) {
         for(i=0; i<data.length; i++){
         $("#trView").after("<tr><td>"+data[i].srl+"</td><td>"+data[i].title+"</td><td>"+data[i].price+"</td><td>"+data[i].content+"</td><td>"+data[i].meterial+"</td></tr>");
         }
         });
         });*/
    /*    $(document).ready(function () {

            var defaultTr;
            defaultTr += "<tr id='trView'>"
            defaultTr += "<td>번호</td>";
            defaultTr += "<td>제목</td>";
            defaultTr += "<td>내용</td>";
            defaultTr += "<td>재료</td>";
            defaultTr += "</tr>"


            $.getJSON("../item/pagedList", {curpage:parseInt($(this).attr("value"))}, function (data1) {
                $("#tbView").html(defaultTr);
                var list1 = new Array();
                list1 = data1.list;

                for(c=0; c<list1.length; c++){
                    $("#tbView").append("<tr><td>"+list1[list1.length-c-1].srl+"</td><td>"+list1[list1.length-c-1].title+"</td><td>"+list1[list1.length-c-1].price+"</td><td>"+list1[list1.length-c-1].content+"</td><td>"+list1[list1.length-c-1].meterial+"</td></tr>");
                }
            });*/
        $(document).ready(function(){
            $.getJSON("../item/pagedList",{curpage:0}, function (data) {
                var list = data.list;
                var totalpage = parseInt((data.totalCount/data.perpage)+1);
                console.log(totalpage);
                for(i=0; i<list.length; i++){
                    $("#trView").after("<tr><td>"+list[list.length-i-1].srl+"</td><td>"+list[list.length-i-1].title+"</td><td>"+list[list.length-i-1].price+"</td><td>"+list[list.length-i-1].content+"</td><td>"+list[list.length-i-1].meterial+"</td></tr>");
                }
                for(a=0; a<totalpage; a++){
                    $("#page").append("<button id='btn"+a+"' value="+a+">"+(a+1)+"</button>");
                    $("body").on("click","#btn"+a, function(){

                        $.getJSON("../item/pagedList", {curpage:parseInt($(this).attr("value"))}, function (data1) {
                            $("#trView").nextAll().remove();
                            var list1 = data1.list;
                            console.log(list1.length);
                            for(c=0; c<list1.length; c++){
                                $("#trView").after("<tr><td>"+list1[list1.length-c-1].srl+"</td><td>"+list1[list1.length-c-1].title+"</td><td>"+list1[list1.length-c-1].price+"</td><td>"+list1[list1.length-c-1].content+"</td><td>"+list1[list1.length-c-1].meterial+"</td></tr>");
                            }

                        });
                    });
                }
            });
           /* $("body").on("click","button", function () {
               var a = $("button").attr("value");
                console.log(a);
            });*/
        /*    $("body").on("click",".btn",function () {
                var a = $("button".attr("value"));
                console.log(a);
            })*/



            });
    </script>
</head>
<body>
<table border="1">
    <div id="tbView"></div>
    <tr id="trView">
        <td>번호</td>
        <td>제목</td>
        <td>가격</td>
        <td>내용</td>
        <td>재료</td>
    </tr>
</table>
<div id="page"></div>
</body>
</html>
