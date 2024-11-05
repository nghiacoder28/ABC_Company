<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/mytags.tld" prefix="mytag" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Create Schedule Campaign</title>
        <style>
            body {
                background-color: #e6f7ff; /* Màu nền xanh dương nhạt */
            }
            .navbar {
                background-color: #0099cc; /* Thanh navbar màu xanh dương nhạt */
            }
            .navbar-nav .nav-link {
                color: #000; /* Màu chữ đen cho các liên kết */
            }
            .navbar-nav .nav-link:hover {
                background-color: #007acc; /* Màu nền khi hover */
                color: #fff; /* Màu chữ trắng khi hover */
            }
            .container {
                margin-top: 20px; /* Khoảng cách từ trên xuống */
            }
            h2 {
                color: #005b99; /* Màu chữ cho tiêu đề */
            }
            .input-cell {
                width: 70px; /* Độ rộng cho ô nhập liệu */
            }
            .create-button {
                background-color: #28a745; /* Màu nền cho nút tạo */
                color: white; /* Màu chữ trắng */
                border: none; /* Không có viền */
                padding: 10px 20px; /* Padding cho nút */
                cursor: pointer; /* Con trỏ khi hover */
                margin-top: 10px; /* Khoảng cách trên cho nút */
            }
            .create-button:hover {
                background-color: #218838; /* Màu nền khi hover */
            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Nguyen Vu Company</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link"><c:out value="${account.displayname}" /></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="home.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="">Plan</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/employee/list">Employee</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="">Report</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="">Attendance</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/logout">Log out</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <h2>Create Schedule Campaign for Plan ID: ${plan.plid}</h2>
            <p>Plan start at date: <mytag:ToVietnameseDate value="${plan.startd}" /></p>
            <form action="${pageContext.request.contextPath}/schedulecampaign/create" method="post">
                <input type="hidden" name="plid" value="${plan.plid}" />
                <table class="table table-bordered table-striped schedule-table">
                    <thead>
                        <tr>
                            <th rowspan="2" class="product-header">Product</th>
                                <c:forEach var="date" items="${dates}">
                                <th colspan="3">${date}</th>
                                </c:forEach>
                        </tr>
                        <tr>
                            <c:forEach var="date" items="${dates}">
                                <th>K1</th>
                                <th>K2</th>
                                <th>K3</th>
                                </c:forEach>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${products}">
                            <tr>
                                <td class="product-header">${product.pName}</td>
                                <c:forEach var="date" items="${dates}">
                                    <td><input type="text" name="quantity_${product.pID}_K1_${date}" class="input-cell"  /></td>
                                    <td><input type="text" name="quantity_${product.pID}_K2_${date}" class="input-cell"  /></td>
                                    <td><input type="text" name="quantity_${product.pID}_K3_${date}" class="input-cell"  /></td>
                                    </c:forEach>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <button type="submit" class="create-button">Create Schedule Campaign</button>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
