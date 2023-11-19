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
    <style>
        .divider {
            border-bottom: 1px dashed #aaa;
            margin: 10px 0;
        }

        button#prevPageButton,
        button#nextPageButton,
        button#prevPageButton2,
        button#nextPageButton2,
        button#prevPageButton3,
        button#nextPageButton3,
        button#prevPageButton4,
        button#nextPageButton4 {
            background-color: #007bff; /* Màu nền */
            color: #fff; /* Màu chữ */
            border: none;
            padding: 10px 20px; /* Kích thước nút */
            margin: 5px; /* Khoảng cách giữa nút */
            cursor: pointer;
            transition: background-color 0.3s ease; /* Hiệu ứng chuyển đổi màu nền */

            /* Bo tròn các góc */
            border-radius: 5px;
        }

        /* Hover effect */
        button#prevPageButton:hover,
        button#nextPageButton:hover,
        button#prevPageButton2:hover,
        button#nextPageButton2:hover,
        button#prevPageButton3:hover,
        button#nextPageButton3:hover,
        button#prevPageButton4:hover,
        button#nextPageButton4:hover {
            background-color: #0056b3; /* Màu nền thay đổi khi hover */
        }
    </style>
    <style>
        #addFormContainer1, #addFormContainer2, #addFormContainer3, #addFormContainer4 {
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

        #addForm1, #addForm2, #addForm3, #addForm4 {
            background-color: white; /* Màu nền của biểu mẫu */
            padding: 20px;
            border-radius: 5px; /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Đổ bóng cho biểu mẫu */
        }

        #addForm1 button[type="submit"], #addForm2 button[type="submit"], #addForm3 button[type="submit"], #addForm4 button[type="submit"] {
            background-color: #007BFF; /* Màu nền của nút */
            color: white; /* Màu chữ trắng */
            border: none;
            cursor: pointer;
        }

        #addForm1 button[type="submit"]:hover, #addForm2 button[type="submit"]:hover, #addForm3 button[type="submit"]:hover, #addForm4 button[type="submit"]:hover {
            background-color: #0056b3; /* Màu nền khi di chuột vào */
        }
        .listDonHang {
            color: black;
            text-decoration: none; /* Loại bỏ gạch chân mặc định của liên kết */
            transition: color 0.3s; /* Hiệu ứng chuyển đổi màu sắc trong 0.3 giây */
        }
        .listDonHang:hover{
            color: #0000C0;
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
                                <a href="/admin/index/1" class="nav-link active">
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
                        </h1>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-info">
                            <div class="inner">
                                <h3>${soDonMoi}</h3>

                                <p>Đơn mới chờ xác nhận</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-bag"></i>
                            </div>
                            <a class="small-box-footer" id="addButton1">Thêm thông tin <i
                                    class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <!-- ./col -->
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-warning">
                            <div class="inner">
                                <h3>${soDonDangGiao}</h3>

                                <p>Đơn đang giao</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person-add"></i>
                            </div>
                            <a class="small-box-footer" id="addButton2">Thêm thông tin <i
                                    class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-success">
                            <div class="inner">
                                <h3>${soDonHoanThanh}</h3>

                                <p>Đơn mới hoàn thành</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                            <a class="small-box-footer" id="addButton3">Thêm thông tin <i
                                    class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-danger">
                            <div class="inner">
                                <h3>${soDonHuy}</h3>

                                <p>Đơn mới hủy</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-pie-graph"></i>
                            </div>
                            <a class="small-box-footer" id="addButton4">Thêm thông tin <i
                                    class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                </div>
            </div>
        </section>
        <div id="addFormContainer1" style="display: none;">
            <div class="container-fluid">
                <div class="container">
                    <form method="post" id="addForm1">
                        <h3 style="text-align: center">Đơn mới chờ xác nhận</h3>

                        <c:forEach items="${listHoaDonChoXacNhanDTOS}" var="list" varStatus="vTri">
                            <div class="data-item1">
                                <div class="d-flex justify-content-between ">
                                    <p><img style="width: 50px"
                                            src="/images/${list.hoaDonChiTiet.aoChiTiet.ao.anhs.get(0).ten_url}"></p>
                                    <p style="width: 200px">${list.hoaDonChiTiet.aoChiTiet.ao.ten}</p>
                                    <p><fmt:formatNumber value="${list.gia}" type="currency" currencySymbol="VNĐ"/></p>
                                    <p>${list.hoaDonChiTiet.soLuong}</p>
                                </div>
                                <div class="divider"></div>
                            </div>
                        </c:forEach>

                        <button id="prevPageButton">Pre</button>
                        <button id="nextPageButton">Next</button>
                    </form>

                </div>
            </div>
        </div>
        <div id="addFormContainer2" style="display: none;">
            <div class="container-fluid">
                <div class="container">
                    <form method="post" id="addForm2">
                        <h3 style="text-align: center">Đơn đang giao</h3>

                        <c:forEach items="${listHoaDonDangGiaoDTOS}" var="list" varStatus="vTri">
                            <div class="data-item2">
                                <div class="d-flex justify-content-between ">
                                    <p><img style="width: 50px"
                                            src="/images/${list.hoaDonChiTiet.aoChiTiet.ao.anhs.get(0).ten_url}"></p>
                                    <p style="width: 200px">${list.hoaDonChiTiet.aoChiTiet.ao.ten}</p>
                                    <p><fmt:formatNumber value="${list.gia}" type="currency" currencySymbol="VNĐ"/></p>
                                    <p>${list.hoaDonChiTiet.soLuong}</p>
                                </div>
                                <div class="divider"></div>
                            </div>
                        </c:forEach>

                        <button id="prevPageButton2">Pre</button>
                        <button id="nextPageButton2">Next</button>
                    </form>
                </div>
            </div>
        </div>
        <div id="addFormContainer3" style="display: none;">
            <div class="container-fluid">
                <div class="container">
                    <form method="post" id="addForm3">
                        <h3 style="text-align: center">Đơn mới hoàn thành</h3>

                        <c:forEach items="${listHoaDonHoanThanhDTOS}" var="list" varStatus="vTri">
                            <div class="data-item3">
                                <div class="d-flex justify-content-between ">
                                    <p><img style="width: 50px"
                                            src="/images/${list.hoaDonChiTiet.aoChiTiet.ao.anhs.get(0).ten_url}"></p>
                                    <p style="width: 200px">${list.hoaDonChiTiet.aoChiTiet.ao.ten}</p>
                                    <p><fmt:formatNumber value="${list.gia}" type="currency" currencySymbol="VNĐ"/></p>
                                    <p>${list.hoaDonChiTiet.soLuong}</p>
                                </div>
                                <div class="divider"></div>
                            </div>
                        </c:forEach>

                        <button id="prevPageButton3">Pre</button>
                        <button id="nextPageButton3">Next</button>
                    </form>
                </div>
            </div>
        </div>
        <div id="addFormContainer4" style="display: none;">
            <div class="container-fluid">
                <div class="container">
                    <form method="post" id="addForm4">
                        <h3 style="text-align: center">Đơn mới hủy</h3>

                        <c:forEach items="${listHoaDonHuyDTOS}" var="list" varStatus="vTri">
                            <div class="data-item4">
                                <div class="d-flex justify-content-between ">
                                    <p><img style="width: 50px"
                                            src="/images/${list.hoaDonChiTiet.aoChiTiet.ao.anhs.get(0).ten_url}"></p>
                                    <p style="width: 200px">${list.hoaDonChiTiet.aoChiTiet.ao.ten}</p>
                                    <p><fmt:formatNumber value="${list.gia}" type="currency" currencySymbol="VNĐ"/></p>
                                    <p>${list.hoaDonChiTiet.soLuong}</p>
                                </div>
                                <div class="divider"></div>
                            </div>
                        </c:forEach>

                        <button id="prevPageButton4">Pre</button>
                        <button id="nextPageButton4">Next</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="row">
            <!-- Left col -->
            <section class="col-lg-7 connectedSortable">
                <!-- Custom tabs (Charts with tabs)-->
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="fas fa-chart-pie mr-1"></i>
                            Thống kê đơn hàng
                        </h3>
                        <div class="card-tools">
                            <ul class="nav nav-pills ml-auto">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#revenue-chart" data-toggle="tab">Theo ngày</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#sales-chart" data-toggle="tab">Theo tháng</a>
                                </li>
                            </ul>
                        </div>
                    </div><!-- /.card-header -->

                    <div class="card-body">
                        <div class="tab-content p-0">
                            <!-- Morris chart - Sales -->
                            <div class="chart tab-pane active" id="revenue-chart"
                                 style="position: relative; height: 450px;">
                                <div id="container">
                                    <canvas id="myChart" width="400" height="200"></canvas>
                                    <div id="button-container">
                                        <button id="prevWeek">Trước</button>
                                        <button id="nextWeek">Sau</button>
                                    </div>
                                </div>
                            </div>
                            <div class="chart tab-pane" id="sales-chart" style="position: relative; height: 450px;">
                                <canvas id="myChart1" width="400" height="200"></canvas>
                            </div>
                        </div>

                    </div><!-- /.card-body -->
                </div>
            </section>
            <section class="col-lg-5 connectedSortable">
                <div class="card bg-gradient-primary">
                    <div class="card-header border-0">
                        <h3 class="card-title">
                            <i class="fas fa-shopping-cart"></i>
                            Hiện tại
                        </h3>
                        <!-- card tools -->
                        <div class="card-tools">
                            <button type="button" class="btn btn-primary btn-sm" data-card-widget="collapse"
                                    title="Collapse">
                                <i class="fas fa-minus"></i>
                            </button>
                        </div>
                        <!-- /.card-tools -->
                    </div>
                    <div class="card-body" style="background: white; color: #0a0e14">
                        <c:forEach items="${page.content}" var="list">
                            <div style="margin-bottom: 10px">
                                <a href="/admin/quan_li_don_hang/${list.ma}" class="listDonHang">
                                    <div style="display: inline-block;width: 150px">${list.ma}</div>
                                    <div style="display: inline-block;width: 120px">${list.khachHang.ten}</div>
                                    <div style="display: inline-block;width: 100px">
                                        <fmt:formatNumber value="${list.tongTien}" type="currency"
                                                          currencySymbol="VNĐ"/>
                                    </div>
                                    <c:choose>
                                        <c:when test="${list.trangThai == 1}">
                                            <div style="display: inline-block;width: 100px;text-align: center;background: #ff8b33;border-radius: 15px">
                                                Chờ xác nhận
                                            </div>
                                        </c:when>
                                        <c:when test="${list.trangThai == 2}">
                                            <div style="display: inline-block;width: 100px;text-align: center;background: wheat;border-radius: 15px">
                                                Đang giao
                                            </div>
                                        </c:when>
                                        <c:when test="${list.trangThai == 3}">
                                            <div style="display: inline-block;width: 100px;text-align: center;background: springgreen;border-radius: 15px">
                                                Hoàn thành
                                            </div>
                                        </c:when>
                                        <c:when test="${list.trangThai == 4}">
                                            <div style="display: inline-block;width: 100px;text-align: center;background: red;border-radius: 15px">
                                                Hủy
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </a>
                            </div>
                        </c:forEach>
                        <ul class="pagination">
                            <c:if test="${not page.first}">
                                <li class="page-item">
                                    <a href="?pageNo=${page.number -1}">Pre</a>
                                </li>
                            </c:if>
                            <c:forEach begin="0" end="${page.totalPages > 1 ? page.totalPages - 1 : 0}" var="i">
                                <li class="page-item <c:if test='${i == page.number}'>active</c:if>">
                                    <a class="page-link" href="?pageNo=${i}">${i + 1}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${not page.last}">
                                <li class="page-item">
                                    <a href="?pageNo=${page.number +1}">Next</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                    <!-- /.card-body-->
                </div>
            </section>
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
        ${thongKeDTO.soLuong},
        </c:forEach>
    ];

    var ngayThanhToan = [
        // Dữ liệu ngày từ danh sách ThongKeDTO
        <c:forEach items="${listThongKeDTOS}" var="thongKeDTO">
        '${thongKeDTO.ngayThanhToan}',
        </c:forEach>
    ];

    // Sắp xếp ngày thanh toán theo thứ tự tăng dần
    ngayThanhToan.sort(function(a, b) {
        return new Date(b) - new Date(a);
    });

    var ctx = document.getElementById('myChart').getContext('2d');
    var currentWeek = 0;
    var weeksData = [];

    for (var i = 0; i < weeklyData.length; i += 7) {
        var weekData = weeklyData.slice(i, i + 7);
        weeksData.push(weekData);
    }

    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ngayThanhToan.slice(currentWeek * 7, (currentWeek + 1) * 7),
            datasets: [{
                label: 'Số sản phẩm hoàn thành',
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
    // Get references to the button and form container
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
</script>
<script>
    // Get references to the button and form container
    var addButton2 = document.getElementById("addButton2");
    var addFormContainer2 = document.getElementById("addFormContainer2");

    // Add an event listener to the button
    addButton2.addEventListener("click", function () {
        // Toggle the visibility of the form container
        if (addFormContainer2.style.display === "none" || addFormContainer2.style.display === "") {
            addFormContainer2.style.display = "block";
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
</script>
<script>
    // Get references to the button and form container
    var addButton3 = document.getElementById("addButton3");
    var addFormContainer3 = document.getElementById("addFormContainer3");

    // Add an event listener to the button
    addButton3.addEventListener("click", function () {
        // Toggle the visibility of the form container
        if (addFormContainer3.style.display === "none" || addFormContainer3.style.display === "") {
            addFormContainer3.style.display = "block";
        } else {
            addFormContainer3.style.display = "none";
        }
    });

    // Add an event listener to the background overlay
    addFormContainer3.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer3) {
            // Hide the form
            addFormContainer3.style.display = "none";
        }
    });
</script>
<script>
    // Get references to the button and form container
    var addButton4 = document.getElementById("addButton4");
    var addFormContainer4 = document.getElementById("addFormContainer4");

    // Add an event listener to the button
    addButton4.addEventListener("click", function () {
        // Toggle the visibility of the form container
        if (addFormContainer4.style.display === "none" || addFormContainer4.style.display === "") {
            addFormContainer4.style.display = "block";
        } else {
            addFormContainer4.style.display = "none";
        }
    });

    // Add an event listener to the background overlay
    addFormContainer4.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer4) {
            // Hide the form
            addFormContainer4.style.display = "none";
        }
    });
</script>
<script>
    var dataContainer1 = document.getElementById("addFormContainer1");
    var dataItems1 = dataContainer1.getElementsByClassName("data-item1");
    var itemsPerPage = 4; // Số lượng dữ liệu trên mỗi trang
    var currentPage = 1; // Trang hiện tại

    function showDataOnPage(page) {
        for (var i = 0; i < dataItems1.length; i++) {
            dataItems1[i].style.display = "none"; // Ẩn tất cả các dữ liệu
        }

        var startIndex = (page - 1) * itemsPerPage;
        var endIndex = startIndex + itemsPerPage;

        for (var i = startIndex; i < endIndex && i < dataItems1.length; i++) {
            dataItems1[i].style.display = "block"; // Hiển thị các dữ liệu trên trang hiện tại
        }
    }

    // Gọi hàm hiển thị trang đầu tiên khi trang web được nạp
    showDataOnPage(currentPage);

    // Xử lý nút "Trang trước"
    document.getElementById("prevPageButton").addEventListener("click", function () {
        if (currentPage > 1) {
            currentPage--;
            showDataOnPage(currentPage);
        }
        event.preventDefault();
    });

    // Xử lý nút "Trang tiếp theo"
    document.getElementById("nextPageButton").addEventListener("click", function () {
        var maxPage = Math.ceil(dataItems1.length / itemsPerPage);
        if (currentPage < maxPage) {
            currentPage++;
            showDataOnPage(currentPage);
        }
        event.preventDefault();
    });

</script>
<script>
    var dataContainer2 = document.getElementById("addFormContainer2");
    var dataItems2 = dataContainer2.getElementsByClassName("data-item2");
    var itemsPerPage = 4; // Số lượng dữ liệu trên mỗi trang
    var currentPage = 1; // Trang hiện tại

    function showDataOnPage(page) {
        for (var i = 0; i < dataItems2.length; i++) {
            dataItems2[i].style.display = "none"; // Ẩn tất cả các dữ liệu
        }

        var startIndex = (page - 1) * itemsPerPage;
        var endIndex = startIndex + itemsPerPage;

        for (var i = startIndex; i < endIndex && i < dataItems2.length; i++) {
            dataItems2[i].style.display = "block"; // Hiển thị các dữ liệu trên trang hiện tại
        }
    }

    // Gọi hàm hiển thị trang đầu tiên khi trang web được nạp
    showDataOnPage(currentPage);

    // Xử lý nút "Trang trước"
    document.getElementById("prevPageButton2").addEventListener("click", function () {
        if (currentPage > 1) {
            currentPage--;
            showDataOnPage(currentPage);
        }
        event.preventDefault();
    });

    // Xử lý nút "Trang tiếp theo"
    document.getElementById("nextPageButton2").addEventListener("click", function () {
        var maxPage = Math.ceil(dataItems2.length / itemsPerPage);
        if (currentPage < maxPage) {
            currentPage++;
            showDataOnPage(currentPage);
        }
        event.preventDefault();
    });

</script>
<script>
    var dataContainer3 = document.getElementById("addFormContainer3");
    var dataItems3 = dataContainer3.getElementsByClassName("data-item3");
    var itemsPerPage = 4; // Số lượng dữ liệu trên mỗi trang
    var currentPage = 1; // Trang hiện tại

    function showDataOnPage(page) {
        for (var i = 0; i < dataItems3.length; i++) {
            dataItems3[i].style.display = "none"; // Ẩn tất cả các dữ liệu
        }

        var startIndex = (page - 1) * itemsPerPage;
        var endIndex = startIndex + itemsPerPage;

        for (var i = startIndex; i < endIndex && i < dataItems3.length; i++) {
            dataItems3[i].style.display = "block"; // Hiển thị các dữ liệu trên trang hiện tại
        }
    }

    // Gọi hàm hiển thị trang đầu tiên khi trang web được nạp
    showDataOnPage(currentPage);

    // Xử lý nút "Trang trước"
    document.getElementById("prevPageButton3").addEventListener("click", function () {
        if (currentPage > 1) {
            currentPage--;
            showDataOnPage(currentPage);
        }
        event.preventDefault();
    });

    // Xử lý nút "Trang tiếp theo"
    document.getElementById("nextPageButton3").addEventListener("click", function () {
        var maxPage = Math.ceil(dataItems3.length / itemsPerPage);
        if (currentPage < maxPage) {
            currentPage++;
            showDataOnPage(currentPage);
        }
        event.preventDefault();
    });

</script>
<script>
    var dataContainer4 = document.getElementById("addFormContainer4");
    var dataItems4 = dataContainer4.getElementsByClassName("data-item4");
    var itemsPerPage = 4; // Số lượng dữ liệu trên mỗi trang
    var currentPage = 1; // Trang hiện tại

    function showDataOnPage(page) {
        for (var i = 0; i < dataItems4.length; i++) {
            dataItems4[i].style.display = "none"; // Ẩn tất cả các dữ liệu
        }

        var startIndex = (page - 1) * itemsPerPage;
        var endIndex = startIndex + itemsPerPage;

        for (var i = startIndex; i < endIndex && i < dataItems4.length; i++) {
            dataItems4[i].style.display = "block"; // Hiển thị các dữ liệu trên trang hiện tại
        }
    }

    // Gọi hàm hiển thị trang đầu tiên khi trang web được nạp
    showDataOnPage(currentPage);

    // Xử lý nút "Trang trước"
    document.getElementById("prevPageButton4").addEventListener("click", function () {
        if (currentPage > 1) {
            currentPage--;
            showDataOnPage(currentPage);
        }
        event.preventDefault();
    });

    // Xử lý nút "Trang tiếp theo"
    document.getElementById("nextPageButton4").addEventListener("click", function () {
        var maxPage = Math.ceil(dataItems4.length / itemsPerPage);
        if (currentPage < maxPage) {
            currentPage++;
            showDataOnPage(currentPage);
        }
        event.preventDefault();
    });

</script>
<script>
    // Lấy dữ liệu từ model và chuyển đổi thành mảng JavaScript
    var labels = [];
    var soDonHoanThanhData = [];
    var soDonHuyData = [];
    var tongTienHoanThanhData = [];
    var tongTienHuyData = [];

    <c:forEach var="bieuDoDTO" items="${listBieuDoDTOS}">
    labels.push("${bieuDoDTO.thang}");
    soDonHoanThanhData.push(${bieuDoDTO.soDonHoanThanh});
    soDonHuyData.push(${bieuDoDTO.soDonHuy});
    tongTienHoanThanhData.push(${bieuDoDTO.tongTienHoanThanh});
    tongTienHuyData.push(${bieuDoDTO.tongTienHuy});
    </c:forEach>

    var ctx = document.getElementById('myChart1').getContext('2d');

    var myChart1 = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Số đơn hoàn thành',
                data: soDonHoanThanhData,
                backgroundColor: 'rgba(75, 192, 192, 0.2)', // Màu của cột
                borderColor: 'rgba(75, 192, 192, 1)', // Màu viền của cột
                borderWidth: 1,
                yAxisID: 'left-y-axis'
            }, {
                label: 'Số đơn hủy',
                data: soDonHuyData,
                backgroundColor: 'rgba(255, 99, 132, 0.2)', // Màu của cột
                borderColor: 'rgba(255, 99, 132, 1)', // Màu viền của cột
                borderWidth: 1,
                yAxisID: 'left-y-axis'
            }, {
                label: 'Tổng tiền hoàn thành',
                data: tongTienHoanThanhData,
                type: 'line', // Loại biểu đồ là Line
                fill: false,
                borderColor: 'rgba(75, 192, 192, 1)', // Màu của đường
                yAxisID: 'right-y-axis'
            }, {
                label: 'Tổng tiền hủy',
                data: tongTienHuyData,
                type: 'line', // Loại biểu đồ là Line
                fill: false,
                borderColor: 'rgba(255, 99, 132, 1)', // Màu của đường
                yAxisID: 'right-y-axis'
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
</body>
</html>
