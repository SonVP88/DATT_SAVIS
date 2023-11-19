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
    <style>
        .navbar-light .navbar-nav .nav-link:hover {
            background: #fff3c6;
            color: red; /* Change this to the desired hover color */
        }
    </style>
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
                    <h3 class="font-weight-bold mb-3">Thay đổi mật khẩu</h3>
                </div>
                <form id="myForm" action="/user/repass-done/${kh.ma}" method="post">
                    <div class="form-group">
                        <label for="password">Mật khẩu mới</label>
                        <input type="hidden" value="${id}" name="id">
                        <div class="form-icon-wrapper">
                            <input type="password" class="form-control" id="password" placeholder="Enter password" autofocus
                                   required name="password">
                            <i class="form-icon-left mdi mdi-lock"></i>
                            <a href="#" class="form-icon-right password-show-hide" title="Hide or show password">
                                <i class="mdi mdi-eye"></i>
                            </a>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password2">Nhập lại mật khẩu mới</label>
                        <div class="form-icon-wrapper">
                            <input type="password" class="form-control" id="password2" placeholder="Enter password" autofocus
                                   required>
                            <i class="form-icon-left mdi mdi-lock"></i>
                            <a href="#" class="form-icon-right password-show-hide" title="Hide or show password">
                                <i class="mdi mdi-eye"></i>
                            </a>
                        </div>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary btn-block" id="submitBtn">Thay đổi</button>
                    </div>
                </form>
                <p class="text-center">Bạn có thể <a href="/login">đăng nhập</a> hoặc <a href="/dangky">tạo mới tài khoản</a>.</p>
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
    document.getElementById("myForm").addEventListener("submit", function (event) {
        const password = document.getElementById("password").value;
        const password2 = document.getElementById("password2").value;

        if (password === "" || password2 === "") {
            alert("Vui lòng điền đầy đủ thông tin mật khẩu mới và nhập lại mật khẩu mới.");
            event.preventDefault(); // Ngăn chặn việc gửi biểu mẫu
            return 0;
        }
        if (password != password2){
            alert("Mật khẩu phải giống nhau.");
            event.preventDefault(); // Ngăn chặn việc gửi biểu mẫu
        }
        else{
            alert("thành công");
        }
    });
</script>
</body>
</html>
