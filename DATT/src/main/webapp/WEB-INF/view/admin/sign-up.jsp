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
                <div class="logo">
                    <img src="../../../resources/dist/images/logo-colorful.png" alt="logo">
                </div>
                <div class="text-center my-5">
                    <h3 class="font-weight-bold mb-3">Đăng Ký Tài Khoản</h3>
                    <p class="text-muted">Bạn có thể tạo 1 tài khoản miên phí ngay bây giờ</p>
                </div>
                <form action="/dangky-done" method="post">
                    <div class="form-group">
                        <label for="fullname">Họ và Tên</label>
                        <div class="form-icon-wrapper">
                            <input type="text" class="form-control" id="fullname" placeholder="Nhập đầy đủ họ và tên" autofocus name="Ten">
                            <i class="form-icon-left mdi mdi-account"></i>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input id="check" type="hidden" value="${tb}">
                        <label style="color: red">${tb==1?"Email đã có trên hệ thống!":""}</label>
                        <div class="form-icon-wrapper">
                            <input type="email" class="form-control" id="email" placeholder="Nhập email" required name="Email">
                            <i class="form-icon-left mdi mdi-email"></i>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <div class="form-icon-wrapper">
                            <input type="password" class="form-control" id="password" placeholder="Nhập mật khẩu" name="MatKhau">
                            <i class="form-icon-left mdi mdi-lock"></i>
                            <a href="#" class="form-icon-right password-show-hide" title="Hide or show password">
                                <i class="mdi mdi-eye"></i>
                            </a>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password-repeat">Retype password</label>
                        <div class="form-icon-wrapper">
                            <input type="password" class="form-control" id="password-repeat" placeholder="Nhập lại mật khẩu" name="MatKhau1">
                            <i class="form-icon-left mdi mdi-lock"></i>
                            <a href="#" class="form-icon-right password-show-hide" title="Hide or show password">
                                <i class="mdi mdi-eye"></i>
                            </a>
                        </div>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary btn-block" type="submit" onclick="validateForm(event)">Đăng ký</button>
                    </div>
                    <p class="text-center">Nếu bạn đã có tài khoản? <a href="/login">Đăng Nhập</a>.</p>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Jquery -->
<script src="../../../resources/dist/vendor/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../../../resources/dist/vendor/bootstrap-4.5.3/js/bootstrap.min.js"></script>
<!-- Latform scripts -->
<script src="../../../resources/dist/js/latform.min.js"></script>
<script>
    function validateForm(event) {
        var fullname = document.getElementById('fullname').value;
        var email = document.getElementById('email').value;
        var password = document.getElementById('password').value;
        var passwordRepeat = document.getElementById('password-repeat').value;

        if (fullname === '' || email === '' || password === '' || passwordRepeat === '') {
            alert('Vui lòng điền đầy đủ thông tin.');
            event.preventDefault();
        }
        if (password != passwordRepeat){
            alert('mật khẩu không giống nhau.');
            event.preventDefault();
        }
    }
</script>
</body>
</html>
