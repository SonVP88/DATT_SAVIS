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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../../../resources/plugins/fontawesome-free/css/all.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="../../../../resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../../../../resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="../../../../resources/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../../../resources/dist/css/adminlte.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
        }

        h2 {
            color: #333333;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .tabs li a.active {
            background-color: #ccc;
            /* Thêm các thuộc tính màu sắc và kiểu dáng khác tùy ý */
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #666666;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #dddddd;
            border-radius: 3px;
            box-sizing: border-box;
            margin-top: 5px;
            margin-bottom: 10px;
        }

        input[type="radio"] {
            margin-top: 5px;
            margin-right: 5px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            border-radius: 3px;
            cursor: pointer;
        }

        /* Định dạng bảng */
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 10px;
        }

        th,
        td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .tabs {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .tabs li {
            display: inline-block;
            margin-right: 10px;
        }

        .tabs li a {
            display: block;
            padding: 10px 15px;
            background-color: #f2f2f2;
            color: #333;
            text-decoration: none;
            border-radius: 3px 3px 0 0;
        }

        .tabs li a:hover {
            background-color: #ccc;
        }

        .tab-content {
            display: none;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-top: none;
            margin-top: -1px;
            border-radius: 0 3px 3px 3px;
        }

        /*chat*/
        #chat-container {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #f1f1f1;
            border-radius: 5px;
            padding: 10px;
            width: 300px;
            min-height: 50px;
            transition: height 0.3s;
            overflow: hidden;
        }

        #chat-container.open {
            height: 50px;
        }

        #chat-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        #chat-message {
            margin-top: 10px;
            height: 100%;
            border: none;
            resize: none;
            width: 100%;
        }

        #toggle-button {
            cursor: pointer;
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
            <!-- Messages Dropdown Menu -->

            <!-- Notifications Dropdown Menu -->

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
                    <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                    <div class="input-group-append">
                        <button class="btn btn-sidebar">
                            <i class="fas fa-search fa-fw"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
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
                    <li class="nav-item menu-open">
                        <a href="#" class="nav-link active">
                            <i class="nav-icon far fa-plus-square"></i>
                            <p>
                                Chương trình giảm giá
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item ">
                                <a href="/admin/chuong_trinh_giam_gia/add_view/1" class="nav-link active">
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
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="/admin/index/1">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Add chương trình</li>
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
                        <h2>Chương trình giảm giá</h2>
                        <form method="post">

                            <input type="hidden" id="id" name="id" value="${CTGG.id}">

                            <label for="ma">Mã chương trình <span class="text-danger">(*)</span> :</label>
                            <input type="text" id="ma" name="ma" value="${CTGG.ma}" required>
                            <span id="errorMa" class="text-danger"></span>

                            <label for="ten">Tên chương trình <span class="text-danger">(*)</span> :</label>
                            <input type="text" id="ten" name="ten" value="${CTGG.ten}" required>
                            <span id="errorTen" class="text-danger"></span>

                            <div class="mb-3">
                                <label>Loại chương trình:</label>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="giamgia_sp" name="loai" value="giamgia_sp"
                                           onclick="showGiamGiaSanPham()" ${loai == 'giamgia_sp'?'checked':''}>
                                    <label for="giamgia_sp">Giảm giá sản phẩm</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="giamgia_hd" name="loai" value="giamgia_hd"
                                           onclick="showGiamGiaHoaDon()" ${loai == 'giamgia_hd'?'checked':''}>
                                    <label for="giamgia_hd">Giảm giá hóa đơn</label>
                                </div>
                            </div>

                            <div id="giamgia_sanpham" style="display: none;">
                                <label for="ngaybd">Ngày bắt đầu:</label>
                                <input type="date" id="ngaybd" name="ngaybd" value="${ngayBatDau_sp}">

                                <label for="ngaykt">Ngày kết thúc:</label>
                                <input type="date" id="ngaykt" name="ngaykt" value="${ngayKetThuc_sp}">

                                <label for="tigiam">Phần trăm giảm <span class="text-danger">(*)</span> :</label>
                                <input type="text" id="tigiam" name="tigiam" value="${CTGGSP.phanTramGiam}">
                                <span id="errorPhanTramGiamSP" class="text-danger"></span>
                            </div>

                            <div id="giamgia_hoadon" style="display: none;">
                                <label for="sosp">Số sản phẩm hóa đơn trên <span class="text-danger">(*)</span> :</label>
                                <input type="number" id="sosp" name="sosp" value="${CTGGHD.soLuongSanPham}">
                                <span id="errorSoSanPham" class="text-danger"></span>

                                <label for="tongtien">Tổng tiền hóa đơn trên <span class="text-danger">(*)</span> :</label>
                                <input type="number" id="tongtien" name="tongtien" value="${CTGGHD.soTienHoaDon}">
                                <span id="errorTongTien" class="text-danger"></span>

                                <label for="ngaybd_hd">Ngày bắt đầu:</label>
                                <input type="date" id="ngaybd_hd" name="ngaybd_hd" value="${ngayBatDau_hd}">

                                <label for="ngaykt_hd">Ngày kết thúc:</label>
                                <input type="date" id="ngaykt_hd" name="ngaykt_hd" value="${ngayKetThuc_hd}">

                                <label for="tigiam_hd">Phần trăm giảm <span class="text-danger">(*)</span> :</label>
                                <input type="text" id="tigiam_hd" name="tigiam_hd" value="${CTGGHD.phanTramGiam}">
                                <span id="errorPhanTramGiamHD" class="text-danger"></span>
                            </div>

                            <button class="btn btn-success" type="submit" formaction="/chuong-trinh-giam-gia/add" value="Thêm" onclick="addProduct()" >
                                <i class="fas fa-plus"></i> Thêm
                            </button>
                            <button class="btn btn-primary" type="submit" formaction="/chuong-trinh-giam-gia/update" value="Cập nhật" onclick="addProduct()">
                                Cập nhật
                            </button>
                        </form>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
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
<script src="../../../../resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../../../resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="../../../../resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../../../resources/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../../../../resources/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../../../../resources/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../../../../resources/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../../../../resources/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../../../../resources/plugins/jszip/jszip.min.js"></script>
<script src="../../../../resources/plugins/pdfmake/pdfmake.min.js"></script>
<script src="../../../../resources/plugins/pdfmake/vfs_fonts.js"></script>
<script src="../../../../resources/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../../../../resources/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../../../../resources/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- AdminLTE App -->
<script src="../../../../resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../../../resources/dist/js/demo.js"></script>
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
    function showGiamGiaSanPham() {
        document.getElementById("giamgia_sanpham").style.display = "block";
        document.getElementById("giamgia_hoadon").style.display = "none";
    }

    function showGiamGiaHoaDon() {
        document.getElementById("giamgia_sanpham").style.display = "none";
        document.getElementById("giamgia_hoadon").style.display = "block";
    }

    document.addEventListener("DOMContentLoaded", function () {
        // Kiểm tra radio button ban đầu được chọn
        var selectedRadio = document.querySelector('input[name="loai"]:checked');

        // Nếu radio button được chọn là "giamgia_sp", hiển thị phần tử "giamgia_sanpham"
        if (selectedRadio && selectedRadio.value === 'giamgia_sp') {
            showGiamGiaSanPham();
        }

        // Nếu radio button được chọn là "giamgia_hd", hiển thị phần tử "giamgia_hoadon"
        if (selectedRadio && selectedRadio.value === 'giamgia_hd') {
            showGiamGiaHoaDon();
        }
    });
</script>
<script>
    function addProduct() {
        var ma = document.getElementsByName('ma')[0].value;
        var ten = document.getElementsByName('ten')[0].value;
        var tigiam = document.getElementsByName('tigiam')[0].value;
        var sosp = document.getElementsByName('sosp')[0].value;
        var tongtien = document.getElementsByName('tongtien')[0].value;
        var tigiam_hd = document.getElementsByName('tigiam_hd')[0].value;

        var errorMa = document.getElementById('errorMa');
        var errorTen = document.getElementById('errorTen');
        var errorPhanTramGiamSP = document.getElementById('errorPhanTramGiamSP');
        var errorPhanTramGiamHD = document.getElementById('errorPhanTramGiamHD');
        var errorSoSanPham = document.getElementById('errorSoSanPham');
        var errorTongTien = document.getElementById('errorTongTien');
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

        if (document.getElementById('giamgia_sanpham').style.display === 'block') {
            if (tigiam.trim() === '') {
                errorPhanTramGiamSP.innerText = 'Vui lòng nhập phần trăm giảm.';
                hasError = true;
            } else {
                errorPhanTramGiamSP.innerText = '';
            }
            errorSoSanPham.innerText = '';
            errorTongTien.innerText = '';
            errorPhanTramGiamHD.innerText = '';
        }

        if (document.getElementById('giamgia_hoadon').style.display === 'block') {
            if (sosp.trim() === '') {
                errorSoSanPham.innerText = 'Vui lòng nhập số sản phẩm.';
                hasError = true;
            } else {
                errorSoSanPham.innerText = '';
            }

            if (tongtien.trim() === '') {
                errorTongTien.innerText = 'Vui lòng nhập tổng tiền.';
                hasError = true;
            } else {
                errorTongTien.innerText = '';
            }

            if (tigiam_hd.trim() === '') {
                errorPhanTramGiamHD.innerText = 'Vui lòng nhập phần trăm giảm.';
                hasError = true;
            } else {
                errorPhanTramGiamHD.innerText = '';
            }
            errorPhanTramGiamSP.innerText = '';
        }

        if (hasError) {
            event.preventDefault(); // Ngăn chặn submit form nếu có lỗi
        }
    }
</script>
</body>
</html>
