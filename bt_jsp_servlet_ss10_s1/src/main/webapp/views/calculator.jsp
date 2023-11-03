<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 11/1/2023
  Time: 8:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Simple Calculator</h1>
    <form action="/CalculatorServlet" method="post">
            <div>
            <label>First Operand</label>
            <input type="number" name="firstoperand">
        </div>
        <div>
            <label>Operation</label>
            <select name="culculator">
                <option value="cong">+</option>
                <option value="tru">-</option>
                <option value="nhan">*</option>
                <option value="chia">/</option>
            </select>
        </div>
        <div>
            <label>Second operand</label>
            <input type="number" name="secondoperand">
        </div>
        <button type="submit">Nhấn</button>
    </form>
</body>
</html>
