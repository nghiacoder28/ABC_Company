<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Home - Nguyen Vu Company</title>
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
                background-color: #0099cc; /* Màu nền khi hover */
                color: #fff; /* Màu chữ trắng khi hover */
            }
            .container {
                margin-top: 20px; /* Khoảng cách từ trên xuống */
            }
            h2 {
                color: #005b99; /* Màu chữ cho tiêu đề */
            }
            ul {
                list-style-type: none; /* Không hiển thị dấu chấm */
                padding-left: 0; /* Bỏ lề trái */
            }
            ul li {
                margin: 10px 0; /* Khoảng cách giữa các mục */
                font-size: 1.1em; /* Kích thước chữ lớn hơn */
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
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav"> <!-- Căn phải cho các nút -->
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link"><c:out value="${account.displayname}" /></a>
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
            <h2>Hướng dẫn sử dụng web</h2>
            <p>Chào mừng bạn đến với hệ thống quản lý của Công ty Nguyễn Vũ! Dưới đây là hướng dẫn sử dụng web:</p>
            <ul>
                <li><strong>Dashboard:</strong> Xem tổng quan về hoạt động của công ty.</li>
                <li><strong>Hồ sơ của tôi:</strong> Quản lý thông tin cá nhân và quyền hạn của bạn.</li>
                <li><strong>Cài đặt:</strong> Thay đổi cài đặt tài khoản của bạn.</li>
                <li><strong>Đăng xuất:</strong> Nhấp vào nút "Đăng xuất" để kết thúc phiên làm việc của bạn.</li>
            </ul>
            <p>Nếu bạn gặp vấn đề hoặc cần trợ giúp thêm, hãy liên hệ với bộ phận hỗ trợ.</p>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
