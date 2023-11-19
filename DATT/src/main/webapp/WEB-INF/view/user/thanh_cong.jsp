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
<h1>Đặt hàng thành công!</h1>
<p>Cảm ơn bạn đã mua hàng. Đơn hàng của bạn đã được xử lý thành công.</p>
<p>Thông tin chi tiết và hóa đơn đã được gửi vào địa chỉ email của bạn.</p>
<script>
    setTimeout(function() {
        window.location.href = "/user/trang_chu/${idKh}";
    }, 1000);
</script>
</body>
</html>
