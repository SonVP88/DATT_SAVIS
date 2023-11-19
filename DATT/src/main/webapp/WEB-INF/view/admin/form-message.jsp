<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Latform - Login and Register Form Templates</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="../../../resources/dist/vendor/bootstrap-4.5.3/css/bootstrap.min.css" type="text/css">
    <!-- Material design icons -->
    <link rel="stylesheet" href="../../../resources/dist/icons/material-design-icons/css/mdi.min.css" type="text/css">
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&display=swap" rel="stylesheet">
    <!-- Latform styles -->
    <link rel="stylesheet" href="../../../resources/dist/css/latform-style-1.min.css" type="text/css">
</head>
<body>
<div class="form-wrapper">
    <div class="container">
        <div class="card">
            <div class="card-body">
                <div class="text-center">
                    <h3 class="font-weight-bold mb-3">Thành công!</h3>
                    <p class="text-muted">Đã gửi biểu mẫu thành công. Kiểm tra hộp thư đến của bạn để đặt lại mật khẩu.</p>
                    <div class="row mb-5">
                        <div class="col-md-8 offset-md-2">
                            <img class="img-fluid" src="../../../resources/dist/images/send_mail.svg"
                                 alt="send_mail">
                        </div>
                    </div>
                    <a href="/login">Quay Lại</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Jquery -->
<script src="../../../resources/dist/vendor/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../../../resources/dist/vendor/bootstrap-4.5.3/js/bootstrap.min.js"></script>
</body>
</html>
