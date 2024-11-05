<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Production Plan Detail - Nguyen Vu Company</title>
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
                            <a class="nav-link" href="${pageContext.request.contextPath}/home.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/productionplan/list">Plan</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/employee/list">Employee</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/attendance/detail">Attendance</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/logout">Log out</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <h2 class="text-center">Production Plan Detail</h2>
            <table class="table table-bordered table-striped mt-3">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Made Quantity</th>
                        <th>Total Quantity</th>
                        <th>Status</th>
                        <th>Date Range</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="campaign" items="${plan.campaigns}">
                        <tr>
                            <td>${campaign.product.pName}</td>
                            <td>${campaign.madeQuantity}</td>
                            <td>${campaign.quantity}</td>
                            <td>
                                <span class="status-dot
                                      <c:choose>
                                          <c:when test="${campaign.madeQuantity >= campaign.quantity}">text-success</c:when>
                                          <c:otherwise>text-warning</c:otherwise>
                                      </c:choose>">
                                    <c:choose>
                                        <c:when test="${campaign.madeQuantity >= campaign.quantity}">Complete</c:when>
                                        <c:otherwise>On-going</c:otherwise>
                                    </c:choose>
                                </span>
                            </td>
                            <td>${plan.startd} - ${plan.endd}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="text-center mt-3">
                <a href="${pageContext.request.contextPath}/productionplan/list" class="btn btn-primary">Back to List</a>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
