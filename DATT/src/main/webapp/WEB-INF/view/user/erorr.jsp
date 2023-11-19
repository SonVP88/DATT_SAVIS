<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thành công</title>
    <style>
        body {
            text-align: center;
            margin-top: 100px;
            font-size: 24px;
        }
    </style>
</head>
<body>
<h1>Đặt hàng thất bại!</h1>
<script>
    setTimeout(function() {
        window.location.href = "/user/trang_chu/${idKh}";
    }, 1000);
</script>
</body>
</html>
