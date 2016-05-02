<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015-07-13
  Time: 오후 6:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function() {
          $("#password").focus(function(e){
             $.ajax({
              url:"../customer/idDupCheck",
              method:"post",
              data: {id: $("#id").attr("value")},
              dataType:"text",
              success:function(responseData, status, xhr){
                if(responseData==1){
                	 $("#result").text("아이디 사용가능");
                }else if(responseData==0){
                	 $("#result").text("아이디 중복, 사용불가")
                }
              } 
            });
          });
      });
    </script>
</head>
<body>
<form action="../customer/joinProcess" method="POST">
<table border="1">
  <tr>
    <td>아이디</td>
    <td><input id="id" type="text" name="id"><div id="result"></div></td>
  </tr>
  <tr>
    <td>비밀번호</td>
    <td><input id="password" type="text" name="password"></td>
  </tr>
</table>
  <input type="submit" value="가입">
</form>
</body>
</html>
