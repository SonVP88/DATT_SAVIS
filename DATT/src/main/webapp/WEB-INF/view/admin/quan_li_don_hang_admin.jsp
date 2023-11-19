<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | DataTables</title>

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="../../../resources/css/add_form.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">

    <style>
        #addFormContainer {
            display: none;
            position: absolute;
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
            background-color: white; /* Màu nền của biểu mẫu */
            padding: 20px;
            border-radius: 5px; /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Đổ bóng cho biểu mẫu */
            margin-top: 10%;
        }

        #addForm button[type="submit"] {
            background-color: #007BFF; /* Màu nền của nút */
            color: white; /* Màu chữ trắng */
            border: none;
            cursor: pointer;
        }

        #addForm button[type="submit"]:hover {
            background-color: #0056b3; /* Màu nền khi di chuột vào */
        }

        #locTheoThoiGian {
            background: #3fc3ee;
            border-radius: 15px;
            height: 100%;
            width: 100%;
            display: flex;
            align-items: center;
            padding-left: 30%;
        }

        #locTheoThoiGian:hover {
            transition: box-shadow 0.3s ease-in-out;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
    </style>
    <style>
        .status-container {
            display: flex;
            justify-content: space-between;
            background-color: #f5f5f5;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .status {
            width: 20%;
            height: 100px;
            text-align: center;
            line-height: 100px;
            font-size: 22px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .status-1 {
            backgroundColor: #ff8b33;
            background: #ff8b33;
        }

        .status-2 {
            backgroundColor: wheat;
            background: wheat;
        }

        .status-3 {
            backgroundColor: springgreen;
            background: springgreen;
        }

        .status-4 {
            backgroundColor: red;
            background: red;
        }

        .arrow1,
        .arrow2,
        .arrow3 {
            width: 30px;
            height: 30px;
            margin-top: 25px;
            color: green;
            font-size: 40px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th,
        td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        /**/

        .button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease, color 0.3s ease, transform 0.2s ease;
        }

        /* Nút Xác nhận */
        .btn-button-xn {
            margin-left: 20px;
            background-color: #007bff;
            color: #fff;
        }

        .btn-button-xn:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        /* Nút Hủy đơn */
        .btn-button-huy {
            margin-left: 10px;
            background-color: #dc3545;
            color: #fff;
        }

        .btn-button-huy:hover {
            background-color: #c82333;
            transform: scale(1.05);
        }

        .btn-button-xnhuy {
            background-color: #dc3545;
            color: #fff;
        }

        .btn-button-xnhuy:hover {
            background-color: #c82333;
            transform: scale(1.05);
        }

        /* Nút Chi tiết */
        .btn-button-ct {
            background-color: #ccc;
            color: #333;
        }

        .btn-button-ct:hover {
            background-color: #999;
            color: #fff;
            transform: scale(1.05);
        }

    </style>
    <style>
        #addFormContainer1 {
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

        #addForm1 {
            padding-left: 10px;
            margin-top: 10%;
            width: 100%;
            height: 100%;
            background-color: white; /* Màu nền của biểu mẫu */
            border-radius: 5px; /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Đổ bóng cho biểu mẫu */
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
    <style>
        .active {
            color: blue;
            font-weight: bold;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .pagination button {
            margin: 0 5px;
        }

        .btn-table {
            margin-top: 18px;
            padding-top: 5px;
            text-align: center;
            color: white;
            width: 80px;
            height: 40px;
            background: #0c84ff;
            border-radius: 5px;
        }

        .btn-table:hover {
            background: #0d6efd;
        }

        .form-group.col-2 {
            display: flex;
            justify-content: space-between;
        }

        .form-group.col-2 a {
            text-decoration: none;
            color: black;
            background-color: #3fc3ee;
            padding: 0px 25px;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .form-group.col-2 a:hover {
            background-color: #ddd;
            color: #000;
        }

        .icon-x {
            font-size: 26px;
            color: red;
        }
        .icon-x:hover {
            color: #ddd;
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
                            <img src="/images/test.jpg">
                        </div>

                    </c:when>
                    <c:when test="${adminOrStaff == 2}">
                        <div class="image">
                            <img src="/images/test1.jpg">
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
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                Bảng điều khiển
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/admin/index/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Trang chủ</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/thong_ke/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Thống kê</p>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="nav-item">
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
                    <li class="nav-item menu-open">
                        <a href="/admin/quan_li_don_hang/1" class="nav-link active">
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
                        <h1>Quản lí hóa đơn</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="/admin/index/1">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Quản lí hóa đơn</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <div id="no_1" style="display: none">
            <section class="content">
                <div class="container-fluid">
                    <div class="status-container">
                        <div class="status status-1" onclick="showStatus('1')"><i class="fas fa-hourglass-half"></i>
                            Đang
                            chờ xác nhận
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </section>
        </div>
        <div id="no_2" style="display: none">
            <section class="content">
                <div class="container-fluid">
                    <div class="status-container">
                        <div class="status status-1" onclick="showStatus('1')"><i class="fas fa-hourglass-half"></i>
                            Đang
                            chờ xác nhận
                        </div>
                        <div class="arrow arrow1"><i class="fas fa-arrow-right"></i></div>
                        <div class="status status-2" onclick="showStatus('2')" style="margin-right: 50%"><i
                                class="fas fa-truck"></i> Đang giao
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </section>
        </div>
        <div id="no_3" style="display: none">
            <section class="content">
                <div class="container-fluid">
                    <div class="status-container">
                        <div class="status status-1" onclick="showStatus('1')"><i class="fas fa-hourglass-half"></i>
                            Đang
                            chờ xác nhận
                        </div>
                        <div class="arrow arrow1"><i class="fas fa-arrow-right"></i></div>
                        <div class="status status-2" onclick="showStatus('2')"><i class="fas fa-truck"></i> Đang giao
                        </div>
                        <div class="arrow arrow2"><i class="fas fa-arrow-right"></i></div>
                        <div class="status status-3" onclick="showStatus('3')" style="margin-right: 25%"><i
                                class="fas fa-check-circle"></i> Hoàn
                            thành
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </section>
        </div>
        <div id="no_4" style="display: none">
            <section class="content">
                <div class="container-fluid">
                    <div class="status-container">
                        <div class="status status-1" onclick="showStatus('1')"><i class="fas fa-hourglass-half"></i>
                            Đang
                            chờ xác nhận
                        </div>
                        <div class="arrow arrow1"><i class="fas fa-arrow-right"></i></div>
                        <div class="status status-4" onclick="showStatus('4')" style="margin-right: 50%"><i
                                class="fas fa-times-circle"></i> Hủy
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </section>
        </div>
        <div id="no_5" style="display: none">
            <section class="content">
                <div class="container-fluid">
                    <div class="status-container">
                        <div class="status status-1" onclick="showStatus('1')"><i class="fas fa-hourglass-half"></i>
                            Quầy
                        </div>
                        <div class="arrow arrow1"><i class="fas fa-arrow-right"></i></div>
                        <div class="status status-3" onclick="showStatus('3')" style="margin-right: 50%"><i
                                class="fas fa-times-circle"></i> Hoàn thành
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </section>
        </div>
        <section class="content" style="margin-bottom: 20px">
            <form method="post">
                <input type="hidden" name="maDonHang" value="${hoaDon.ma}">
                <c:choose>
                    <c:when test="${trangThai == 1}">
                        <button class="button btn-button-xn" formaction="/admin/don_hang/xac_nhan">Xác nhận</button>
                        <button class="button btn-button-huy" id="addButton1" onclick="clickHuy()">Hủy đơn</button>
                        <button class="button btn-button-ct" style="margin-left: 71%;" id="addButton"
                                onclick="clickThem()">Chi tiết
                        </button>
                    </c:when>
                    <c:when test="${trangThai == 2}">
                        <button class="button btn-button-xn" formaction="/admin/don_hang/hoan_thanh">Hoàn thành</button>
                        <button class="button btn-button-ct" style="margin-left: 79%;" id="addButton"
                                onclick="clickThem()">Chi tiết
                        </button>
                    </c:when>
                    <c:when test="${trangThai == 3 || trangThai == 4|| trangThai == 5}">
                        <button class="button btn-button-ct" style="margin-left: 91%;" id="addButton"
                                onclick="clickThem()">Chi tiết
                        </button>
                    </c:when>
                </c:choose>
            </form>
            <!-- /.container-fluid -->
        </section>

        <c:choose>
            <c:when test="${trangThai != 0}">
                <section class="content"
                         style="background: white; margin: 15px;border-radius: 5px;box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2)">
                    <div class="container-fluid">
                        <div class="container">
                            <h3 style="text-align: left; padding-top: 10px; margin-bottom: 30px">THÔNG TIN ĐƠN HÀNG
                            </h3>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Mã: <span
                                            style="margin-left: 102px;background: gainsboro;padding: 10px;border-radius: 15px">${hoaDon.ma}</span></label>
                                </div>

                                <div class="form-group col-md-6">
                                    <c:choose>
                                        <c:when test="${hoaDon.khachHang == null}">
                                            <label>Khách hàng: <span
                                                    style="margin-left: 102px;background: #7adeee;padding: 10px;border-radius: 15px">Khách lẻ</span></label>
                                        </c:when>
                                        <c:when test="${hoaDon.khachHang == null}">
                                            <label>Khách hàng: <span
                                                    style="margin-left: 102px;background: #7adeee;padding: 10px;border-radius: 15px">${hoaDon.khachHang.ten}</span></label>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <c:choose>
                                        <c:when test="${trangThai == 1}">
                                            <label>Trạng thái: <span
                                                    style="margin-left: 50px;background: #ff8b33;padding: 10px;border-radius: 15px">Chờ xác nhận</span></label>
                                        </c:when>
                                        <c:when test="${trangThai == 2}">
                                            <label>Trạng thái: <span
                                                    style="margin-left: 50px;background: wheat;padding: 10px;border-radius: 15px">Đang giao</span></label>
                                        </c:when>
                                        <c:when test="${trangThai == 3}">
                                            <label>Trạng thái: <span
                                                    style="margin-left: 50px;background: springgreen;padding: 10px;border-radius: 15px">Hoàn thành</span></label>
                                        </c:when>
                                        <c:when test="${trangThai == 4}">
                                            <label>Trạng thái: <span
                                                    style="margin-left: 50px;background: red;padding: 10px;border-radius: 15px">Hủy</span></label>
                                        </c:when>
                                        <c:when test="${trangThai == 5}">
                                            <label>Trạng thái: <span
                                                    style="margin-left: 50px;background: springgreen;padding: 10px;border-radius: 15px">Hoàn thành</span></label>
                                        </c:when>
                                    </c:choose>
                                </div>
                                <div class="form-group col-md-6">
                                    <c:choose>
                                        <c:when test="${hoaDon.hinhThuc == 1 }">
                                            <label>Thanh toán: <span
                                                    style="margin-left: 105px;background: #C594C5;padding: 10px;border-radius: 15px">Tại quầy</span></label>
                                        </c:when>
                                        <c:when test="${hoaDon.hinhThuc == 2 }">
                                            <label>Thanh toán: <span
                                                    style="margin-left: 105px;background: #abdec7;padding: 10px;border-radius: 15px">Thanh toán Vnpay</span></label>
                                        </c:when>
                                        <c:when test="${hoaDon.hinhThuc == 3 }">
                                            <label>Thanh toán: <span
                                                    style="margin-left: 105px;background: #fff3c6;padding: 10px;border-radius: 15px">Thanh toán khi nhận hàng</span></label>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>
            </c:when>
        </c:choose>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <form method="post">
                            <div class="card">
                                <div class="card-header">
                                    <div class="col-12">
                                        <div class="row">
                                            <div class="form-group col-3">
                                                <select class="form-control" name="trangThai">
                                                    <option value="0" ${trangThaiSession == '0'?'selected':''}>Tất cả
                                                    </option>
                                                    <option value="1" ${trangThaiSession == '1'?'selected':''}>Chờ xác
                                                        nhận
                                                    </option>
                                                    <option value="2" ${trangThaiSession == '2'?'selected':''}>Đang
                                                        giao
                                                    </option>
                                                    <option value="3" ${trangThaiSession == '3'?'selected':''}>Hoàn
                                                        thành
                                                    </option>
                                                    <option value="4" ${trangThaiSession == '4'?'selected':''}>Hủy
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="form-group col-3">
                                                <div style="margin-top: 10px">
                                                    <label for="fromDate">Từ ngày:</label>
                                                    <input type="date" id="fromDate" name="fromDate">
                                                </div>
                                            </div>
                                            <div class="form-group col-3">
                                                <div style="margin-top: 10px">
                                                    <label for="toDate">Đến ngày:</label>
                                                    <input type="date" id="toDate" name="toDate">
                                                </div>
                                            </div>
                                            <div class="form-group col-1">
                                                <button id="locTheoThoiGian" formaction="/admin/quan_li_don_hang/loc">
                                                    Lọc
                                                </button>
                                            </div>
                                            <div class="form-group col-2">
                                                <a href="/export-excel">Xuất excel</a>
                                                <a href="/export-pdf">Xuất pdf</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th>Mã hóa đơn</th>
                                            <th>Số sản phẩm</th>
                                            <th>Tổng tiền</th>
                                            <th>Khách hàng</th>
                                            <th>Ngày tạo</th>
                                            <th>Hình thức</th>
                                            <th>Trạng thái đơn</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listDonHangDTOS}" var="list">
                                            <tr>
                                                <td>${list.hoaDon.ma}</td>
                                                <td>${list.soLuong}</td>
                                                <td><fmt:formatNumber value="${list.hoaDon.tongTien}" type="currency"
                                                                      currencySymbol="VNĐ"/></td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${list.ten == null}">
                                                            Khac lẻ
                                                        </c:when>
                                                        <c:when test="${list.ten != null}">
                                                            ${list.ten}
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:set var="dateTimeString" value="${list.hoaDon.ngayTao}"/>
                                                    <fmt:parseDate value="${dateTimeString}" var="parsedDate"
                                                                   pattern="yyyy-MM-dd'T'HH:mm:ss.SSS"/>
                                                    <fmt:formatDate value="${parsedDate}" var="formattedDate"
                                                                    pattern="yyyy-MM-dd HH:mm:ss"/>
                                                        ${formattedDate}
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${list.hoaDon.hinhThuc ==1}"><p
                                                                style="background: #C594C5;border-radius: 15px;text-align: center">
                                                            Tại quầy</p></c:when>
                                                        <c:when test="${list.hoaDon.hinhThuc ==2}"><p
                                                                style="background: #abdec7;border-radius: 15px;text-align: center">
                                                            VnPay</p></c:when>
                                                        <c:when test="${list.hoaDon.hinhThuc ==3}"><p
                                                                style="background: #fff3c6;border-radius: 15px;text-align: center">
                                                            Khi nhận hàng</p></c:when>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${list.hoaDon.trangThai ==1}"><p
                                                                style="background: #ff8b33;border-radius: 15px;text-align: center">
                                                            Chờ xác nhận</p></c:when>
                                                        <c:when test="${list.hoaDon.trangThai ==2}"><p
                                                                style="background: wheat;border-radius: 15px;text-align: center">
                                                            Đang giao</p></c:when>
                                                        <c:when test="${list.hoaDon.trangThai ==3}"><p
                                                                style="background: springgreen;border-radius: 15px;text-align: center">
                                                            Hoàn thành</p></c:when>
                                                        <c:when test="${list.hoaDon.trangThai ==4}"><p
                                                                style="background: red;border-radius: 15px;text-align: center">
                                                            Hủy</p></c:when>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <button formaction="/admin/quan_li_don_hang/detail" name="detail"
                                                            value="${list.hoaDon.ma}"
                                                            class="btn btn-primary me-2"><i class="fas fa-edit"></i> Detail
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>Mã hóa đơn</th>
                                            <th>Số sản phẩm</th>
                                            <th>Tổng tiền</th>
                                            <th>Khách hàng</th>
                                            <th>Ngày tạo</th>
                                            <th>Hình thức</th>
                                            <th>Trạng thái đơn</th>
                                            <th>Action</th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                    <div class="pagination mt-3">
                                        <div class="btn-table" id="prev">Previous</div>
                                        <div id="pageButtons" class="pagination mt-3"></div>
                                        <div class="btn-table" id="next">Next</div>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </form>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- Main content -->

        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<div id="addFormContainer" style="display: none;">
    <div class="container-fluid">
        <div class="container">
            <form method="post" id="addForm">
                <div class="row">
                    <div class="col-11">
                        <h3 style="text-align: center">Hóa đơn: <strong style="font-size: 35px">${hoaDon.ma}</strong></h3>
                    </div>
                    <div class="col-1 icon-x" onclick="dongIcon()">
                        <i class="fas fa-times"></i>
                    </div>
                </div>
                <div class="d-flex justify-content-between ">
                    <p style="width: 50px">Ảnh</p>
                    <p style="width: 200px">Tên sản phẩm</p>
                    <p style="width: 100px">Số lượng</p>
                    <p style="width: 100px">Tổng tiền</p>
                </div>

                <c:forEach items="${hoaDonChiTiets}" var="list">
                    <div class="d-flex justify-content-between ">
                        <p><img style="width: 50px; height: 50px; border: 1px solid #6e7881"
                                src="/images/${list.aoChiTiet.ao.anhs.get(0).ten_url}"></p>
                        <p style="width: 200px">${list.aoChiTiet.ao.ten}</p>
                        <p style="width: 100px">${list.soLuong}</p>
                        <p style="width: 100px"><fmt:formatNumber value="${list.donGia}" type="currency"
                                                                  currencySymbol="VNĐ"/></p>
                    </div>
                </c:forEach>
                <h5>Ngày tạo hóa đơn: <c:set var="dateTimeString" value="${hoaDon.ngayTao}"/>
                    <fmt:parseDate value="${dateTimeString}" var="parsedDate"
                                   pattern="yyyy-MM-dd'T'HH:mm:ss.SSS"/>
                    <fmt:formatDate value="${parsedDate}" var="formattedDate"
                                    pattern="dd-MM-yyyy HH:mm:ss"/>
                    ${formattedDate}</h5>
                <h5 style="padding-bottom: 10px; padding-top: 10px;display: <c:if
                        test="${hoaDon.ngayHoanThanh == null}">none</c:if>">
                    Ngày hoàn thành: <c:set var="dateTimeString" value="${hoaDon.ngayHoanThanh}"/>
                    <fmt:parseDate value="${dateTimeString}" var="parsedDate"
                                   pattern="yyyy-MM-dd'T'HH:mm:ss.SSS"/>
                    <fmt:formatDate value="${parsedDate}" var="formattedDate"
                                    pattern="dd-MM-yyyy HH:mm:ss"/>
                    ${formattedDate}
                </h5>
                <div style="display: <c:if test="${hoaDon.khachHang == null}">none</c:if>">
                    <h5 style="padding-bottom: 10px">Tên khách hàng : ${hoaDon.khachHang.ten}</h5>
                    <h5 style="padding-bottom: 10px">Sđt khách hàng : ${hoaDon.khachHang.sdt}</h5>
                    <h5 style="display: <c:if test="${hoaDon.moTa == null}">none</c:if>">Địa chỉ : ${hoaDon.moTa}</h5>
                </div>
            </form>
        </div>
    </div>
</div>
<div id="addFormContainer1" style="display: none;">
    <div class="container-fluid">
        <div class="container">
            <form method="post" id="addForm1">
                <input type="hidden" name="maDonHang" value="${hoaDon.ma}">
                <h3 style="text-align: center"><strong style="font-size: 35px">Xác nhận hủy đơn hàng</strong></h3>
                <h5>Mã hóa đơn : <strong>${hoaDon.ma}</strong></h5>
                <div class="d-flex justify-content-between ">
                    <p style="width: 50px">Ảnh</p>
                    <p style="width: 200px">Tên sản phẩm</p>
                    <p style="width: 100px">Số lượng</p>
                    <p style="width: 100px">Tổng tiền</p>
                </div>

                <c:forEach items="${hoaDonChiTiets}" var="list">
                    <div class="d-flex justify-content-between ">
                        <p><img style="width: 50px; height: 70px; border: 1px solid #6e7881"
                                src="/images/${list.aoChiTiet.ao.anhs.get(0).ten_url}"></p>
                        <p style="width: 200px">${list.aoChiTiet.ao.ten}</p>
                        <p style="width: 100px">${list.soLuong}</p>
                        <p style="width: 100px"><fmt:formatNumber value="${list.donGia}" type="currency"
                                                                  currencySymbol="VNĐ"/></p>
                    </div>
                </c:forEach>
                <h5>Tên khách hàng : ${hoaDon.khachHang.ten}</h5>
                <h5>Sđt khách hàng : ${hoaDon.khachHang.sdt}</h5>
                <div style="margin-top: 10px">
                    <label style="font-size: 25px">Lí do hủy đơn hàng :</label>
                    <br>
                    <textarea style="width: 50%" name="ghiChu"></textarea>
                    <br>
                    <button class="button btn-button-xnhuy" formaction="/admin/don_hang/huy">Hủy đơn</button>
                </div>
            </form>
        </div>
    </div>
</div>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

    window.onload = function () {
        showStatus('${trangThai}');
    };


    function showStatus(status) {
        event.preventDefault();

        var no_1 = document.getElementById("no_1");
        var no_2 = document.getElementById("no_2");
        var no_3 = document.getElementById("no_3");
        var no_4 = document.getElementById("no_4");
        var no_5 = document.getElementById("no_5");

        if (status == 1) {
            no_1.style.display = "block";
            no_2.style.display = "none";
            no_3.style.display = "none";
            no_4.style.display = "none";
            no_5.style.display = "none";
        }
        if (status == 2) {
            no_2.style.display = "block";
            no_1.style.display = "none";
            no_3.style.display = "none";
            no_4.style.display = "none";
            no_5.style.display = "none";
        }

        if (status == 3) {
            no_3.style.display = "block";
            no_2.style.display = "none";
            no_1.style.display = "none";
            no_4.style.display = "none";
            no_5.style.display = "none";
        }

        if (status == 4) {
            no_4.style.display = "block";
            no_2.style.display = "none";
            no_3.style.display = "none";
            no_1.style.display = "none";
            no_5.style.display = "none";
        }
        if (status == 5) {
            no_5.style.display = "block";
            no_2.style.display = "none";
            no_3.style.display = "none";
            no_1.style.display = "none";
            no_4.style.display = "none";
        }
    }
</script>
<script>
    var addButton = document.getElementById("addButton");
    var addFormContainer = document.getElementById("addFormContainer");

    // Add an event listener to the button
    addButton.addEventListener("click", function () {
        // Toggle the visibility of the form container
        if (addFormContainer.style.display === "none" || addFormContainer.style.display === "") {
            addFormContainer.style.display = "block";
        } else {
            addFormContainer.style.display = "none";
        }
    });

    // Add an event listener to the background overlay
    addFormContainer.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer) {
            // Hide the form
            addFormContainer.style.display = "none";
        }
    });

    function dongIcon() {
        addFormContainer.style.display = "none";
    }

    function clickThem() {
        event.preventDefault(); // Ngăn chặn submit form nếu có lỗi
    }
</script>
<script>
    var addButton1 = document.getElementById("addButton1");
    var addFormContainer1 = document.getElementById("addFormContainer1");

    // Add an event listener to the button
    addButton1.addEventListener("click", function () {
        // Toggle the visibility of the form container
        if (addFormContainer1.style.display === "none" || addFormContainer1.style.display === "") {
            addFormContainer1.style.display = "block";
        } else {
            addFormContainer1.style.display = "none";
        }
    });

    // Add an event listener to the background overlay
    addFormContainer1.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer1) {
            // Hide the form
            addFormContainer1.style.display = "none";
        }
    });

    function clickHuy() {
        event.preventDefault(); // Ngăn chặn submit form nếu có lỗi
    }
</script>
<script>
    $(document).ready(function () {
        var rowsPerPage = 20; // Số dòng trên mỗi trang
        var totalRows = $('#example1 tbody tr').length;
        var numPages = Math.ceil(totalRows / rowsPerPage);
        var currentPage = 1;

        // Ẩn tất cả các dòng ngoại trừ các dòng đầu tiên
        $('#example1 tbody tr').hide();
        $('#example1 tbody tr').slice(0, rowsPerPage).show();

        // Hiển thị số trang và màu xanh cho trang hiện tại
        function showPagination() {
            $('#pageButtons').empty();
            for (var i = 1; i <= numPages; i++) {
                $('#pageButtons').append('<button class="page-link">' + i + '</button>');
            }

            $('.page-link').removeClass('active');
            $('.page-link').eq(currentPage - 1).addClass('active');
        }

        showPagination();

        // Xử lý khi click vào trang
        $('#pageButtons').on('click', '.page-link', function () {
            currentPage = parseInt($(this).text());
            var start = (currentPage - 1) * rowsPerPage;
            var end = start + rowsPerPage;

            $('#example1 tbody tr').hide().slice(start, end).show();
            showPagination();
        });

        // Xử lý nút "Previous"
        $('.pagination').on('click', '#prev', function () {
            if (currentPage > 1) {
                currentPage--;
                var start = (currentPage - 1) * rowsPerPage;
                var end = start + rowsPerPage;

                $('#example1 tbody tr').hide().slice(start, end).show();
                showPagination();
            }
        });

        // Xử lý nút "Next"
        $('.pagination').on('click', '#next', function () {
            if (currentPage < numPages) {
                currentPage++;
                var start = (currentPage - 1) * rowsPerPage;
                var end = start + rowsPerPage;

                $('#example1 tbody tr').hide().slice(start, end).show();
                showPagination();
            }
        });
    });
</script>
</body>
</html>
