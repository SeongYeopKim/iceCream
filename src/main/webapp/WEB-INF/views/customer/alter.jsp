<%@ page import="kr.ice.cream.dto.CustomerDTO" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015-07-14
  Time: 오전 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  CustomerDTO dto = (CustomerDTO) session.getAttribute("customer");
%>
<form action="../customer/alterProcess" method="post">
아이디 : <%=dto.getId()%><input type="hidden" name="id" value="<%=dto.getId()%>">
비밀번호 : <input type="text" name="password" value="<%=dto.getPassword()%>">
  <input type="submit" value="수정하기">
</form>
</body>
</html>
