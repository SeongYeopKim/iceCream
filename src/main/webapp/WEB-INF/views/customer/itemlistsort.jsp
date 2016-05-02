<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015-07-18
  Time: 오후 2:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.getJSON("../item/default", function (data) {
                var list = data;
                var perpage = 16;
                var totalpage = parseInt(list.length/perpage)+1;
                for(i=0; i<perpage; i++){
                    $("#trView").after("<tr><td>"+list[perpage-i-1].srl+"</td><td>"+list[perpage-i-1].title+"</td><td>"+list[perpage-i-1].price+"</td><td>"+list[perpage-i-1].content+"</td><td>"+list[perpage-i-1].meterial+"</td></tr>");
                }
                for(a=0; a<totalpage; a++){
                    $("#page").append("<button id='btn"+a+"' value="+a+">"+(a+1)+"</button>");
                    $("body").on("click","#btn"+a, function () {
                        $("#trView").nextAll().remove();
                        var perpagestorage = 16;

                        var cur = parseInt($(this).attr("value"));
                        var end =(perpage*(cur+1)<list.length) ? perpage*(cur+1):list.length;

                        if(cur==(totalpage-1)){
                            perpagestorage = list.length-(perpagestorage*cur);
                        }
                        for(c=0; c<perpagestorage; c++){
                            $("#trView").after("<tr><td>"+list[end-c-1].srl+"</td><td>"+list[end-c-1].title+"</td><td>"+list[end-c-1].price+"</td><td>"+list[end-c-1].content+"</td><td>"+list[end-c-1].meterial+"</td></tr>");
                        }
                    });
                }
            });
        });
    </script>
</head>
<body>
<div align="center">
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
</div>
<div id="page" align="center"></div>

</body>
</html>
