<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Production Plan List - Nguyen Vu Company</title>
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
            .status-dot {
                display: inline-block;
                width: 10px;
                height: 10px;
                border-radius: 50%;
            }
            .status-ongoing {
                background-color: green;
            }
            .status-late {
                background-color: red;
            }
            .status-complete {
                background-color: blue;
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
            <h2 class="title">Production Plan List </h2>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Plan ID</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Status</th>
                        <th>Schedule Campaign</th>
                        <th>Plan Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="plan" items="${plans}">
                        <tr>
                            <td>Kế Hoạch Số ${plan.plid}</td>
                            <td>${plan.startd}</td>
                            <td>${plan.endd}</td>
                            <td class="
                                <c:choose>
                                    <c:when test="${plan.status == 'On-going'}">status-ongoing</c:when>
                                    <c:when test="${plan.status == 'Late'}">status-late</c:when>
                                    <c:when test="${plan.status == 'Complete'}">status-complete</c:when>
                                </c:choose>">
                                <span class="status-dot
                                      <c:choose>
                                          <c:when test="${plan.status == 'On-going'}">status-ongoing</c:when>
                                          <c:when test="${plan.status == 'Late'}">status-late</c:when>
                                          <c:when test="${plan.status == 'Complete'}">status-complete</c:when>
                                      </c:choose>"></span>
                                <span class="status-text">${plan.status}</span>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/schedulecampaign/create?plid=${plan.plid}" class="btn btn-success btn-sm">Create</a>
                                <a href="${pageContext.request.contextPath}/schedulecampaign/list?plid=${plan.plid}" class="btn btn-info btn-sm">Detail</a>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/productionplan/detail?plid=${plan.plid}" class="btn btn-warning btn-sm">Plan Detail</a>
                                <a href="${pageContext.request.contextPath}/productionplan/update?plid=${plan.plid}" class="btn btn-warning btn-sm">Plan Update</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <a href="${pageContext.request.contextPath}/productionplan/creates" class="btn btn-success btn-sm">Plan Create</a>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
