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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<style>
    .mx-2{
        padding: 0.5rem;
    }
</style>
<body>
<div class="container">
    <div class="row">
        <form action="${pageContext.request.contextPath}/ControllerServlet" method="post">
            <div class="form-group col-12 mx-2">
                <label for="exampleInputEmail1">Product Description</label>
                <input name="productDescription" type="email" class="form-control" id="exampleInputEmail1"
                       aria-describedby="emailHelp" placeholder="Enter email">
            </div>
            <div class="form-group col-12 mx-2">
                <label for="exampleInputPassword1">List Price</label>
                <input name="listPrice" type="number" class="form-control" id="exampleInputPassword1"
                       placeholder="listPrice">
            </div>
            <div class="form-group col-12 mx-2">
                <label for="exampleInputPassword1">Discount Percent</label>
                <input name="discountPercent" type="number" class="form-control" placeholder="discountPercent">
            </div>
            <button type="submit" class="btn btn-primary mx-2">Calculate Discount</button>
        </form>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
