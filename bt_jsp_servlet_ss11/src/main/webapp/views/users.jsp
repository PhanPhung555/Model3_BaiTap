<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 11/6/2023
  Time: 8:29 PM
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
    body {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        display: grid;
        place-items: center;
        height: 100vh;
    }
    .mx-4 div{
        padding: 0.5rem 0;
    }
</style>
<body>
    <div class="container" style="border: 1px solid #334155">
        <form class="mx-4" action="/ControllerServlet?action=create" method="post">
            <div class="form-group">
                <label for="exampleInputEmail1">Họ và Tên</label>
                <input type="text" class="form-control" id="" aria-describedby="emailHelp" placeholder="Nhập Tên" name="fullname">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">Email </label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Nhập email" name="email">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Country</label>
                <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Country" name="country">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
            <button type="reset" class="btn btn-success" style="margin-left: 10px">Reset</button>
        </form>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
