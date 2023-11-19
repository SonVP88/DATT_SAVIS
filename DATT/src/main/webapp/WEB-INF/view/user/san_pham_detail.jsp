<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>MultiShop - Online Shop Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="../../../resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">


    <!-- Libraries Stylesheet -->
    <link href="../../../resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="../../../resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../../../resources/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <style>
        .gia {
            color: red;
            font-weight: bold;
            font-size: larger;
        }

        .gia del {
            color: gray;
        }

        input[type="radio"] {
            display: none;
        }

        /* Tạo hình vuông tùy chỉnh và tạo một hình vuông giả bằng cách sử dụng một phần tử div */
        label.radio-label {
            display: inline-flex;
            align-items: center; /* Căn giữa theo chiều dọc */
            position: relative;
            cursor: pointer;
        }

        label.radio-label::before {
            content: " ";
            display: inline-block;
            width: 130%; /* Độ rộng hình vuông */
            height: 130%; /* Chiều cao hình vuông */
            border: 0.5px solid #6e7881; /* Viền */
            background-color: transparent; /* Màu nền */
            position: absolute; /* Điều chỉnh khoảng cách giữa hình vuông và label */
            top: 0;
            border-radius: 4px; /* Độ cong viền */
        }

        /* Điều khiển màu nền của hình vuông khi được chọn */
        input[type="radio"]:checked + label.radio-label::before {
            border: 2px solid #ffa500; /* Đổi màu border thành màu cam */
        }

        /* Tạo góc bên dưới bên phải màu cam */
        input[type="radio"]:checked + label.radio-label::after {
            content: "";
            position: absolute;
            bottom: 58%; /* Điều chỉnh vị trí theo chiều dọc */
            right: -30%; /* Điều chỉnh vị trí theo chiều ngang */
            width: 20px; /* Độ rộng của góc cam */
            height: 12px; /* Chiều cao của góc cam */
            background-color: #ffa500; /* Màu cam */
            clip-path: polygon(100% 0, 0 0, 100% 100%);
        }
    </style>
    <style>
        .comment-container {
            max-width: 94%;
            margin-left: 50px;
        }

        .comment {
            border: 1px solid #ddd;
            margin-bottom: 10px;
            padding: 10px;
            background: white;
        }

        .comment1 {
            border: 1px solid #ddd;
            margin-bottom: 10px;
            padding: 10px;
            background: #ffebe6;
            font-size: 25px;
            color: #ff6600;
            width: 100%;
            height: 140px;
        }

        .pagination {
            display: flex;
            justify-content: center;
            list-style: none;
        }

        .pagination li {
            margin: 5px;
            cursor: pointer;
        }

        .pagination li.active {
            font-weight: bold;
        }

        .stars1::before {
            content: "★";
            color: #ff6600;
        }

        .stars2::before {
            content: "★★";
            color: #ff6600;
        }

        .stars3::before {
            content: "★★★";
            color: #ff6600;
        }

        .stars4::before {
            content: "★★★★";
            color: #ff6600;
        }

        .stars5::before {
            content: "★★★★★";
            color: #ff6600;
        }

        .end1::before {
            content: "★";
            color: grey;
        }

        .end2::before {
            content: "★★";
            color: grey;
        }

        .end3::before {
            content: "★★★";
            color: grey;
        }

        .end4::before {
            content: "★★★★";
            color: grey;
        }

        .end5::before {
            content: "★★★★★";
            color: grey;
        }

        .test1::before {
            content: "★";
            background: linear-gradient(90deg, #ff6600 20%, grey 10%, grey 60%);
            -webkit-background-clip: text;
            color: transparent;
        }

        .test2::before {
            content: "★";
            background: linear-gradient(90deg, #ff6600 27%, grey 10%, grey 60%);
            -webkit-background-clip: text;
            color: transparent;
        }

        .test3::before {
            content: "★";
            background: linear-gradient(90deg, #ff6600 33%, grey 10%, grey 60%);
            -webkit-background-clip: text;
            color: transparent;
        }

        .test4::before {
            content: "★";
            background: linear-gradient(90deg, #ff6600 42%, grey 10%, grey 60%);
            -webkit-background-clip: text;
            color: transparent;
        }

        .test5::before {
            content: "★";
            background: linear-gradient(90deg, #ff6600 50%, grey 10%, grey 60%);
            -webkit-background-clip: text;
            color: transparent;
        }

        .test6::before {
            content: "★";
            background: linear-gradient(90deg, #ff6600 58%, grey 10%, grey 60%);
            -webkit-background-clip: text;
            color: transparent;
        }

        .test7::before {
            content: "★";
            background: linear-gradient(90deg, #ff6600 67%, grey 10%, grey 60%);
            -webkit-background-clip: text;
            color: transparent;
        }

        .test8::before {
            content: "★";
            background: linear-gradient(90deg, #ff6600 73%, grey 10%, grey 60%);
            -webkit-background-clip: text;
            color: transparent;
        }

        .test9::before {
            content: "★";
            background: linear-gradient(90deg, #ff6600 80%, grey 10%, grey 60%);
            -webkit-background-clip: text;
            color: transparent;
        }

        .test10::before {
            content: "★";
            background: linear-gradient(90deg, #ff6600 100%, grey 10%, grey 60%);
            -webkit-background-clip: text;
            color: transparent;
        }

        .pagination {
            display: flex;
            justify-content: center;
            list-style: none;
            padding: 0;
        }

        /* Thiết lập kiểu cho các nút trước và sau */
        .prev-page, .next-page {
            width: 80px;
            text-align: center;
            background-color: #007bff;
            color: #fff;
            padding: 10px 15px;
            border-radius: 5px;
            margin: 0 5px;
            cursor: pointer;
        }

        /* Hiệu ứng hover cho nút */
        .prev-page:hover, .next-page:hover {
            background-color: #0056b3;
        }

        /* Hiệu ứng active khi nút được nhấp */
        .prev-page:active, .next-page:active {
            background-color: #003d80;
        }

        input[type="checkbox"] {
            display: none;
        }

        label.checkbox-label {
            display: inline-flex;
            align-items: center;
            position: relative;
            cursor: pointer;
            margin-right: 20px;
        }

        label.checkbox-label::before {
            content: " ";
            display: inline-block;
            width: 80px; /* Độ rộng hình vuông */
            height: 40px; /* Chiều cao hình vuông */
            border: 0.5px solid #6e7881; /* Viền */
            background-color: transparent; /* Màu nền */
            position: absolute; /* Điều chỉnh khoảng cách giữa hình vuông và label */
            top: 0;
            border-radius: 4px; /* Độ cong viền */
        }

        input[type="checkbox"]:checked + label.checkbox-label::before {
            border: 2px solid #ffa500; /* Đổi màu border thành màu cam */
        }
        label.checkbox-label1{
            background: white;
            width: 80px;height: 40px;
            border-radius: 4px;
            padding-left: 15px;
            font-size: 20px;
            padding-top: 5px
        }
    </style>
    <style>
        /* CSS cho hiệu ứng chạy thời gian 2s */
        .swal2-popup {
            position: relative;
        }

        .swal2-popup .progress-bar-container {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background-color: #007bff; /* Màu của thanh thời gian */
            animation: slide-out 2s linear; /* Hiệu ứng chạy thời gian 2s */
        }

        @keyframes slide-out {
            0% {
                width: 100%;
            }
            100% {
                width: 0%;
            }
        }
        .navbar-light .navbar-nav .nav-link:hover {
            background: #fff3c6;
            color: red; /* Change this to the desired hover color */
        }
    </style>
</head>

<body>
<!-- Topbar Start -->
<div class="container-fluid">
    <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
        <div class="col-lg-4">
            <a href="/user/trang_chu/${idKh}" class="text-decoration-none">
                <span class="h1 text-uppercase text-primary bg-dark px-2">Shop</span>
                <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Ao</span>
            </a>
        </div>
        <div class="col-lg-4 col-6 text-left">
            <form method="post">
                <div class="input-group">
                    <input type="text" class="form-control" name="timKiem" placeholder="Search for products">
                    <div class="input-group-append">
                        <button class="input-group-text bg-transparent text-primary"
                                formaction="/user/tim_kiem/${idKh}">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-4 col-6 text-right">
            <p class="m-0">Customer Service</p>
            <h5 class="m-0">+012 345 6789</h5>
        </div>
    </div>
</div>
<!-- Topbar End -->


<!-- Navbar Start -->
<div class="container-fluid bg-dark mb-30">
    <div class="row px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse"
               href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Thể loại</h6>
                <i class="fa fa-angle-down text-dark"></i>
            </a>
            <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light"
                 id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                <div class="navbar-nav w-100">
                    <c:forEach items="${listLoaiAos}" var="list">
                        <a href="/user/loc_theo_loai_ao/${idKh}/${list.ma}" class="nav-item nav-link">${list.ten}</a>
                    </c:forEach>
                </div>
            </nav>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="/user/trang_chu/${idKh}" class="nav-item nav-link active">Trang chủ</a>
                        <a href="/user/shop/${idKh}" class="nav-item nav-link">Cửa hàng</a>
                        <a href="/user/contact/${idKh}" class="nav-item nav-link">Thông tin cửa hàng</a>
                        <a href="/user/blog/${idKh}" class="nav-item nav-link">Bài viết</a>
                    </div>
                    <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                        <c:choose>
                            <c:when test="${idKh != 2}">
                                <a href="/user/don_hang/${idKh}" class="btn px-0">
                                    <i class="fa fa-user"></i>
                                    <span class="badge text-secondary border border-secondary rounded-circle"
                                          style="padding-bottom: 2px;">${idKh}</span>
                                </a>
                                <a href="/user/gio_hang/view/${idKh}" class="btn px-0 ml-3">
                                    <i class="fas fa-shopping-cart text-primary"></i>
                                    <span class="badge text-secondary border border-secondary rounded-circle"
                                          style="padding-bottom: 2px;">${soLuongSanPham}</span>
                                </a>
                            </c:when>
                            <c:when test="${idKh == 2}">
                                <a href="/login" class="btn px-0 ml-3">
                                    <i class="fas fa-user text-primary"></i>
                                </a>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- Navbar End -->


<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="#">Home</a>
                <a class="breadcrumb-item text-dark" href="#">Shop</a>
                <span class="breadcrumb-item active">Shop Detail</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Shop Detail Start -->
<div class="container-fluid pb-5">
    <div class="row px-xl-5">
        <div class="col-lg-5 mb-30">
            <div id="product-carousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner bg-light">
                    <c:forEach items="${anhs}" var="list" varStatus="status">
                        <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                            <img class="" style="width: 100%; height: 450px" src="/images/${list.ten_url}" alt="Image">
                        </div>
                    </c:forEach>
                </div>
                <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                    <i class="fa fa-2x fa-angle-left text-dark"></i>
                </a>
                <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                    <i class="fa fa-2x fa-angle-right text-dark"></i>
                </a>
            </div>
        </div>

        <div class="col-lg-7 h-auto mb-30">
            <div class="h-100 bg-light p-30">
                <h3>${ao.ten}</h3>
                <c:choose>
                    <c:when test="${giamgia != 2}">
                        <div class="gia">
                            <p>
                                <del><fmt:formatNumber value="${ao.giaBan}" type="currency" currencySymbol="VNĐ"/></del>
                                <strong><fmt:formatNumber value="${ao.giaBan * (100 - giamgia) / 100}" type="currency"
                                                          currencySymbol="VNĐ"/></strong>
                            </p>
                        </div>
                    </c:when>
                    <c:when test="${giamgia == 2}">
                        <div class="gia">
                            <p>
                                <strong><fmt:formatNumber value="${ao.giaBan}" type="currency"
                                                          currencySymbol="VNĐ"/></strong>
                            </p>
                        </div>
                    </c:when>
                </c:choose>
                <div><h6><strong>${slAoDaBan}</strong> sản phẩm đã bán</h6></div>
                <div id="soLuongTonStr"></div>
                <input type="hidden" id="soLuongTon">
                <form method="post">
                    <input type="hidden" name="idAo" value="${ao.id}" id="idAo">
                    <div class="d-flex mb-4">
                        <strong class="text-dark mr-3">Colors:</strong>
                        <c:forEach items="${mauSacs}" var="list" varStatus="vTri">
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="radio${vTri.index + 1}" name="mauSac" value="${list.id}">
                                <label class="radio-label" for="radio${vTri.index + 1}"><span
                                        style="padding-left: 10px;padding-top: 5px">${list.ten}</span></label>

                                    <%--                                <input type="radio" class="custom-control-input" id="color-${vTri.index + 1}" name="mauSac" value="${list.id}">--%>
                                    <%--                                <label class="custom-control-label" for="color-${vTri.index + 1}">${list.ten}</label>--%>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="d-flex mb-3">
                        <strong class="text-dark mr-3">Sizes:</strong>
                        <c:forEach items="${sizes}" var="list" varStatus="vTri">
                            <div class="custom-control custom-radio custom-control-inline" style="margin-left: 8px">
                                <input type="radio" id="size${vTri.index + 1}" name="size" value="${list.id}">
                                <label class="radio-label" for="size${vTri.index + 1}"><span
                                        style="padding-left: 10px;padding-top: 5px">${list.ten}</span></label>

                                    <%--                                <input type="radio" class="custom-control-input" id="size-${vTri.index + 1}" name="size" value="${list.id}">--%>
                                    <%--                                <label class="custom-control-label" for="size-${vTri.index + 1}">${list.ten}</label>--%>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="d-flex align-items-center mb-4 pt-2">
                        <div class="input-group quantity mr-3" style="width: 130px;" id="mauSacAndSize">
                            <div class="input-group-append">
                                <button class="btn btn-primary btn-minus" type="button" onclick="decreaseQuantity()">
                                    <i class="fa fa-minus"></i>
                                </button>
                                <input type="text" class="form-control bg-secondary border-0 text-center" value="1"
                                       name="sl" id="quantityInput">
                                <button class="btn btn-primary btn-plus" type="button" onclick="increaseQuantity()">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                        <input type="hidden" name="idKh" value="${idKh}">
                        <button class="btn btn-primary px-3" formaction="/user/gio_hang/add_gio_hang/${idKh}"
                                onclick="addProduct()"><i class="fa fa-shopping-cart mr-1"></i> Add To
                            Cart
                        </button>
                    </div>
                </form>
                <div class="d-flex pt-2">
                    <strong class="text-dark mr-2">Share on:</strong>
                    <div class="d-inline-flex">
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-pinterest"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row px-xl-5">
        <div class="col">
            <div class="bg-light p-30">
                <div class="nav nav-tabs mb-4">
                    <a class="nav-item nav-link text-dark active" data-toggle="tab" href="#tab-pane-1">Miêu tả</a>
                    <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-2">Thông tin</a>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab-pane-1">
                        <h4 class="mb-3">Miêu tả</h4>
                        <ul>
                            <li>${ao.moTa}</li>
                            <li>${ao.chatVai.thongtin}</li>
                            <li>${ao.chatVai.huong_dan_bao_quan.chitiet}</li>
                        </ul>
                    </div>
                    <div class="tab-pane fade" id="tab-pane-2">
                        <table class="table">
                            <tr class="th1">
                                <th colspan="2">Thông tin chi tiết Áo sơ mi</th>
                            </tr>
                            <tr class="tr1">
                                <td>Giới tính</td>
                                <td>Nam</td>
                            </tr>
                            <tr class="tr2">
                                <td>Form áo</td>
                                <td>${ao.form.ten}</td>
                            </tr>
                            <tr class="tr1">
                                <td>Hãng</td>
                                <td>${ao.hang.ten}</td>
                            </tr>
                            <tr class="tr1">
                                <td>Chất vải</td>
                                <td>${ao.chatVai.ten}</td>
                            </tr>
                            <tr class="tr1">
                                <td>Loại áo</td>
                                <td>${ao.loaiAo.ten}</td>
                            </tr>
                            <tr class="tr2">
                                <td>Cổ áo</td>
                                <td>${ao.coAo}</td>
                            </tr>
                            <tr class="tr1">
                                <td>Túi áo</td>
                                <td>${ao.tui}</td>
                            </tr>
                            <tr class="tr1">
                                <td>Tay áo</td>
                                <td>${ao.tayAo}</td>
                            </tr>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- Shop Detail End -->
<div class="container-fluid py-5">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Đánh giá sản phẩm</span>
    </h2>
    <div class="comment-container">
        <div id="product-list">
            <div class="comment1">
                <div style="width: 30%;float: left;height: 100%; padding-left: 20px">
                    <p><strong style="font-size: 30px;">${danhGiaSao}.${danhGiaDu}</strong> trên 5</p>
                    <p style="font-size: 35px"><span class="stars${danhGiaSao}"></span><span
                            class="test${danhGiaDu}"></span></p>
                </div>
                <div style="width: 70%;float: left;padding-top: 20px">
                    <form>
                        <input type="checkbox" id="stars1" name="rating" value="stars1" onclick="filterComments()">
                        <label class="checkbox-label" for="stars1"><label class="checkbox-label1">1 Sao</label></label>
                        <input type="checkbox" id="stars2" name="rating" value="stars2" onclick="filterComments()">
                        <label class="checkbox-label" for="stars2"><label class="checkbox-label1">2 Sao</label></label>
                        <input type="checkbox" id="stars3" name="rating" value="stars3" onclick="filterComments()">
                        <label class="checkbox-label" for="stars3"><label class="checkbox-label1">3 Sao</label></label>
                        <input type="checkbox" id="stars4" name="rating" value="stars4" onclick="filterComments()">
                        <label class="checkbox-label" for="stars4"><label class="checkbox-label1">4 Sao</label></label>
                        <input type="checkbox" id="stars5" name="rating" value="stars5" onclick="filterComments()">
                        <label class="checkbox-label" for="stars5"><label class="checkbox-label1">5 Sao</label></label>
                    </form>
                </div>
            </div>
            <c:forEach items="${listDanhGias}" var="list">
                <div class="comment">
                    <p><strong>${list.khachHang.ten}</strong> <span class="stars${list.danhGiaSao}"></span><span
                            class="end${5-list.danhGiaSao}"></span></p>
                    <c:set var="dateTimeString" value="${list.ngayDanhGia}"/>
                    <fmt:parseDate value="${dateTimeString}" var="parsedDate" pattern="yyyy-MM-dd'T'HH:mm:ss.SSS"/>
                    <fmt:formatDate value="${parsedDate}" var="formattedDate" pattern="dd/MM/yyyy HH:mm:ss"/>
                    <p>${formattedDate} | Phân loại : ${list.aoChiTiet.mau_sac.ten}, ${list.aoChiTiet.size.ten}</p>
                    <p>${list.danhGiaBinhLuan}</p>
                </div>
            </c:forEach>
        </div>
    </div>
    <ul class="pagination">
        <li class="prev-page">Trước</li>
        <li class="next-page">Sau</li>
    </ul>
</div>

<!-- Products Start -->
<div class="container-fluid py-5">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Danh sách sản phẩm</span>
    </h2>
    <div class="row px-xl-5">
        <div class="col">
            <div class="owl-carousel related-carousel">
                <c:forEach items="${listAos}" var="list">
                    <div class="product-item bg-light">
                        <div class="product-img position-relative overflow-hidden">
                            <img class="img-fluid" style="width: 100%; height: 350px; border: 2px solid #3bac8b"
                                 src="/images/${list.anhs.get(0).ten_url}" alt="">
                            <div class="product-action">
                                <a class="btn btn-outline-dark btn-square" href="/user/san_pham_detail/${idKh}/${list.id}"><i class="fa fa-search"></i></a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <a class="h6 text-decoration-none text-truncate" href="">${list.ten}</a>
                            <div class="d-flex align-items-center justify-content-center mt-2">
                                <h5><strong><fmt:formatNumber value="${list.giaBan}" type="currency"
                                                              currencySymbol="VNĐ"/></strong></h5>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>


<!-- Footer Start -->
<div class="container-fluid bg-dark text-secondary mt-5 pt-5">
    <div class="row px-xl-5 pt-5">
        <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
            <h5 class="text-secondary text-uppercase mb-4">Get In Touch</h5>
            <p class="mb-4">No dolore ipsum accusam no lorem. Invidunt sed clita kasd clita et et dolor sed dolor. Rebum
                tempor no vero est magna amet no</p>
            <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
            <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
            <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
        </div>
        <div class="col-lg-8 col-md-12">
            <div class="row">
                <div class="col-md-4 mb-5">
                    <h5 class="text-secondary text-uppercase mb-4">Quick Shop</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Home</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                        <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <h5 class="text-secondary text-uppercase mb-4">My Account</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Home</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                        <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <h5 class="text-secondary text-uppercase mb-4">Newsletter</h5>
                    <p>Duo stet tempor ipsum sit amet magna ipsum tempor est</p>
                    <form action="">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Your Email Address">
                            <div class="input-group-append">
                                <button class="btn btn-primary">Sign Up</button>
                            </div>
                        </div>
                    </form>
                    <h6 class="text-secondary text-uppercase mt-4 mb-3">Follow Us</h6>
                    <div class="d-flex">
                        <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a class="btn btn-primary btn-square" href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row border-top mx-xl-5 py-4" style="border-color: rgba(256, 256, 256, .1) !important;">
        <div class="col-md-6 px-xl-0">
            <p class="mb-md-0 text-center text-md-left text-secondary">
                &copy; <a class="text-primary" href="#">Domain</a>. All Rights Reserved. Designed
                by
                <a class="text-primary" href="https://htmlcodex.com">HTML Codex</a>
            </p>
        </div>
        <div class="col-md-6 px-xl-0 text-center text-md-right">
            <img class="img-fluid" src="img/payments.png" alt="">
        </div>
    </div>
</div>

<!-- Footer End -->


<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="../../../resources/lib/easing/easing.min.js"></script>
<script src="../../../resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="../../../resources/mail/jqBootstrapValidation.min.js"></script>
<script src="../../../resources/mail/contact.js"></script>

<!-- Template Javascript -->
<script src="../../../resources/js/main.js"></script>
<script>

    var input1 = document.getElementById("quantityInput");

    // Thêm sự kiện "input" để kiểm tra mỗi khi người dùng nhập
    input1.addEventListener("input", function () {
        // Lấy giá trị hiện tại của input
        var value = this.value;

        // Sử dụng biểu thức chính quy để kiểm tra nếu giá trị chứa dấu trừ hoặc chữ cái
        if (/[-a-zA-Z]/.test(value)) {
            // Nếu có, loại bỏ chúng và cập nhật giá trị
            value = value.replace(/[-a-zA-Z]/g, "");
            this.value = value;
        }
    });

    function increaseQuantity() {
        var input = document.getElementById("quantityInput").value;
        var soLuongTon = document.getElementById("soLuongTon").value;

        var value = parseFloat(input);
        var sl = parseFloat(soLuongTon);

        if (value < sl - 1) {
            var min = value++;
            document.getElementById("quantityInput").value = min.toFixed(0);
        } else {
            var max = sl - 1;
            document.getElementById("quantityInput").value = max.toFixed(0);
        }
    }

    function decreaseQuantity() {
        var input = document.getElementById("quantityInput").value;
        var value = parseFloat(input);

        if (value > 0) {
            var min = value--;
            document.getElementById("quantityInput").value = min.toFixed(0);
        } else {
            var max = 0;
            document.getElementById("quantityInput").value = max.toFixed(0);
        }
    }

    function addProduct() {

        var input = document.getElementById("quantityInput").value;
        var value = parseFloat(input);

        var soLuongTon = document.getElementById("soLuongTon").value;
        var sl = parseFloat(soLuongTon);

        var selectedMauSac = document.querySelector('input[name="mauSac"]:checked');
        var selectedSize = document.querySelector('input[name="size"]:checked');

        var idKh = document.getElementsByName('idKh')[0].value;
        var hasError = false;

        if (idKh == 2) {
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Bạn chưa đăng nhập</div><div class="progress-bar-container"></div>', // Ẩn nút "Oke"
                allowOutsideClick: true // Cho phép đóng thông báo bằng cách nhấp bên ngoài
            });
            setTimeout(() => {
                Swal.close();
            }, 2000);
            hasError = true;
        }
        if (!selectedMauSac || !selectedSize) {
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Vui lòng chọn cả màu sắc hoặc kích thước áo</div><div class="progress-bar-container"></div>',
                allowOutsideClick: true // Cho phép đóng thông báo bằng cách nhấp bên ngoài
            });
            setTimeout(() => {
                Swal.close();
            }, 2000);
            hasError = true;
        }
        if (sl == 0) {
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Sản phẩm đã hết, bạn vui lòng chọn sản phẩm khác</div><div class="progress-bar-container"></div>',
                allowOutsideClick: true // Cho phép đóng thông báo bằng cách nhấp bên ngoài
            });
            setTimeout(() => {
                Swal.close();
            }, 2000);
            hasError = true;
        }
        if (value > sl) {
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Số lượng tồn không đủ</div><div class="progress-bar-container"></div>',
                allowOutsideClick: true // Cho phép đóng thông báo bằng cách nhấp bên ngoài
            });
            setTimeout(() => {
                Swal.close();
            }, 2000);
            hasError = true;
        }
        if (hasError) {
            event.preventDefault(); // Ngăn chặn submit form nếu có lỗi
        }
    }

</script>

<script>

    var mauSacAndSizeDiv = document.getElementById("mauSacAndSize");

    // Ẩn div mauSacAndSize ban đầu
    mauSacAndSizeDiv.style.display = "none";

    function updateProductAvailability() {
        var selectedColor = document.querySelector("input[name='mauSac']:checked");
        var selectedSize = document.querySelector("input[name='size']:checked");

        if (selectedColor && selectedSize) {
            var colorId = selectedColor.value;
            var sizeId = selectedSize.value;
            var idAo = document.getElementById("idAo").value;

            // Tạo đối tượng XMLHttpRequest
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "/find/" + idAo + "/" + colorId + "/" + sizeId, true);

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    if (response > 0) {
                        // Cập nhật nội dung của phần tử div
                        document.getElementById("soLuongTonStr").textContent = "Số lượng sản phẩm còn lại: " + response;
                        document.getElementById("soLuongTon").value = response;

                    } else {
                        document.getElementById("soLuongTonStr").textContent = "Đã hết sản phẩm";
                        document.getElementById("soLuongTon").value = 0;
                    }
                } else {
                    document.getElementById("soLuongTonStr").textContent = "Đã hết sản phẩm";
                    document.getElementById("soLuongTon").value = 0;
                }
            };

            xhr.send();

            // Hiển thị div mauSacAndSize
            mauSacAndSizeDiv.style.display = "block";
        }
    }

    // Thêm sự kiện change cho các input radio
    var colorInputs = document.querySelectorAll("input[name='mauSac']");
    var sizeInputs = document.querySelectorAll("input[name='size']");

    colorInputs.forEach(function (input) {
        input.addEventListener("change", updateProductAvailability);
    });

    sizeInputs.forEach(function (input) {
        input.addEventListener("change", updateProductAvailability);
    });
</script>
<script>
    const commentsPerPage = 5; // Số lượng bình luận hiển thị trên mỗi trang
    const comments = document.querySelectorAll('.comment');
    const pagination = document.querySelector('.pagination');
    const prevPageButton = document.querySelector('.prev-page');
    const nextPageButton = document.querySelector('.next-page');
    const pageNumbers = document.querySelectorAll('.page-number');

    let currentPage = 1;

    function showPage(pageNumber) {
        comments.forEach((comment, index) => {
            const startIndex = (pageNumber - 1) * commentsPerPage;
            const endIndex = startIndex + commentsPerPage - 1;

            if (index >= startIndex && index <= endIndex) {
                comment.style.display = 'block';
            } else {
                comment.style.display = 'none';
            }
        });
    }

    function updatePagination() {
        pageNumbers.forEach((pageNumber, index) => {
            if (index + 1 === currentPage) {
                pageNumber.classList.add('active');
            } else {
                pageNumber.classList.remove('active');
            }
        });
    }

    prevPageButton.addEventListener('click', () => {
        if (currentPage > 1) {
            currentPage--;
            showPage(currentPage);
            updatePagination();
        }
    });

    nextPageButton.addEventListener('click', () => {
        const totalPages = Math.ceil(comments.length / commentsPerPage);
        if (currentPage < totalPages) {
            currentPage++;
            showPage(currentPage);
            updatePagination();
        }
    });

    pageNumbers.forEach((pageNumber, index) => {
        pageNumber.addEventListener('click', () => {
            currentPage = index + 1;
            showPage(currentPage);
            updatePagination();
        });
    });

    showPage(currentPage);
    updatePagination();
</script>
<script>
    function filterComments() {
        const selectedRatings = document.querySelectorAll('input[name="rating"]:checked');
        const comments = document.querySelectorAll('.comment');

        comments.forEach(comment => {
            const stars = Array.from(comment.querySelectorAll('span[class^="stars"]'));
            const shouldDisplay = selectedRatings.length === 0 || stars.some(star => {
                return Array.from(selectedRatings).some(selectedRating => selectedRating.value === star.className);
            });

            comment.style.display = shouldDisplay ? 'block' : 'none';
        });

        // Cập nhật trạng thái của các checkbox tương ứng với số sao
        selectedRatings.forEach(selectedRating => {
            const checkbox = document.getElementById(selectedRating.value);
            if (checkbox) {
                checkbox.checked = true;
            }
        });
    }
</script>
</body>

</html>