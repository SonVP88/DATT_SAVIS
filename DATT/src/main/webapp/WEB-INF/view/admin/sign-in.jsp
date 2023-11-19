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
                <div class="my-5 text-center">
                    <h3 class="font-weight-bold mb-3">Đăng Nhập</h3>
                    <p class="text-muted">Đăng nhập để tiếp tục</p>
                </div>
                <form action="/login" method="post">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <div class="form-icon-wrapper">
                            <input type="email" class="form-control" id="email" placeholder="Enter email" autofocus
                                   required name="taiKhoan">
                            <i class="form-icon-left mdi mdi-email"></i>
                        </div>
                    </div>
                    <label style="color: red">${tb==1?"Tài khoản hoặc mật khẩu không chính xác!":""}</label>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <div class="form-icon-wrapper">
                            <input type="password" class="form-control" id="password" placeholder="Enter password"
                                   required name="matKhau">
                            <i class="form-icon-left mdi mdi-lock"></i>
                            <a href="#" class="form-icon-right password-show-hide" title="Hide or show password">
                                <i class="mdi mdi-eye"></i>
                            </a>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="d-md-flex justify-content-between">
                            <div class="custom-control custom-checkbox mb-2 mb-md-0">
                                <input type="checkbox" class="custom-control-input" id="customCheck1" checked>
                                <label class="custom-control-label" for="customCheck1">Remember me</label>
                            </div>
                            <a href="/quenmk">Tôi đã quên mật khẩu!</a>
                        </div>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary btn-block" type="submit">Đăng Nhập</button>
                    </div>
                    <p class="text-center">
                        Bạn đã có tài khoản chưa?
                        <a href="/dangky">Tạo 1 tài khoản miễn phí</a>.
                    </p>
                    <div class="text-divider">or</div>
                    <div class="social-links justify-content-center">
                        <a href="http://localhost:4200" class="bg-google">
                            <i class="mdi mdi-google"></i>
                        </a>
                        <a href="#" class="bg-facebook">
                            <i class="mdi mdi-facebook"></i>
                        </a>
                        <a href="#" class="bg-twitter">
                            <i class="mdi mdi-twitter"></i>
                        </a>
                        <a href="#" class="bg-github">
                            <i class="mdi mdi-github"></i>
                        </a>
                    </div>
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
</body>
</html>
