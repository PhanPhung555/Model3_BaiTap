<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 11/8/2023
  Time: 9:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/create.css">
</head>
<body>
<div class="container mx-2">
    <h1 style="text-align: center">Đăng Kí Sản Phẩm</h1>
    <c:forEach var="product" items="${lists}">
    <form action="/ControllerProductServlet?action=update&id=${product.getIdProduct()}" method="post">
           <div class="mb-3">
               <label for="exampleInputEmail1" class="form-label">Tên Sản Phẩm</label>
               <input type="text" value="${product.getNameProduct()}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="nameProduct" required>
           </div>
           <div class="mb-3">
               <label for="exampleInputPassword1" class="form-label">Gía Sản Phẩm</label>
               <input type="number" value="${product.getPriceProduct()}" class="form-control" id="exampleInputPassword1"  name="priceProduct" required>
           </div>
           <div class="mb-3">
               <label for="exampleInputPassword1" class="form-label">Đánh Gía Sản Phẩm</label>
               <input type="text" value="${product.getEvaluateProduct()}" class="form-control" id="" name="evaluateProduct" required>
           </div>
        <button type="submit" class="btn btn-primary">Submit</button>
        <button type="reset" class="btn btn-primary">Reset</button>
    </form>
    </c:forEach>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
