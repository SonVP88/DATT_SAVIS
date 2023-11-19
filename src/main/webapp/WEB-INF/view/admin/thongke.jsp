<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | DataTables</title>
    <!-- Thêm FontAwesome CSS vào trang của bạn (hoặc sử dụng bất kỳ thư viện biểu tượng nào khác) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="../../../resources/css/thongke.css">
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../../resources/plugins/fontawesome-free/css/all.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="../../../resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../../../resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="../../../resources/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../../resources/dist/css/adminlte.min.css">
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="../assets/img/favicon.png">
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700"/>
    <!-- Nucleo Icons -->
    <link href="../assets/css/nucleo-icons.css" rel="stylesheet"/>
    <link href="../assets/css/nucleo-svg.css" rel="stylesheet"/>
    <!-- Font Awesome Icons -->
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
    <!-- CSS Files -->
    <link id="pagestyle" href="../assets/css/material-dashboard.css?v=3.1.0" rel="stylesheet"/>
    <!-- Nepcha Analytics (nepcha.com) -->
    <!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
    <script defer data-site="YOUR_DOMAIN_HERE" src="https://api.nepcha.com/js/nepcha-analytics.js"></script>
    <link rel="stylesheet" href="../../../resources/css/thongke.css">
    <style>
        button#filter-button2 {
            padding: 2px 5px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            max-width: 30px;
            max-height: 40px;
            margin-top: 30px;
            margin-bottom: 0px;
        }
        button#filter-button2:hover {
            background-color: #0056b3;
        }
        #error-message2 {
            display: none; /* Mặc định ẩn thông báo */
            background-color: #ff6666; /* Màu nền đỏ */
            color: white; /* Màu văn bản trắng */
            padding: 10px; /* Khoảng cách bên trong thông báo */
            margin-top: 10px; /* Khoảng cách từ trên xuống */
            border-radius: 5px; /* Góc bo tròn */
            text-align: center; /* Căn giữa văn bản */
        }
    </style>
    <style>
        .image {
            width: 80px;
            height: 80px;
            overflow: hidden;
            border-radius: 50%;
        }

        .image img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 50%;
        }
    </style>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="/admin/index/1" class="nav-link">Trang chủ</a>
            </li>
        </ul>

        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">
            <!-- Navbar Search -->
            <li class="nav-item">
                <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                    <i class="fas fa-expand-arrows-alt"></i>
                </a>
            </li>
        </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <c:choose>
                    <c:when test="${adminOrStaff == 1}">
                        <div class="image">
                            <img src="/images/test.jpg" >
                        </div>

                    </c:when>
                    <c:when test="${adminOrStaff == 2}">
                        <div class="image">
                            <img src="/images/test1.jpg" >
                        </div>
                    </c:when>
                </c:choose>
                <div class="info">
                    <a href="#" class="d-block">${nameUser}</a>
                </div>
            </div>

            <!-- SidebarSearch Form -->
            <div class="form-inline">
                <div class="input-group" data-widget="sidebar-search">
                    <input class="form-control form-control-sidebar" type="search" placeholder="Search"
                           aria-label="Search">
                    <div class="input-group-append">
                        <button class="btn btn-sidebar">
                            <i class="fas fa-search fa-fw"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                    data-accordion="false">
                    <!-- Add icons to the links using the .nav-icon class
                         with font-awesome or any other icon font library -->
                    <li class="nav-item menu-open">
                        <a href="#" class="nav-link active">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                Bảng điều khiển
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/admin/index/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Trang chủ</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/thong_ke/1" class="nav-link active">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Thống kê</p>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="nav-item ">
                        <a href="#" class="nav-link ">
                            <i class="nav-icon fas fa-table"></i>
                            <p>
                                Bảng
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/admin/ao/view/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Áo</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/hang/view/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Hãng</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/loai_ao/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Loại áo</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/chat_vai/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Chất vải</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/form/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Form áo</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/huong_dan_bao_quan/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Hướng dẫn bảo quản</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/mau_sac/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Màu sắc</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/size/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Size</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item ">
                        <a href="#" class="nav-link ">
                            <i class="nav-icon fas fa-user"></i>
                            <p>
                                Quản Lý Tài Khoản
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/admin/nhanvien/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Nhân Viên</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/khachhang/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Khách Hàng</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-plus-square"></i>
                            <p>
                                Chương trình giảm giá
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/admin/chuong_trinh_giam_gia/add_view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Thêm chương trình</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>
                                        Giảm giá sản phẩm
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="/admin/view_chuong_trinh_giam_gia_sp/1" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Các chương trình</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="/admin/ap-dung" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Áp dụng</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>
                                        Giảm giá hóa đơn
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="/admin/view_chuong_trinh_giam_gia_hd/1" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Các chương trình</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/quan_li_don_hang/1" class="nav-link">
                            <i class="nav-icon fas fa-money-bill-alt"></i>
                            <p>
                                Quản lí hóa đơn
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/chat" class="nav-link">
                            <i class="nav-icon fas fa-envelope"></i>
                            <p>
                                Chat hỗ trợ
                                <span style="${allChat==0?"display: none;":""}"
                                      class="right badge badge-danger">${allChat}</span>
                            </p>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <%--                        <h1>Ngày hiện tại <c:set var="dateFormat" value="dd/MM/yyyy"/>--%>
                        <%--                            <fmt:formatDate value="${ngayHienTai}" pattern="${dateFormat}"/>--%>
                        <%--                        </h1>--%>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <section class="content">
            <select name="thongkeOption" id="thongkeOption">
                <option value="ngay">Theo Ngày</option>
                <option value="thang">Theo Tháng</option>
            </select>
            <br> <br>
            <div class="row">
                <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                    <div class="card">
                        <div class="card-header p-3 pt-2">
                            <div class="icon icon-lg icon-shape bg-gradient-pink shadow-pink text-center border-radius-xl mt-n4 position-absolute">
                                <i class="material-icons opacity-10">Hóa Đơn</i>
                            </div>
                            <div class="text-end pt-1">
                                <p class="text-sm mb-0 text-capitalize">Số lượng đơn hoàn thành</p>
                                <h4 id="SHD" class="mb-0" style="color: hotpink">${soHoaDonHomNay} (hóa đơn)</h4>
                            </div>
                        </div>
                        <hr class="dark horizontal my-0">
                        <div class="card-footer p-3">
                            <span id="SSHD" class=" text-sm font-weight-bolder">${soSanhHoaDon}% </span><p class="mb-0" id="tbslhd">so với hôm trước</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                    <div class="card">
                        <div class="card-header p-3 pt-2">
                            <div class="icon icon-lg icon-shape bg-gradient-primary shadow-primary text-center border-radius-xl mt-n4 position-absolute">
                                <i class="material-icons opacity-10">Sản phẩm đã bán</i>
                            </div>
                            <div class="text-end pt-1">
                                <p class="text-sm mb-0 text-capitalize">Số lượng bán</p>
                                <h4 id="SL" class="mb-0" style="color: #0d6efd">${soLuongHomNay} (cái)</h4>
                            </div>
                        </div>
                        <hr class="dark horizontal my-0">
                        <div class="card-footer p-3">
                            <span id="SSSL" class=" text-sm font-weight-bolder">${soSanhSoLuong}% </span><p class="mb-0" id="tbslb">so với hôm trước</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                    <div class="card">
                        <div class="card-header p-3 pt-2">
                            <div class="icon icon-lg icon-shape bg-gradient-success shadow-success text-center border-radius-xl mt-n4 position-absolute">
                                <i class="material-icons opacity-10">Doanh thu</i>
                            </div>
                            <div class="text-end pt-1">
                                <p class="text-sm mb-0 text-capitalize">Doanh thu </p>
                                <h4 id="DT" class="mb-0" style="color: #00bb00">${doanhThuHomNay} (VNĐ)</h4>
                            </div>
                        </div>
                        <hr class="dark horizontal my-0">
                        <div class="card-footer p-3">
                            <span id="SSDT" class="text-sm font-weight-bolder change-color">${soSanhDoanhThu}%</span> <p class="mb-0" id="tbdt">so với hôm qua</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6">
                    <div class="card">
                        <div class="card-header p-3 pt-2">
                            <div class="icon icon-lg icon-shape bg-gradient-info shadow-info text-center border-radius-xl mt-n4 position-absolute">
                                <i class="bi bi-people-fill">Lượt khách</i>
                            </div>
                            <div class="text-end pt-1">
                                <p class="text-sm mb-0 text-capitalize">Số lượng khách đã mua</p>
                                <h4 id="SLKM" class="mb-0" style="color: #17a2b8">${soLuongKhachMua} (khách)</h4>
                            </div>
                        </div>
                        <hr class="dark horizontal my-0">
                        <div class="card-footer p-3">
                            <span id="SSSLK" class=" text-sm font-weight-bolder">${soSanhSoLuongKhach}% </span><p class="mb-0" id="tbslk">so với hôm trước</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-lg-4 col-md-6 mt-4 mb-4">
                    <div class="card z-index-2 ">
                        <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 bg-transparent">
                            <div class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-1">
                                <div class="chart">
                                    <canvas id="chart-bars" class="chart-canvas" height="170"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h6 class="mb-0 ">Số lượng tồn</h6>
                            <h5  style="color: orangered"> Sản phẩm</h5>
                            <hr class="dark horizontal">
                            <div id="error-message2" class="hidden" style="display: none">Ngày không hợp lệ. Vui lòng
                                kiểm tra lại.
                            </div>
                            <div class="filter-container">
                                <div class="filter-item">
                                    <label for="end-date">Loại áo:</label>
                                    <select id="loaiAo" onchange="LoaiAoChange()">
                                        <option value="ko">Chọn loại áo</option>
                                        <c:forEach items="${loaiAo}" var="l">
                                            <option value="${l.ten}">${l.ten}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="filter-item">
                                    <label for="end-date">Tên áo:</label>
                                    <select id="tenAo">
                                        <c:forEach items="${tenAo}" var="l">
                                            <option value="${l.ten}">${l.ten}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="filter-item">
                                    <label for="end-date">Màu sắc:</label>
                                    <select id="mauSac">
                                        <c:forEach items="${mauSac}" var="l">
                                            <option value="${l.ten}">${l.ten}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <button id="filter-button2"><i class="fas fa-filter"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mt-4 mb-4">
                    <div class="card z-index-2  ">
                        <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 bg-transparent">
                            <div class="bg-gradient-success shadow-success border-radius-lg py-3 pe-1">
                                <div class="chart">
                                    <canvas id="chart-line" class="chart-canvas" height="170"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h6 class="mb-0 "> Doanh Thu (Tháng hiện tại) </h6>
                            <h5  style="color: orangered"> ${doanhThuThangHienTai} VNĐ </h5>
                            <hr class="dark horizontal">
                            <div id="error-message" class="hidden" style="display: none">Ngày không hợp lệ. Vui lòng
                                kiểm tra lại.
                            </div>
                            <div class="filter-container">
                                <div class="filter-item">
                                    <label for="start-date">Từ ngày:</label>
                                    <input type="date" id="start-date" name="startDate">
                                </div>
                                <div class="filter-item">
                                    <label for="end-date">Đến ngày:</label>
                                    <input type="date" id="end-date" name="endDate">
                                </div>
                                <button id="filter-button"><i class="fas fa-filter"></i></button>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mt-4 mb-3">
                    <div class="card z-index-2 ">
                        <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 bg-transparent">
                            <div class="bg-gradient-dark shadow-dark border-radius-lg py-3 pe-1">
                                <div class="chart">
                                    <canvas id="chart-line-tasks" class="chart-canvas" height="170"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h6 class="mb-0 ">Số Lượng Áo Đã Bán (Tháng hiện tại)</h6>
                            <h5  style="color: orangered"> ${soLuongBanThangHienTai} cái </h5>
                            <hr class="dark horizontal">
                            <div id="error-message1" class="hidden" style="display: none">Ngày không hợp lệ. Vui lòng
                                kiểm tra lại.
                            </div>

                            <div class="filter-container">
                                <div class="filter-item">
                                    <label for="start-date">Từ ngày:</label>
                                    <input type="date" id="start-date1">
                                </div>
                                <div class="filter-item">
                                    <label for="end-date">Đến ngày:</label>
                                    <input type="date" id="end-date1">
                                </div>
                                <button id="filter-button1"><i class="fas fa-filter"></i></button>
                            </div>
                            <%--                            <div class="d-flex ">--%>
                            <%--                                <i class="material-icons text-sm my-auto me-1">schedule</i>--%>
                            <%--                                <p class="mb-0 text-sm">just updated</p>--%>
                            <%--                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="row" style="padding-bottom: 4%">
            <div class="col-6">
                <h3 style="text-align: center">Thống kê tất cả loại áo</h3>
                <canvas id="myChart1" width="400" height="250"></canvas>
            </div>
            <div class="col-6">
                <div class="row">
                    <div class="col-2">
                    </div>
                    <div class="col-6">
                        <h3>Thống kê áo theo loại áo</h3>
                    </div>
                    <div class="col-3">
                        <select id="loaiAo1" style="margin-top: 5%">
                            <c:forEach items="${listLoaiAo}" var="list">
                                <option value="${list.ma}">${list.ten}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <canvas id="myChart2" width="400" height="250"></canvas>
            </div>
        </div>


    </div>
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="../../../resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../../resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="../../../resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../../resources/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../../../resources/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../../../resources/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../../../resources/plugins/jszip/jszip.min.js"></script>
<script src="../../../resources/plugins/pdfmake/pdfmake.min.js"></script>
<script src="../../../resources/plugins/pdfmake/vfs_fonts.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- AdminLTE App -->
<script src="../../../resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../../resources/dist/js/demo.js"></script>
<script>
    function LoaiAoChange() {
        var selectedLoaiAo = document.getElementById("loaiAo").value;
        // Sử dụng AJAX để gửi yêu cầu đến /api/listAo và cập nhật danh sách tenAo
        $.ajax({
            type: "GET",
            url: "/api/listAo",
            data: { loaiAo: selectedLoaiAo },
            success: function (data) {
                updateTenAoDropdown(data);
            },
            error: function (error) {
                console.log("Error: " + error);
            }
        });
    }

    function updateTenAoDropdown(data) {
        // Xóa tất cả các option hiện tại trong dropdown
        $("#tenAo").empty();

        // Thêm các option mới từ dữ liệu nhận được
        $.each(data, function (index, item) {
            $("#tenAo").append($('<option>', {
                value: item,
                text: item
            }));
        });
    }
</script>
<!-- Page specific script -->
<script>
    $(function () {
        $("#example1").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
        $('#example2').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "responsive": true,
        });
    });
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $('#searchText1').on('input', function () {
            var searchText = $(this).val().toLowerCase();
            $('#example1 tbody tr').each(function () {
                var rowText = $(this).text().toLowerCase();
                if (rowText.includes(searchText)) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        });
    });
</script>
<script>
    $(document).ready(function () {
        // Sự kiện thay đổi combobox
        $('#searchText2').on('change', function () {
            var selectedValue = $(this).val().toLowerCase();

            // Hiển thị tất cả dòng trong bảng trước
            $('#example1 tbody tr').show();

            // Kiểm tra giá trị của từng dòng và ẩn dòng không khớp
            $('#example1 tbody tr').each(function () {
                var rowText = $(this).text().toLowerCase();
                if (!rowText.includes(selectedValue)) {
                    $(this).hide();
                }
            });
        });
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    var weeklyData = [
        // Dữ liệu cho mỗi tuần
        <c:forEach items="${listThongKeDTOS}" var="thongKeDTO">
        [${thongKeDTO.soLuong}
            // Thêm số lượng sản phẩm cho các ngày khác vào đây
        ],
        </c:forEach>
    ];

    var ngayThanhToan = [
        // Dữ liệu ngày từ danh sách ThongKeDTO
        <c:forEach items="${listThongKeDTOS}" var="thongKeDTO">
        <c:set var="dateFormat" value="dd/MM/yyyy"/>
        '<fmt:formatDate value="${thongKeDTO.ngayThanhToan}" pattern="${dateFormat}"/>',
        </c:forEach>
    ];

    var ctx = document.getElementById('myChart').getContext('2d');
    var currentWeek = 0;
    var weeksData = [];

    // Tạo mảng dữ liệu cho từng tuần
    for (var i = 0; i < ngayThanhToan.length; i += 7) {
        var weekData = weeklyData.slice(i, i + 7);
        weeksData.push(weekData);
    }

    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ngayThanhToan.slice(currentWeek * 7, (currentWeek + 1) * 7), // Sử dụng dữ liệu ngày
            datasets: [{
                label: 'Số lượng sản phẩm bán được',
                data: weeksData[currentWeek],
                backgroundColor: 'rgba(75, 192, 192, 0.2)', // Màu nền cột
                borderColor: 'rgba(75, 192, 192, 1)', // Màu viền cột
                borderWidth: 1 // Độ rộng viền cột
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true // Bắt đầu từ giá trị 0 trên trục Y
                }
            }
        }
    });

    // Bắt sự kiện khi bấm nút "Trước"
    document.getElementById("prevWeek").addEventListener("click", function () {
        if (currentWeek > 0) {
            currentWeek--;
            updateChart();
        }
    });

    // Bắt sự kiện khi bấm nút "Sau"
    document.getElementById("nextWeek").addEventListener("click", function () {
        if (currentWeek < weeksData.length - 1) {
            currentWeek++;
            updateChart();
        }
    });

    // Hàm để cập nhật biểu đồ
    function updateChart() {
        myChart.data.labels = ngayThanhToan.slice(currentWeek * 7, (currentWeek + 1) * 7);
        myChart.data.datasets[0].data = weeksData[currentWeek];
        myChart.update();
    }
</script>
<script>
    var ctx1 = document.getElementById("chart-bars").getContext("2d");
    var chart = new Chart(ctx1, {
        type: "bar",
        data: {
            labels: ["L", "XXL", "S", "M", "3XL", "XL"],
            datasets: [{
                label: "Cái",
                tension: 0.4,
                borderWidth: 0,
                borderRadius: 4,
                borderSkipped: false,
                backgroundColor: "rgba(255, 255, 255, .8)",
                data: [0,0,0,0,0,0],
                maxBarThickness: 6
            },],
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    display: false,
                }
            },
            interaction: {
                intersect: false,
                mode: 'index',
            },
            scales: {
                y: {
                    grid: {

                        drawBorder: false,
                        display: true,
                        drawOnChartArea: true,
                        drawTicks: false,
                        borderDash: [5, 5],
                        color: 'rgba(255, 255, 255, .2)'
                    },
                    ticks: {
                        suggestedMin: 0,

                        beginAtZero: true,
                        padding: 10,
                        font: {
                            size: 14,
                            weight: 300,
                            family: "Roboto",
                            style: 'normal',
                            lineHeight: 2
                        },
                        color: "#fff"
                    },
                },
                x: {
                    grid: {
                        drawBorder: false,
                        display: true,
                        drawOnChartArea: true,
                        drawTicks: false,
                        borderDash: [5, 5],
                        color: 'rgba(255, 255, 255, .2)'
                    },
                    ticks: {
                        display: true,
                        color: '#f8f9fa',
                        padding: 10,
                        font: {
                            size: 14,
                            weight: 300,
                            family: "Roboto",
                            style: 'normal',
                            lineHeight: 2
                        },
                    }
                },
            },
        },
    });

    // Lấy ngày hiện tại


    // Tạo một mảng chứa nhãn (tên tháng) cho 5 tháng gần nhất

    // Lấy ngày hiện tại
    const currentDate = new Date();

    // Tạo một mảng chứa nhãn (tên tháng) cho 5 tháng gần nhất
    const labels1 = [];
    for (let i = 4; i >= 0; i--) {
        const date = new Date(currentDate);

        // Kiểm tra xem tháng hiện tại có 31 ngày hay không
        const isCurrentMonth31Days = date.getDate() === 31;

        // Trừ đi 1 tháng
        date.setMonth(currentDate.getMonth() - i);

        // Kiểm tra xem tháng mới có thay đổi ngày hay không
        if (isCurrentMonth31Days && date.getDate() !== 31) {
            date.setDate(0); // Đặt ngày cuối cùng của tháng
        }

        const monthName = date.toLocaleString('default', {month: 'short'});
        labels1.push(monthName);
    }
    console.log(labels1); // In mảng các tên tháng


    var dataDoanhThu = ${listDoanhThu};

    var ctx2 = document.getElementById("chart-line").getContext("2d");

    var chart2 = new Chart(ctx2, {
        type: "line",
        data: {
            labels: labels1,
            datasets: [{
                label: "Doanh thu (VNĐ)",
                tension: 0,
                borderWidth: 0,
                pointRadius: 5,
                pointBackgroundColor: "rgba(255, 255, 255, .8)",
                pointBorderColor: "transparent",
                borderColor: "rgba(255, 255, 255, .8)",
                borderColor: "rgba(255, 255, 255, .8)",
                borderWidth: 4,
                backgroundColor: "transparent",
                fill: true,
                data: dataDoanhThu,
                maxBarThickness: 6

            }],
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    display: false,
                }
            },
            interaction: {
                intersect: false,
                mode: 'index',
            },
            scales: {
                y: {
                    grid: {
                        drawBorder: false,
                        display: true,
                        drawOnChartArea: true,
                        drawTicks: false,
                        borderDash: [5, 5],
                        color: 'rgba(255, 255, 255, .2)'
                    },
                    ticks: {
                        display: true,
                        color: '#f8f9fa',
                        padding: 10,
                        font: {
                            size: 14,
                            weight: 300,
                            family: "Roboto",
                            style: 'normal',
                            lineHeight: 2
                        },
                    }
                },
                x: {
                    grid: {
                        drawBorder: false,
                        display: false,
                        drawOnChartArea: false,
                        drawTicks: false,
                        borderDash: [5, 5]
                    },
                    ticks: {
                        display: true,
                        color: '#f8f9fa',
                        padding: 10,
                        font: {
                            size: 14,
                            weight: 300,
                            family: "Roboto",
                            style: 'normal',
                            lineHeight: 2
                        },
                    }
                },
            },
        },
    });
    var errorMessage = document.getElementById("error-message");
    var filterButton = document.getElementById('filter-button');
    filterButton.addEventListener('click', function () {
        var startDate = document.getElementById('start-date').value;
        var endDate = document.getElementById('end-date').value;

        if (!startDate || !endDate) {
            errorMessage.textContent = "Vui lòng nhập cả ngày bắt đầu và ngày kết thúc.";
            errorMessage.style.display = "block";
            setTimeout(function () {
                errorMessage.style.display = "none";
            }, 3000); // 3 giây
            return false; // Ngăn chặn việc gửi dữ liệu nếu ngày không được nhập
        }

        var startDateInput = new Date(startDate);
        var endDateInput = new Date(endDate);

        var currentDate = new Date();

        var twelveMonthsAgo = new Date(currentDate);
        twelveMonthsAgo.setMonth(currentDate.getMonth() - 12);

        if (endDateInput > currentDate) {
            errorMessage.textContent = "Ngày kết thúc không thể sau ngày hiện tại.";
            errorMessage.style.display = "block";
            setTimeout(function () {
                errorMessage.style.display = "none";
            }, 3000); // 3 giây
            return false; // Ngăn chặn việc gửi dữ liệu nếu ngày không hợp lệ
        }
        if (startDateInput > endDateInput) {
            errorMessage.textContent = "Ngày bắt đầu không thể sau ngày kết thúc.";
            errorMessage.style.display = "block";
            setTimeout(function () {
                errorMessage.style.display = "none";
            }, 3000); // 3 giây
            return false; // Ngăn chặn việc gửi dữ liệu nếu ngày không hợp lệ
        }
        // Kiểm tra xem ngày bắt đầu không nằm trước ngày 12 tháng trước
        if (startDateInput < twelveMonthsAgo) {
            errorMessage.textContent = "Ngày bắt đầu không thể trước 12 tháng trước.";
            errorMessage.style.display = "block";
            setTimeout(function () {
                errorMessage.style.display = "none";
            }, 3000); // 3 giây
            return false; // Ngăn chặn việc gửi dữ liệu nếu ngày không hợp lệ
        }

        // Nếu mọi thứ hợp lệ, ẩn thông báo lỗi
        errorMessage.style.display = "none";

        // Sử dụng Fetch API để gửi yêu cầu đến máy chủ hoặc API
        fetch('/api/chart-data-doanhthu?startDate=' + startDate + '&endDate=' + endDate)
            .then(response => response.json())
            .then(data => {
                // Cập nhật dữ liệu của biểu đồ với dữ liệu mới
                chart2.data.labels = data.labels;
                chart2.data.datasets[0].data = data.datasetData;
                chart2.update();
            })
            .catch(error => console.error(error));
    });
    document.getElementById("thongkeOption").addEventListener("change", function () {
        var selectedOption = this.value;

        fetch('/api/thongketheoOption?thongKeOption=' + selectedOption, {
            method: 'GET',
        })
            .then(response => response.json())
            .then(data => {
                document.getElementById("SHD").textContent = data.soLuongHoaDon +" (hoá đơn)";
                document.getElementById("SL").textContent = data.soluongBan+" (cái)";
                document.getElementById("DT").textContent = data.doanhThu+" (VNĐ)";
                document.getElementById("SLKM").textContent = data.soLuongKhachMua+" (khách)";
                document.getElementById("SSHD").textContent = data.soSanhSoHoaDon + "% ";
                document.getElementById("SSSL").textContent = data.soSanhSoLuongBan+ "% ";
                document.getElementById("SSDT").textContent = data.soSanhDoanhThu+ "% ";
                document.getElementById("SSSLK").textContent = data.soSanhSoLuongKhachMua+ "% ";
                if(selectedOption==='thang'){
                    document.getElementById("tbdt").textContent = "so với tháng trước ";
                    document.getElementById("tbslhd").textContent = "so với tháng trước ";
                    document.getElementById("tbslb").textContent = "so với tháng trước ";
                    document.getElementById("tbslk").textContent = "so với tháng trước ";
                }
                else{
                    document.getElementById("tbdt").textContent = "so với hôm trước ";
                    document.getElementById("tbslhd").textContent = "so với hôm trước ";
                    document.getElementById("tbslk").textContent = "so với hôm trước ";
                    document.getElementById("tbslb").textContent = "so với hôm trước ";
                }


            })
            .catch(error => {
                console.error('Lỗi: ' + error);
            });
    });
    var filterButton2 = document.getElementById('filter-button2');
    filterButton2.addEventListener('click', function () {
        var loaiAo = document.getElementById('loaiAo').value;
        var tenAo = document.getElementById('tenAo').value;
        var mauSac = document.getElementById('mauSac').value;
        var errorMessage1 = document.getElementById("error-message2");
        if (loaiAo==="ko"){
            errorMessage1.textContent = "Bạn cần chọn loại áo";
            errorMessage1.style.display = "block";
            setTimeout(function () {
                errorMessage1.style.display = "none";
            }, 3000); // 3 giây
            return false; // Ngăn chặn việc gửi dữ liệu nếu ngày không hợp lệ
        }

        // Sử dụng Fetch API để gửi yêu cầu đến máy chủ hoặc API
        fetch('/api/listTon?loaiAo=' + loaiAo + '&tenAo=' + tenAo+ '&mauSac=' + mauSac)
            .then(response => response.json())
            .then(data => {
                // Cập nhật dữ liệu của biểu đồ với dữ liệu mới
                chart.data.datasets[0].data = data;
                chart.update();
                console.log(data);
            })
            .catch(error => console.error(error));
    });

    var ctx3 = document.getElementById("chart-line-tasks").getContext("2d");
    var dataSoLuong =
    ${listSoLuong}
    var chart3 = new Chart(ctx3, {
        type: "line",
        data: {
            labels: labels1,
            datasets: [{
                label: "số lượng bán (cái)",
                tension: 0,
                borderWidth: 0,
                pointRadius: 5,
                pointBackgroundColor: "rgba(255, 255, 255, .8)",
                pointBorderColor: "transparent",
                borderColor: "rgba(255, 255, 255, .8)",
                borderWidth: 4,
                backgroundColor: "transparent",
                fill: true,
                data: dataSoLuong,
                maxBarThickness: 6

            }],
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    display: false,
                }
            },
            interaction: {
                intersect: false,
                mode: 'index',
            },
            scales: {
                y: {
                    grid: {
                        drawBorder: false,
                        display: true,
                        drawOnChartArea: true,
                        drawTicks: false,
                        borderDash: [5, 5],
                        color: 'rgba(255, 255, 255, .2)'
                    },
                    ticks: {
                        display: true,
                        padding: 10,
                        color: '#f8f9fa',
                        font: {
                            size: 14,
                            weight: 300,
                            family: "Roboto",
                            style: 'normal',
                            lineHeight: 2
                        },
                    }
                },
                x: {
                    grid: {
                        drawBorder: false,
                        display: false,
                        drawOnChartArea: false,
                        drawTicks: false,
                        borderDash: [5, 5]
                    },
                    ticks: {
                        display: true,
                        color: '#f8f9fa',
                        padding: 10,
                        font: {
                            size: 14,
                            weight: 300,
                            family: "Roboto",
                            style: 'normal',
                            lineHeight: 2
                        },
                    }
                },
            },
        },
    });
    var errorMessage1 = document.getElementById("error-message1");
    var filterButton1 = document.getElementById('filter-button1');
    filterButton1.addEventListener('click', function () {
        var startDate1 = document.getElementById('start-date1').value;
        var endDate1 = document.getElementById('end-date1').value;

        if (!startDate1 || !endDate1) {
            errorMessage1.textContent = "Vui lòng nhập cả ngày bắt đầu và ngày kết thúc.";
            errorMessage1.style.display = "block";
            setTimeout(function () {
                errorMessage1.style.display = "none";
            }, 3000); // 3 giây
            return false; // Ngăn chặn việc gửi dữ liệu nếu ngày không được nhập
        }

        var startDateInput1 = new Date(startDate1);
        var endDateInput1 = new Date(endDate1);

        var currentDate = new Date();

        var twelveMonthsAgo = new Date(currentDate);
        twelveMonthsAgo.setMonth(currentDate.getMonth() - 12);

        if (endDateInput1 > currentDate) {
            errorMessage1.textContent = "Ngày kết thúc không thể sau ngày hiện tại.";
            errorMessage1.style.display = "block";
            setTimeout(function () {
                errorMessage1.style.display = "none";
            }, 3000); // 3 giây
            return false; // Ngăn chặn việc gửi dữ liệu nếu ngày không hợp lệ
        }
        if (startDateInput1 > endDateInput1) {
            errorMessage1.textContent = "Ngày bắt đầu không thể sau ngày kết thúc.";
            errorMessage1.style.display = "block";
            setTimeout(function () {
                errorMessage1.style.display = "none";
            }, 3000); // 3 giây
            return false; // Ngăn chặn việc gửi dữ liệu nếu ngày không hợp lệ
        }
        // Kiểm tra xem ngày bắt đầu không nằm trước ngày 12 tháng trước
        if (startDateInput1 < twelveMonthsAgo) {
            errorMessage1.textContent = "Ngày bắt đầu không thể trước 12 tháng trước.";
            errorMessage1.style.display = "block";
            setTimeout(function () {
                errorMessage1.style.display = "none";
            }, 3000); // 3 giây
            return false; // Ngăn chặn việc gửi dữ liệu nếu ngày không hợp lệ
        }

        // Nếu mọi thứ hợp lệ, ẩn thông báo lỗi
        errorMessage1.style.display = "none";

        // Sử dụng Fetch API để gửi yêu cầu đến máy chủ hoặc API
        fetch('/api/chart-data-soluongban?startDate=' + startDate1 + '&endDate=' + endDate1)
            .then(response => response.json())
            .then(data => {
                // Cập nhật dữ liệu của biểu đồ với dữ liệu mới
                chart3.data.labels = data.labels;
                chart3.data.datasets[0].data = data.datasetData;
                chart3.update();
            })
            .catch(error => console.error(error));
    });
</script>
<script>
    // Lấy dữ liệu từ model và chuyển đổi thành mảng JavaScript
    var labels = [];
    var soLuongBan = [];
    var soLuongTon = [];

    <c:forEach var="bieuDoDTO" items="${listThongKeSoLuongAoDTOS}">
    labels.push("${bieuDoDTO.loaiAo.ten}");
    soLuongBan.push(${bieuDoDTO.slBan});
    soLuongTon.push(${bieuDoDTO.slTon});
    </c:forEach>

    var ctx = document.getElementById('myChart1').getContext('2d');

    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Số lượng bán',
                data: soLuongBan,
                backgroundColor: 'rgba(75, 192, 192, 0.2)', // Màu của cột
                borderColor: 'rgba(75, 192, 192, 1)', // Màu viền của cột
                borderWidth: 1,
                yAxisID: 'left-y-axis'
            }, {
                label: 'Số lượng tồn',
                data: soLuongTon,
                backgroundColor: 'rgba(255, 99, 132, 0.2)', // Màu của cột
                borderColor: 'rgba(255, 99, 132, 1)', // Màu viền của cột
                borderWidth: 1,
                yAxisID: 'left-y-axis'
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    id: 'left-y-axis',
                    type: 'linear',
                    position: 'left',
                    ticks: {
                        beginAtZero: true
                    }
                }, {
                    id: 'right-y-axis',
                    type: 'linear',
                    position: 'right',
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {

        var ctx = document.getElementById('myChart2').getContext('2d');
        var myChart2 = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: [],
                datasets: [{
                    label: 'Số lượng bán',
                    data: [],
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                },
                    {
                        label: 'Số lượng tồn',
                        data: [],
                        backgroundColor: 'rgba(255, 99, 132, 0.2)', // Màu của cột
                        borderColor: 'rgba(255, 99, 132, 1)', // Màu viền của cột
                        borderWidth: 1
                    }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        function drawChart(maLoaiAo) {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var data = JSON.parse(this.responseText);

                    var tenAo = data.map(function (item) {
                        return item.tenAo;
                    });

                    var slBan = data.map(function (item) {
                        return item.slBan;
                    });

                    var slTon = data.map(function (item) {
                        return item.slTon;
                    });

                    myChart2.data.labels = tenAo;
                    myChart2.data.datasets[0].data = slBan;
                    myChart2.data.datasets[1].data = slTon;
                    myChart2.update();
                }
            };
            xhttp.open("GET", "http://localhost:8080/api/thong_ke_so_luong_ao/" + maLoaiAo, true);
            xhttp.send();
        }

        document.getElementById("loaiAo1").addEventListener("change", function () {
            var selectedValue = this.value;
            drawChart(selectedValue);
        });

        // Vẽ biểu đồ mặc định khi trang tải lên
        drawChart(document.getElementById("loaiAo1").value);
    });

</script>
<script src="../assets/js/core/popper.min.js"></script>
<script src="../assets/js/core/bootstrap.min.js"></script>
<script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
<script src="../assets/js/plugins/chartjs.min.js"></script>
<!-- Github buttons -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
<script src="../assets/js/material-dashboard.min.js?v=3.1.0"></script>
</body>
</html>
