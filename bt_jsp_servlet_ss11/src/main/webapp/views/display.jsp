<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 11/6/2023
  Time: 9:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<header id="header" class="container" >
    <div class="row g-3 align-items-center" style="margin: 1rem">
        <div class="col-auto">
            <div class="input-group">
                <form action="/ControllerServlet?action=search" method="post" style="display:flex;">
                    <input type="search" class="form-control rounded" placeholder="Tìm Kiếm" aria-label="Search" name="searchCountry"
                           aria-describedby="search-addon"/>
                    <button type="submit" class="btn btn-outline-primary">search</button>
                </form>
            </div>
        </div>
        <div class="col-auto" style="margin: 0">
            <a href="/ControllerServlet?action=sort" class="btn btn-primary">Xắp Xếp</a>
        </div>
    </div>
</header>
<table class="table caption-top container">
    <caption>List of users</caption>
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Họ và Tên</th>
        <th scope="col">Email</th>
        <th scope="col">Quốc Gia</th>
        <th><a href="views/users.jsp" class="btn btn-primary">Thêm Mới</a></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${ListUser}">
        <tr>
            <th scope="row">${user.getId()}</th>
            <td>${user.getName()}</td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
            <td>
                <!-- Button trigger modal -->
                <button type="button" onclick="transfer_data_delete(${user.getId()},'${user.getName()}')"
                        class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">Xóa
                </button>
                <a href="" class="btn btn-primary">Update</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<%--Modal Xác Nhận Xóa--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <form action="/ControllerServlet?action=delete" method="post">
        <div class="modal-dialog">
            <div class="modal-content">
                <input type="hidden" name="idHidden" id="idHidden">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Xác Nhận Xóa</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Bạn Có Muốn Xóa Thông Tin : <b id="displayfullname"></b></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Enter</button>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    function transfer_data_delete(id, fullname) {
        document.getElementById("idHidden").value = id;
        document.getElementById("displayfullname").value = fullname;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
