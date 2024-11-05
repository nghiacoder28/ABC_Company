<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Schedule Campaign Details</title>
        <style>
            body {
                background-color: #e6f7ff; /* Light blue background */
            }
            .navbar {
                background-color: #0099cc; /* Darker blue for navbar */
            }
            .navbar-nav .nav-link {
                color: #000; /* Black text for nav links */
            }
            .navbar-nav .nav-link:hover {
                background-color: #007acc; /* Darker blue on hover */
                color: #fff; /* White text on hover */
            }
            .container {
                margin-top: 20px; /* Space from top */
            }
            h2 {
                color: #005b99; /* Header color */
            }
            .schedule-table {
                width: 100%;
                margin-top: 20px;
                border-collapse: collapse;
            }
            .schedule-table th, .schedule-table td {
                border: 1px solid #0099cc; /* Border color for table */
                padding: 10px;
                text-align: left;
            }
            .schedule-table th {
                background-color: #007acc; /* Header background color */
                color: white; /* Header text color */
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
                            <a class="nav-link" href="${pageContext.request.contextPath}/employee/list">Employee</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/logout">Log out</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <h2>Schedule Campaign Details for Plan ID: ${plid}</h2>

            <table class="schedule-table">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Department</th>
                        <th>Shift</th>
                        <th>Product</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="campaign" items="${scheduleCampaigns}">
                        <tr>
                            <td>${campaign.date}</td>
                            <td>${departmentName}</td>
                            <td>${campaign.shift}</td>
                            <td>${campaign.planCampaign.product.pName}</td>
                            <td>${campaign.quantity}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
