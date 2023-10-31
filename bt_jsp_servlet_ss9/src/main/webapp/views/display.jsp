<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 10/31/2023
  Time: 8:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Home Display</h1>
    <p>Discount Amount<b><%=request.getAttribute("amount")%></b></p>
    <p>Discount Price<b><%=request.getAttribute("price")%></b></p>
</body>
</html>
