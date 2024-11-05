<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Login Page</title>
        <style>
            body {
                background-color: #e6f7ff; /* Màu nền xanh dương nhạt */
            }
            .login-container {
                max-width: 400px;
                margin: 100px auto;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                background-color: white;
            }
            h2 {
                text-align: center;
                color: #005b99; /* Màu chữ cho tiêu đề */
            }
            .error-message {
                color: red;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h2>Login</h2>
            <form action="login" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">Username:</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="mb-3 text-center">
                    <input type="submit" class="btn btn-primary" value="Login">
                </div>
                <div class="error-message">
                    <span>
                        <%= request.getAttribute("error") == null ? "" : request.getAttribute("error") %>
                    </span>
                </div>
            </form>
        </div>
    </body>
</html>
