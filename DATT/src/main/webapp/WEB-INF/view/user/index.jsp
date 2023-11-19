<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">

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
            text-align: center;
        }

        .gia del {
            color: gray;
        }

        .label {
            position: absolute;
            top: -10px;
            right: 270px;
            color: red;
            padding: 5px;
            font-size: 30px;
            transform: rotate(-45deg);
            transform-origin: top right;
            animation: blink 1s infinite alternate;
            white-space: nowrap;
        }

        .label1 {
            position: absolute;
            top: -10px;
            right: -8px;
            color: red;
            padding: 5px;
            padding-left: 278px;
            font-size: 30px;
            transform: rotate(0deg);
            transform-origin: top right;
            animation: blink 1s infinite alternate;
            white-space: nowrap;
        }

        @keyframes blink {
            0% {
                opacity: 1;
            }
            50% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
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

        .button-layout {
            background: black;
            color: white;
            border: 1px solid white; /* Đường viền ban đầu */
            padding: 10px 20px; /* Điều chỉnh padding theo ý muốn */
            transition: border-color 0.3s; /* Hiệu ứng hover */
        }

        /* CSS cho hover */
        .button-layout:hover {
            background: linear-gradient(to bottom, black, white); /* Màu nền khi hover */
            color: black;
            border-color: springgreen; /* Màu viền khi hover */
        }
    </style>

    <style>
        #addFormContainer {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Màu nền với độ trong suốt */
            z-index: 9999;
            justify-content: center;
            align-items: center;
            display: flex;
        }

        #addForm {
            margin-top: 5%;
            width: 100%;
            height: 450px;
            background-color: white; /* Màu nền của biểu mẫu */
            border-radius: 5px; /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Đổ bóng cho biểu mẫu */
        }
    </style>
    <style>
        #addFormContainer1 {
            display: none;
            position: fixed;
            top: -7%;
            left: 22%;
            width: 100%;
            height: 100%;
            z-index: 9999;
            justify-content: center;
            align-items: center;
            display: flex;
        }

        #addForm1 {
            padding-left: 10px;
            margin-top: 10%;
            width: 36.2%;
            height: 100%;
            background-color: white; /* Màu nền của biểu mẫu */
            border-radius: 5px; /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Đổ bóng cho biểu mẫu */
        }
    </style>

    <style>
        #addFormContainer2 {
            display: none;
            position: fixed;
            top: 10%;
            left: 75%;
            width: 100%;
            height: 60%;
            z-index: 9999;
            justify-content: center;
            align-items: center;
            display: flex;
        }

        #addForm2 {
            padding-left: 10px;
            margin-top: 10%;
            width: 21.5%;
            height: 100%;
            background-color: white; /* Màu nền của biểu mẫu */
            border-radius: 5px; /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Đổ bóng cho biểu mẫu */
            position: relative;
        }

        #closeButton {
            position: absolute;
            top: 10px;
            right: 3px;
            cursor: pointer;
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
            animation: slide-out 1s linear;
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
        #searchResults2 {
            max-height: 200px; /* Đặt chiều cao tối đa của khu vực hiển thị */
            overflow-y: auto; /* Cho phép cuộn dọc nếu nội dung vượt quá chiều cao tối đa */
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
                    <input type="text" class="form-control" name="timKiem" placeholder="Search for products"
                           id="searchInput2" onkeyup="search2()" oninput="toggleAddFormContainer()">
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
            <h5 class="m-0">+84 123 456 789</h5>
        </div>
    </div>
</div>
<!-- Topbar End -->
<div id="addFormContainer1" style="display: none;">
    <div class="container-fluid">
        <div class="container">
            <form method="post" id="addForm1">
                <div id="searchResults2"></div>
            </form>
        </div>
    </div>
</div>

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
<!-- Carousel Start -->
<div class="container-fluid mb-3">
    <div class="row px-xl-5">
        <div class="col-lg-8">
            <div id="header-carousel" class="carousel slide carousel-fade mb-30 mb-lg-0" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#header-carousel" data-slide-to="0" class="active"></li>
                    <li data-target="#header-carousel" data-slide-to="1"></li>
                    <li data-target="#header-carousel" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item position-relative active" style="height: 430px;">
                        <img class="position-absolute w-100 h-100" src="/images/layout1.jfif"
                             style="object-fit: cover;">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 700px;">
                                <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Men
                                    Fashion</h1>
                                <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Lorem rebum magna amet lorem
                                    magna erat diam stet. Sadips duo stet amet amet ndiam elitr ipsum diam</p>
                                <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp"
                                   href="#">Shop Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item position-relative" style="height: 430px;">
                        <img class="position-absolute w-100 h-100" src="/images/layout2.jfif"
                             style="object-fit: cover;">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 700px;">
                                <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Women
                                    Fashion</h1>
                                <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Lorem rebum magna amet lorem
                                    magna erat diam stet. Sadips duo stet amet amet ndiam elitr ipsum diam</p>
                                <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp"
                                   href="#">Shop Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item position-relative" style="height: 430px;">
                        <img class="position-absolute w-100 h-100" src="/images/layout3.jfif"
                             style="object-fit: cover;">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 700px;">
                                <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Kids
                                    Fashion</h1>
                                <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Lorem rebum magna amet lorem
                                    magna erat diam stet. Sadips duo stet amet amet ndiam elitr ipsum diam</p>
                                <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp"
                                   href="#">Shop Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="product-offer mb-30" style="height: 200px;">
                <img class="img-fluid" src="/images/test1.jpg" alt="">
                <div class="offer-text">
                    <h6 class="text-white text-uppercase">Sản phẩm bán chạy</h6>
                    <h3 class="text-white mb-3">Hot</h3>
                    <a href="" class="btn btn-primary">Shop Now</a>
                </div>
            </div>
            <div class="product-offer mb-30" style="height: 200px;">
                <img class="img-fluid" src="/images/test1.jpg" alt="">
                <div class="offer-text">
                    <h6 class="text-white text-uppercase">Sản phẩm mới</h6>
                    <h3 class="text-white mb-3">New</h3>
                    <a href="" class="btn btn-primary">Shop Now</a>
                </div>
            </div>
        </div>
    </div>
</div>


<c:choose>
    <c:when test="${idKh != 2}">
        <button class="btn btn-primary" style="position: fixed;z-index: 90;margin-left: 90%" id="addButton2"
                onclick="clickThem()">
            <i class="fab fa-facebook-messenger"></i>
        </button>
    </c:when>
</c:choose>


<div id="addFormContainer2" style="display: none;">
    <div id="addForm2">
        <a id="closeButton" onclick="closeForm()">X</a>
        <iframe id="myIframe" src="/user/chat/${idKh}" style="height: 100%"></iframe>
    </div>
</div>
<div class="container-fluid pt-5">
    <div class="row px-xl-5 pb-3">
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                <h5 class="font-weight-semi-bold m-0">Super speed</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
            </div>
        </div>
    </div>
</div>
<!-- Featured End -->


<!-- Categories Start -->
<div class="container-fluid pt-5">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">TỦ ĐỒ CHO PHÁI MẠNH</span>
    </h2>
    <div class="row px-xl-5 pb-3">
        <c:forEach items="${listLoaiAos}" var="list">
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <a class="text-decoration-none" href="/user/loc_theo_loai_ao/${idKh}/${list.ma}">
                    <div class="cat-item d-flex align-items-center mb-4">
                        <div class="overflow-hidden" style="width: 100px; height: 100px;">
                            <img class="img-fluid" src="/images/${list.tenURL}" alt="">
                        </div>
                        <div class="flex-fill pl-3">
                            <h6>${list.ten}</h6>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
</div>
<!-- Categories End -->


<!-- Products Start -->
<div class="container-fluid pt-5 pb-3">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Sản phẩm bán chạy</span>
    </h2>
    <div class="row px-xl-5">
        <c:forEach items="${listTop8Aos}" var="list" varStatus="vTri">
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <div class="product-item bg-light mb-4">
                    <div class="product-img position-relative overflow-hidden">
                        <img class="img-fluid" style="width: 100%; height: 350px; border: 2px solid #3bac8b"
                             src="/images/${list.ao.anhs.get(0).ten_url}" alt="">
                        <div class="product-action">
                            <a class="btn btn-outline-dark btn-square"
                               href="/user/show_gio_hang_index/${idKh}/${list.ao.id}"><i
                                    class="fa fa-shopping-cart"></i></a>
                            <a class="btn btn-outline-dark btn-square"
                               href="/user/san_pham_detail/${idKh}/${list.ao.id}"><i class="fa fa-search"></i></a>
                        </div>
                    </div>
                    <div class="text-center py-4">
                        <a class="h6 text-decoration-none text-truncate"
                           href="/user/san_pham_detail/${idKh}/${list.ao.id}"
                           style="display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${list.ao.ten}</a>
                        <div class="d-flex align-items-center justify-content-center mt-2">
                            <h5><strong><fmt:formatNumber value="${list.ao.giaBan}" type="currency"
                                                          currencySymbol="VNĐ"/></strong></h5>
                        </div>
                        <div class="d-flex align-items-center justify-content-center mt-2">
                            <span class="ml-2">${list.slBan} sản phẩm đã bán</span>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<div style="width: 100%; height: 800px; background: black; padding-top: 5%">
    <div class="row">
        <div class="col-6">
            <div style="padding-top: 40%;padding-left: 10% ; color: white">
                <p style="font-size: 30px"><b>Tạo sự thay đổi</b></p>
                <p style="font-size: 50px"><b>THAY ĐỔI ĐỂ THÀNH CÔNG</b></p>
                <a href="/user/shop/1" class="button-layout">SHOP NOW</a>
            </div>
        </div>
        <div class="col-6">
            <img src="/images/home_banner_1_image_1.jpg" style="width: 90%;padding-left: 10%">
        </div>
    </div>
</div>
<div style="width: 100%; height: 700px; background: black">
    <div class="row">
        <div class="col-6">
            <img src="/images/home_banner_1_image_2.jpg" style="width: 90%; padding-left: 10%">
        </div>
        <div class="col-6">
            <div style="padding-top: 40%;padding-left: 10% ; color: white">
                <p style="font-size: 30px"><b>Hành trình 3 tháng</b></p>
                <p style="font-size: 50px"><b>VÌ MỘT VIỆT NAM ĐẸP HƠN</b></p>
                <button class="button-layout">Xem thêm</button>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid py-5">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Bộ sưu tập mới</span>
    </h2>
    <div class="row px-xl-5">
        <div class="col">
            <div class="owl-carousel related-carousel">
                <c:forEach items="${listAoDTOMoi}" var="list">
                    <div class="product-item bg-light">
                        <div class="product-img position-relative overflow-hidden">
                            <img class="img-fluid" style="width: 100%; height: 350px; border: 2px solid #3bac8b"
                                 src="/images/${list.ao.anhs.get(0).ten_url}" alt="">
                            <div class="product-action">
                                <a class="btn btn-outline-dark btn-square"
                                   href="/user/show_gio_hang_index/${idKh}/${list.ao.id}"><i
                                        class="fa fa-shopping-cart"></i></a>
                                <a class="btn btn-outline-dark btn-square"
                                   href="/user/san_pham_detail/${idKh}/${list.ao.id}"><i class="fa fa-search"></i></a>
                            </div>
                        </div>
                        <div class="label1"><img src="/images/new_no_phong.png"></div>
                        <div class="text-center py-4">
                            <a class="h6 text-decoration-none text-truncate"
                               href="/user/san_pham_detail/${idKh}/${list.ao.id}"
                               style="display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${list.ao.ten}</a>
                            <c:choose>
                                <c:when test="${list.giaBan == list.ao.giaBan}">
                                    <div class="d-flex align-items-center justify-content-center mt-2">
                                        <h5 style="color: red;"><fmt:formatNumber value="${list.ao.giaBan}" type="currency"
                                                                                  currencySymbol="VNĐ"/></h5>
                                    </div>
                                    <p>Sản phẩm đã bán ${list.slBan}</p>
                                </c:when>
                                <c:when test="${list.giaBan < list.ao.giaBan}">
                                    <div class="d-flex align-items-center justify-content-center mt-2">
                                        <h6 class="text-muted ml-2">
                                            <del><fmt:formatNumber value="${list.ao.giaBan}" type="currency"
                                                                   currencySymbol="VNĐ"/></del>
                                        </h6>
                                        <h5 style="color: red;"><fmt:formatNumber value="${list.giaBan}"
                                                                                  type="currency"
                                                                                  currencySymbol="VNĐ"/></h5>
                                    </div>
                                    <p>Sản phẩm đã bán ${list.slBan}</p>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<!-- Products End -->
<div id="addFormContainer" style="display: none;">
    <div class="container-fluid">
        <div class="container">
            <form method="post" id="addForm">
                <div class="row px-xl-5">
                    <div class="col-lg-5 mb-30">
                        <div id="product-carousel" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner bg-light">
                                <c:forEach items="${anhs}" var="list" varStatus="status">
                                    <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                        <img class="" style="width: 100%; height: 450px" src="/images/${list.ten_url}"
                                             alt="Image">
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
                                            <del><fmt:formatNumber value="${ao.giaBan}" type="currency"
                                                                   currencySymbol="VNĐ"/></del>
                                            <strong><fmt:formatNumber value="${ao.giaBan * (100 - giamgia) / 100}"
                                                                      type="currency"
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
                            <input type="hidden" name="idAo" value="${ao.id}" id="idAo">
                            <div class="d-flex mb-4">
                                <strong class="text-dark mr-3">Colors:</strong>
                                <c:forEach items="${mauSacs}" var="list" varStatus="vTri">
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="radio${vTri.index + 1}" name="mauSac"
                                               value="${list.id}">
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
                                    <div class="custom-control custom-radio custom-control-inline"
                                         style="margin-left: 8px">
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
                                        <button class="btn btn-primary btn-minus" type="button"
                                                onclick="decreaseQuantity()">
                                            <i class="fa fa-minus"></i>
                                        </button>
                                        <input type="text" class="form-control bg-secondary border-0 text-center"
                                               value="1"
                                               name="sl" id="quantityInput">
                                        <button class="btn btn-primary btn-plus" type="button"
                                                onclick="increaseQuantity()">
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

                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<div style="background-image:url(//theme.hstatic.net/200000053174/1001115888/14/home_banner_2_bg_image.jpg?v=1210)">
    <div class="row" style="padding-top: 2%">
        <div class="col-1">
        </div>
        <div class="col-10" ; style="background: white">
            <div class="row">
                <div class="col-6">
                    <div style="padding-top: 60%; padding-left: 20%; color: black; ">
                        <p style="font-size: 50px"><b>BST Sơ mi</b></p>
                        <a href="/user/loc_theo_loai_ao/${idKh}/LA003" class="button-layout">KHÁM PHÁ NGAY</a>
                    </div>
                </div>
                <div class="col-6">
                    <img src="/images/banner4.png" style="width: 100%">
                </div>
            </div>
        </div>
    </div>
    <div class="row" style="padding-bottom: 2%">
        <div class="col-1">
        </div>
        <div class="col-10" ; style="background: white">
            <div class="row">
                <div class="col-6">
                    <div style="padding-top: 40%; padding-left: 20%; color: black; ">
                        <p style="font-size: 30px"><b>TỦ ĐỒ CHO PHÁI MẠNH</b></p>
                        <p style="font-size: 50px"><b>Lịch Lãm x Tinh Tế x Chuẩn mực</b></p>
                        <a href="/user/loc_theo_loai_ao/${idKh}/LA003" class="button-layout">KHÁM PHÁ NGAY</a>
                    </div>
                </div>
                <div class="col-6">
                    <img src="/images/banner5.png" style="width: 100%">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Offer Start -->

<!-- Offer End -->


<!-- Products Start -->

<div class="container-fluid py-5">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Sản phẩm sale</span>
    </h2>
    <div class="row px-xl-5">
        <div class="col">
            <div class="owl-carousel related-carousel">
                <c:forEach items="${listGiamGiaSanPhamChiTiets}" var="list">
                    <div class="product-item bg-light">
                        <div class="product-img position-relative overflow-hidden">
                            <a href="/user/san_pham_detail/${idKh}/${list.ao.id}"><img class="img-fluid"
                                                                                       src="/images/${list.ao.anhs.get(0).ten_url}"
                                                                                       style="width: 100%;height: 350px; border: 2px solid #3bac8b"
                                                                                       alt=""></a>
                            <div class="product-action">
                                <a class="btn btn-outline-dark btn-square"
                                   href="/user/show_gio_hang_index/${idKh}/${list.ao.id}"><i
                                        class="fa fa-shopping-cart"></i></a>
                                <a class="btn btn-outline-dark btn-square"
                                   href="/user/san_pham_detail/${idKh}/${list.ao.id}"><i class="fa fa-search"></i></a>
                            </div>
                        </div>
                        <div class="label1"><img src="/images/sale_icon.png"></div>
                        <div class="text-center py-4">
                            <div class="offer-text">
                                    <%--                            <h6 class="text-black text-center">--%>
                                <a class="h6 text-decoration-none text-truncate "
                                   href="/user/san_pham_detail/${idKh}/${list.ao.id}"
                                   style="display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${list.ao.ten}</a>
                                    <%--                            </h6>--%>
                            </div>
                            <div class="gia">
                                <div class="d-flex align-items-center justify-content-center mt-2">


                                    <h6 class="text-muted ml-2">
                                        <del><fmt:formatNumber value="${list.ao.giaBan}" type="currency"
                                                               currencySymbol="VNĐ"/></del>
                                    </h6>
                                    <h5 style="color: red;">
                                        <fmt:formatNumber
                                                value="${list.ao.giaBan * (100 - list.giamGiaSanPham.phanTramGiam)/100}"
                                                type="currency" currencySymbol="VNĐ"/>
                                    </h5>

                                </div>
                            </div>
                        </div>

                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid pt-5 pb-3">
    <div class="row px-xl-5">
        <c:forEach items="${listTop2GiamGiaSanPhams}" var="list">
            <div class="col-md-6">
                <div class="product-offer mb-30" style="height: 300px;">
                    <img class="img-fluid" src="/images/test.jpg" alt="">
                    <div class="offer-text">
                        <h6 class="text-white text-uppercase">Sale ${list.phanTramGiam}%</h6>
                        <h3 class="text-white mb-3">Sale sập sàn</h3>
                        <a href="" class="btn btn-primary">Shop Now</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<!-- Vendor End -->
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
                                 src="/images/${list.ao.anhs.get(0).ten_url}" alt="">
                            <div class="product-action">
                                <a class="btn btn-outline-dark btn-square"
                                   href="/user/show_gio_hang_index/${idKh}/${list.ao.id}"><i
                                        class="fa fa-shopping-cart"></i></a>
                                <a class="btn btn-outline-dark btn-square"
                                   href="/user/san_pham_detail/${idKh}/${list.ao.id}"><i class="fa fa-search"></i></a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <a class="h6 text-decoration-none text-truncate"

                               href="/user/san_pham_detail/${idKh}/${list.ao.id}"
                               style="display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${list.ao.ten}</a>
                            <c:choose>
                                <c:when test="${list.giaBan == list.ao.giaBan}">
                                    <div class="d-flex align-items-center justify-content-center mt-2">
                                        <h5 style="color: red;"><fmt:formatNumber value="${list.ao.giaBan}"
                                                                                  type="currency"
                                                                                  currencySymbol="VNĐ"/></h5>
                                    </div>
                                    <p>Sản phẩm đã bán ${list.slBan}</p>
                                </c:when>
                                <c:when test="${list.giaBan < list.ao.giaBan}">
                                    <div class="d-flex align-items-center justify-content-center mt-2">
                                        <h6 class="text-muted ml-2">
                                            <del><fmt:formatNumber value="${list.ao.giaBan}" type="currency"
                                                                   currencySymbol="VNĐ"/></del>
                                        </h6>
                                        <h5 style="color: red;"><fmt:formatNumber value="${list.giaBan}"
                                                                                  type="currency"
                                                                                  currencySymbol="VNĐ"/></h5>
                                    </div>
                                    <p>Sản phẩm đã bán ${list.slBan}</p>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<%--chat--%>

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
<script src="../../../resources/lib/easing/easing.min.js"></script>
<script src="../../../resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="../../../resources/mail/jqBootstrapValidation.min.js"></script>
<script src="../../../resources/mail/contact.js"></script>

<!-- Template Javascript -->
<script src="../../../resources/js/main.js"></script>
<script>
    var addFormContainer = document.getElementById("addFormContainer");

    var noneOrBlock = "${noneOrBlock}";

    if (noneOrBlock == "none") {
        addFormContainer.style.display = "none";
    } else {
        addFormContainer.style.display = "block";
    }

    // Add an event listener to the background overlay
    addFormContainer.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer) {
            // Hide the form
            addFormContainer.style.display = "none";
        }
    });
</script>

<script>
    // Get references to the button and form container
    var addButton = document.getElementById("addButton2");
    var addFormContainer2 = document.getElementById("addFormContainer2");

    function reloadIframe() {
        // Lấy thẻ iframe bằng ID
        var iframe = document.getElementById('myIframe');

        // Tải lại iframe
        iframe.src = iframe.src;
    }

    // Add an event listener to the button
    addButton.addEventListener("click", function () {
        // Toggle the visibility of the form container
        if (addFormContainer2.style.display === "none" || addFormContainer2.style.display === "") {
            addFormContainer2.style.display = "block";
            reloadIframe();
        } else {
            addFormContainer2.style.display = "none";
        }
    });

    // Add an event listener to the background overlay
    addFormContainer2.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer2) {
            // Hide the form
            addFormContainer2.style.display = "none";
        }
    });

    function closeForm() {
        addFormContainer2.style.display = "none";
    }
</script>

<script>
    var addFormContainer1 = document.getElementById("addFormContainer1");
    var searchInput1 = document.getElementById("searchInput2");

    // Hàm để kiểm tra trạng thái của ô tìm kiếm và hiển thị/ẩn addFormContainer1
    function toggleAddFormContainer() {
        if (searchInput1.value.trim() == "") {
            addFormContainer1.style.display = "none"; // Ẩn addFormContainer1 nếu ô tìm kiếm trống
        } else {
            addFormContainer1.style.display = "block"; // Hiển thị addFormContainer1 nếu ô tìm kiếm có giá trị
        }
    }


    // Add an event listener to the background overlay
    addFormContainer1.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer1) {
            // Hide the form
            addFormContainer1.style.display = "none";
        }
    });
</script>

<script>

    var input1 = document.getElementById("quantityInput");

    var addFormContainer = document.getElementById("addFormContainer");

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
            addFormContainer.style.display = "none";
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Bạn chưa đăng nhập</div><div class="progress-bar-container"></div>', // Ẩn nút "Oke"
                allowOutsideClick: true,
            });
            setTimeout(() => {
                Swal.close();
                addFormContainer.style.display = "block";
            }, 1000);
            hasError = true;
        }
        if (!selectedMauSac || !selectedSize) {
            addFormContainer.style.display = "none";
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Vui lòng chọn cả màu sắc hoặc kích thước áo</div><div class="progress-bar-container"></div>',
                allowOutsideClick: true // Cho phép đóng thông báo bằng cách nhấp bên ngoài
            });
            setTimeout(() => {
                Swal.close();
                addFormContainer.style.display = "block";
            }, 1000);
            hasError = true;
        }
        if (sl == 0) {
            addFormContainer.style.display = "none";
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Sản phẩm đã hết, bạn vui lòng chọn sản phẩm khác</div><div class="progress-bar-container"></div>',
                allowOutsideClick: true // Cho phép đóng thông báo bằng cách nhấp bên ngoài
            });
            setTimeout(() => {
                Swal.close();
                addFormContainer.style.display = "block";
            }, 1000);
            hasError = true;
        }
        if (value > sl) {
            addFormContainer.style.display = "none";
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Số lượng tồn không đủ</div><div class="progress-bar-container"></div>',
                allowOutsideClick: true // Cho phép đóng thông báo bằng cách nhấp bên ngoài
            });
            setTimeout(() => {
                Swal.close();
                addFormContainer.style.display = "block";
            }, 1000);
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
    function search2() {
        var keyword2 = document.getElementById("searchInput2").value;

        $.ajax({
            url: "/search2",
            data: {"keyword2": keyword2},
            success: function (results2) {
                $("#searchResults2").empty();

                results2.forEach(function (result2) {
                    var liElement = $("<div>").text(result2);

                    liElement.click(function () {
                        $("#searchInput2").val(result2);
                    });

                    liElement.appendTo("#searchResults2");
                });
            }
        });
    }
</script>
</body>

</html>