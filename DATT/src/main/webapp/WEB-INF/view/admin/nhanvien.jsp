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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
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
            background-color: white; /* Màu nền của biểu mẫu */
            padding: 20px;
            border-radius: 5px; /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Đổ bóng cho biểu mẫu */
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

                    <li class="nav-item ">
                        <a href="#" class="nav-link">
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
                                <a href="/admin/loai_ao/view/1" class="nav-link ">
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
                                <a href="/admin/form/view/1" class="nav-link ">
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
                    <li class="nav-item menu-open">
                        <a href="#" class="nav-link active">
                            <i class="nav-icon fas fa-user"></i>
                            <p>
                                Quản Lý Tài Khoản
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/admin/nhanvien/1" class="nav-link active">
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
                        <h1>Nhân viên</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="/admin/index/1">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Nhân viên</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <form method="post">
                            <div class="card">
                                <div class="card-header">
                                    <button class="btn btn-success" id="addButton" onclick="clickThem()"><i class="fas fa-plus"></i> Thêm</button>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th>Mã</th>
                                            <th>Tên</th>
                                            <th>Ngày Sinh</th>
                                            <th>Giới Tính</th>
                                            <th>Xã</th>
                                            <th>Huyện</th>
                                            <th>Tỉnh</th>
                                            <th>SDT</th>
                                            <th>Email</th>
                                            <th>Mật Khẩu</th>
                                            <th>Trạng thái</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listNhanVien}" var="list">
                                            <tr>
                                                <td>${list.ma}</td>
                                                <td>${list.ten}</td>
                                                <td>${list.ngay_sinh}</td>
                                                <td>${list.gioiTinh==0?"Nam":"Nữ"}</td>
                                                <td>${list.dia_chi}</td>
                                                <td>${list.thanh_pho}</td>
                                                <td>${list.quoc_gia}</td>
                                                <td>${list.sdt}</td>
                                                <td>${list.email}</td>
                                                <td>${list.matKhau}</td>
                                                <td>${list.trangThai==1?'Hoạt Động':'Ngừng Hoạt Động'}</td>
                                                <td>
                                                    <button formaction="/admin/nhanvien/detail" name="detail"
                                                            value="${list.id}"
                                                            class="btn btn-primary me-2"><i class="fas fa-edit"></i>Detail
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>Mã</th>
                                            <th>Tên</th>
                                            <th>Ngày Sinh</th>
                                            <th>Giới Tính</th>
                                            <th>Xã</th>
                                            <th>Huyện</th>
                                            <th>Tỉnh</th>
                                            <th>SDT</th>
                                            <th>Email</th>
                                            <th>Mật Khẩu</th>
                                            <th>Trạng thái</th>
                                            <th>Action</th>
                                        </tr>
                                        </tfoot>
                                    </table>
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
        <div id="addFormContainer" style="display: none;">
            <div class="container-fluid">
                <div class="container">
                    <form method="post" id="addForm">
                        <h3 style="text-align: center">Nhân viên</h3>
                        <input type="hidden" name="id" value="${item.id}">
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="formGroupExampleInput2">Tên <span class="text-danger">(*)</span> :</label>
                                <input type="text" name="ten" value="${item.ten}" class="form-control"
                                       id="formGroupExampleInput2" placeholder="Tên ">
                                <span id="errorTen" class="text-danger"></span>
                            </div>
                            <fieldset class="form-group col-md-4">
                                <div class="row">
                                    <legend class="col-form-label col-md-12 pt-0">Giới Tính :</legend>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="form-check col-md-6">
                                                <input class="form-check-input" type="radio" name="gioiTinh"
                                                       id="gridRadios11"
                                                       value="0" ${item.gioiTinh == 0 ? 'checked' : ''}>
                                                <label class="form-check-label" for="gridRadios11">
                                                    Nam
                                                </label>
                                            </div>
                                            <div class="form-check col-md-6">
                                                <input class="form-check-input" type="radio" name="gioiTinh"
                                                       id="gridRadios22"
                                                       value="1" ${item.gioiTinh == 1 ? 'checked' : ''}>
                                                <label class="form-check-label" for="gridRadios22">
                                                    Nữ
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                            <div class="form-group col-md-4">
                                <label for="exampleFormControlTextarea11">Ngày Sinh <span class="text-danger">(*)</span>
                                    :</label>
                                <input type="date" class="form-control" id="exampleFormControlTextarea11"
                                       name="ngay_sinh" value="${item.ngay_sinh}">
                                <span id="errorNgaySinh" class="text-danger"></span>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="formGroupExampleInput2">Xã <span class="text-danger">(*)</span>
                                    :</label>

                                <select id="ward" class="form-control" onchange="checkSelection()" disabled>
                                    <option value="">${item.dia_chi}</option>
                                </select>
                                <input type="hidden" id="xa1" name="diaChi" value="${item.dia_chi}">

                                <span id="errorDiaChi" class="text-danger"></span>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="formGroupExampleInput2">Huyện <span class="text-danger">(*)</span>
                                    :</label>
                                <select id="district"  class="form-control" onchange="loadWards(); checkSelection()"
                                        disabled>
                                    <option value="">${item.thanh_pho}</option>
                                </select>
                                <input type="hidden" id="huyen1" name="thanh_pho" value="${item.thanh_pho}">

                                <span id="errorThanhPho" class="text-danger"></span>
                            </div>
                            <!-- Trường mới 1: Quốc Gia -->
                            <div class="form-group col-md-4">
                                <label>Tỉnh: <span class="text-danger">(*)</span></label>

                                <select id="province"  class="form-control" onchange="loadDistricts(); checkSelection()">
                                    <option value="">${item.quoc_gia}</option>
                                </select>
                                <input type="hidden" id="tinh1" name="quoc_gia" value="${item.quoc_gia}">
                                <span id="errorQuocGia" class="text-danger"></span>
                            </div>
                        </div>
                        <!-- Trường mới 2: Số Điện Thoại -->
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="formGroupSDT">Số Điện Thoại:</label>
                                <input type="tel" name="sdt" value="${item.sdt}" class="form-control" id="formGroupSDT"
                                       placeholder="Số Điện Thoại">
                                <span id="errorSDT" class="text-danger"></span>
                            </div>

                            <!-- Trường mới 3: Email -->
                            <div class="form-group col-md-4">
                                <label for="formGroupEmail">Email:</label>
                                <input type="email" name="email" value="${item.email}" class="form-control"
                                       id="formGroupEmail" placeholder="Email">
                                <span id="errorEmail" class="text-danger"></span>
                            </div>

                            <!-- Trường mới 4: Mật Khẩu -->
                            <div class="form-group col-md-4">
                                <label for="formGroupMatKhau">Mật Khẩu:</label>
                                <input type="password" name="matKhau" value="${item.matKhau}" class="form-control"
                                       id="formGroupMatKhau" placeholder="Mật Khẩu">
                                <span id="errorMatKhau" class="text-danger"></span>
                            </div>
                        </div>
                        <!-- Trường mới 6: Trạng Thái -->
                        <fieldset class="form-group">
                            <div class="row">
                                <legend class="col-form-label col-sm-2 pt-0">Trạng Thái :</legend>
                                <div class="col-sm-10">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="trangthai" id="gridRadios1"
                                               value="1" ${item.trangThai == 1 ? 'checked' : ''}>
                                        <label class="form-check-label" for="gridRadios1">
                                            Hoạt Động
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="trangthai" id="gridRadios2"
                                               value="0" ${item.trangThai == 0 ? 'checked' : ''}>
                                        <label class="form-check-label" for="gridRadios2">
                                            Không Hoạt Động
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <button  hidden id="bt1" class="btn btn-success" formaction="/admin/nhanvien/add" type="submit"
                                 onclick="addProduct()"><i class="fas fa-plus"></i> Thêm Mới
                        </button>
                        <button  id="bt3" class="btn btn-primary" formaction="/admin/nhanvien/update" type="submit"
                                 onclick="addProduct()"><i class="fas fa-sync"></i> Cập nhật
                        </button>
                        <button hidden id="bt2" class="btn btn-primary" formaction="/admin/nhanvien/clear" type="submit">Clear</button>
                    </form>

                </div>
            </div>
        </div>
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
<script>
    // Get references to the button and form container
    var addButton = document.getElementById("addButton");
    var addFormContainer = document.getElementById("addFormContainer");
    var bt1 = document.getElementById("bt1");
    var bt2 = document.getElementById("bt2");
    var bt3 = document.getElementById("bt3");

    // Add an event listener to the button
    addButton.addEventListener("click", function () {
        // Toggle the visibility of the form container
        if (addFormContainer.style.display === "none" || addFormContainer.style.display === "") {
            addFormContainer.style.display = "block";
            bt1.hidden=false;
            bt2.hidden=false;
            bt3.hidden=true;
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

    if (window.location.href === "http://localhost:8080/admin/nhanvien/1") {
        // If the URL matches, show the form container
        addFormContainer.style.display = "none";
    } else {
        addFormContainer.style.display = "block";
    }

    function clickThem() {
        event.preventDefault(); // Ngăn chặn submit form nếu có lỗi
    }
</script>
<script>
    function addProduct() {
        var ma = document.getElementsByName('ma')[0].value;
        var ten = document.getElementsByName('ten')[0].value;
        var diaChi = document.getElementsByName('diaChi')[0].value;
        var errorMa = document.getElementById('errorMa');
        var errorTen = document.getElementById('errorTen');
        var errorDiaChi = document.getElementById('errorDiaChi');
        var hasError = false;

        if (ma.trim() === '') {
            errorMa.innerText = 'Vui lòng nhập mã.';
            hasError = true;
        } else {
            errorMa.innerText = '';
        }

        if (ten.trim() === '') {
            errorTen.innerText = 'Vui lòng nhập tên.';
            hasError = true;
        } else {
            errorTen.innerText = '';
        }
        if (diaChi.trim() === '') {
            errorDiaChi.innerText = 'Vui lòng nhập địa chỉ.';
            hasError = true;
        } else {
            errorTen.innerText = '';
        }

        if (hasError) {
            event.preventDefault(); // Ngăn chặn submit form nếu có lỗi
        }
    }
</script>
<script>

    var priceInput = document.getElementById("price");
    var priceInput1 = document.getElementById("price1");
    var currentPrice = parseFloat(${tongTien});
    var quocGiaValue = '${item.quoc_gia}';
    async function loadProvinces() {
        const response = await fetch(`http://localhost:8080/public/provinces`);
        const data = await response.json();

        const provinceSelect = document.getElementById("province");
        if (quocGiaValue===null||quocGiaValue===""){
            provinceSelect.innerHTML = '<option value="">Chọn tỉnh</option>';
        }


        for (const province of data.data) { // Thay đổi dòng này để lấy dữ liệu từ data.data
            const option = document.createElement("option");
            option.value = province.ProvinceID;
            option.text = province.ProvinceName;
            provinceSelect.appendChild(option);
            console.log(province.ProvinceID, province.ProvinceName);
        }
    }


    async function loadDistricts() {
        const provinceId = document.getElementById("province").value;

        if (!provinceId) {
            return;
        }

        const response = await fetch('http://localhost:8080/public/districts?province_id=' + provinceId);
        const data = await response.json();

        const districtSelect = document.getElementById("district");
        districtSelect.innerHTML = '<option value="">Chọn huyện</option>';

        for (const district of data.data) {
            const option = document.createElement("option");
            option.value = district.DistrictID;
            option.text = district.DistrictName;
            districtSelect.appendChild(option);
        }

        districtSelect.disabled = false;
        document.getElementById("ward").disabled = true;
        document.getElementById("message").innerText = "";
    }

    async function loadWards() {
        const districtId = document.getElementById("district").value;

        if (!districtId) {
            return;
        }

        const response = await fetch('http://localhost:8080/public/wards?district_id=' + districtId);
        const data = await response.json();

        const wardSelect = document.getElementById("ward");
        wardSelect.innerHTML = '<option value="">Chọn xã</option>';

        for (const ward of data.data) {
            const option = document.createElement("option");
            option.value = ward.WardCode;
            option.text = ward.WardName;
            wardSelect.appendChild(option);
        }

        wardSelect.disabled = false;
        document.getElementById("message").innerText = "";
    }

    function checkSelection() {
        const provinceSelect = document.getElementById("province");
        const districtSelect = document.getElementById("district");
        const wardSelect = document.getElementById("ward");

        const provinceName = provinceSelect.options[provinceSelect.selectedIndex].text;
        const districtName = districtSelect.options[districtSelect.selectedIndex].text;
        const wardName = wardSelect.options[wardSelect.selectedIndex].text;

        if (provinceName) {
            document.getElementById("tinh1").value = provinceName;
        }

        if (districtName) {
            document.getElementById("huyen1").value = districtName;
        }

        if (wardName) {
            document.getElementById("xa1").value = wardName;
        }

        if (provinceName && districtName && wardName) {
            calculateShipping();
        } else {
            document.getElementById("message").innerText = "";
            // Khóa nút tính phí nếu không đủ điều kiện
            document.getElementById("shippingCost").innerText = "";
        }
    }

    async function calculateShipping() {
        const districtSelect = document.getElementById("district");
        const wardSelect = document.getElementById("ward");
        const toDistrictId = districtSelect.value;
        const toWardCode = wardSelect.value;

        const transportationFeeDTO = {
            toDistrictId: toDistrictId,
            toWardCode: toWardCode,
            quantity: 1,
            insuranceValue: 0
        };

        try {
            const response = await fetch('http://localhost:8080/public/transportationFee', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(transportationFeeDTO)
            });

            const data = await response.json();

            if (data && data.code === 200) {
                const shippingCost = data.data.total;

                var tongSoTien = currentPrice + shippingCost;
                priceInput1.value = tongSoTien;

                var gia1Formatted3 = shippingCost.toLocaleString('vi-VN', {
                    minimumFractionDigits: 0,
                    maximumFractionDigits: 3
                });

                var gia1WithCurrency3 = gia1Formatted3 + " VNĐ";

                document.getElementById("ship").value = gia1WithCurrency3;

                var gia1Formatted2 = tongSoTien.toLocaleString('vi-VN', {
                    minimumFractionDigits: 0,
                    maximumFractionDigits: 3
                });

                var gia1WithCurrency2 = gia1Formatted2 + " VNĐ";

                priceInput.value = gia1WithCurrency2;

            } else {
                document.getElementById("shippingCost").innerText = "Không thể tính phí vận chuyển.";
            }
        } catch (error) {
            console.error('Error:', error);
            document.getElementById("shippingCost").innerText = "Lỗi khi tính phí vận chuyển. Chi tiết lỗi: " + error.message;
        }
    }

    loadProvinces();
    document.getElementById("province").addEventListener("change", loadDistricts);
    document.getElementById("district").addEventListener("change", loadWards);
    document.getElementById("ward").addEventListener("change", checkSelection);

</script>
</body>
</html>
