<%@ page import="kr.ice.cream.dto.CustomerDTO" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015-07-14
  Time: 오전 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  CustomerDTO dto = (CustomerDTO)session.getAttribute("customer");
  String msg = (String)request.getAttribute("msg");
%>
아이디 : <%=dto.getId()%>
비밀번호 : <%=dto.getPassword()%>
<%=msg %>
</body>
</html>
