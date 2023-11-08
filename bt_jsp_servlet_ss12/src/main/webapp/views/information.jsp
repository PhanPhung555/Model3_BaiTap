<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 11/8/2023
  Time: 6:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/information.css">
</head>
<body>
<div class="container mx-box">
    <h1>Thông Tin Sản Phẩm</h1>
    <div class="mx-content">
       <c:forEach var="inform" items="${listinformation}">
           <p>Id Sản Phẩm : ${inform.getIdProduct()}</p>
           <p>Tên Sản Phẩm : ${inform.getNameProduct()}</p>
           <p>Gía sản Phẩm : ${inform.getPriceProduct()}</p>
           <p>Thông Tin Sản Phẩm : ${inform.getEvaluateProduct()}</p>
           <p><span>Thời Gian Đăng Kí : 22/12/2022</span> <span>Thời Gian Kết Thúc : 1/12/2024</span></p>
           <p>Chất Lượng Sản Phẩm : Tốt</p>
           <a class="btn btn-primary" href="/ControllerProductServlet?action=null">Quay Lại</a>
       </c:forEach>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
