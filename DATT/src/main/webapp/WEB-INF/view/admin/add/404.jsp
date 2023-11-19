<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông báo</title>
    <style>
        /* CSS Reset để đảm bảo đồng nhất trên các trình duyệt */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Định dạng trang chính */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
            padding: 50px;
        }

        /* Phần tiêu đề */
        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        /* Phần nội dung */
        p {
            font-size: 16px;
            color: #666;
            margin-bottom: 30px;
        }

        /* Nút đăng nhập */
        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h1>Bạn không đủ quyền truy cập liên hệ với admin</h1>
<p>Bạn có thể quay lại trang trước hoặc đăng nhập với tài khoản khác.</p>
<button onclick="redirectToLogin()">Đăng nhập</button>

<script>
    function redirectToLogin() {
        // Chuyển hướng đến trang đăng nhập
        window.location.href = "/login";
    }
</script>
</body>
</html>
