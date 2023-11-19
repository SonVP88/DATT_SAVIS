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
        /* Định dạng giao diện form đổi mật khẩu */
        .container {
            max-width: 800px;
            margin: 0 auto;
            text-align: center;
            padding: 20px;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border-radius: 5px;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        input[type="password"] {
            width: 90%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }

        p#message {
            color: red;
            margin-top: -10px;
            margin-bottom: 10px;
            font-size: 14px;
        }

        .success-message {
            color: green;
            font-size: 14px;
            margin-top: 10px;
        }

        .new-password-fields {
            display: none;
        }

        /* Định dạng màu nền và khoảng cách của footer */
        footer {
            background-color: #333;
            padding: 30px 0;
            color: #fff;
        }

        /* Định dạng link trong footer */
        footer a {
            color: #fff;
        }

        /* Định dạng phần topbar */
        .container-fluid .topbar {
            background-color: #fff;
            padding: 10px 0;
            border-bottom: 1px solid #ccc;
        }

        /* Định dạng input tìm kiếm trong topbar */
        .topbar input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* Định dạng button tìm kiếm trong topbar */
        .topbar button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
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
                        <a href="/user/trang_chu/${idKh}" class="nav-item nav-link">Trang chủ</a>
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
                <a class="breadcrumb-item text-dark" href="/user/trang_chu/${idKh}">Trang chủ</a>
                <a class="breadcrumb-item text-dark" href="/user/don_hang/${idKh}">Thông tin</a>
                <span class="breadcrumb-item">Thông tin cá nhân</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Cart Start -->
<div class="container-fluid">

    <div class="row px-xl-5">
        <div class="col-lg-2 table-responsive mb-5">
            <h5 class="section-title position-relative text-uppercase mb-3"><span
                    class="bg-secondary pr-3">Tài khoản của tôi</span>
            </h5>
            <ul class="list-unstyled">
                <li style="background-color: #ff8b33"><i class="fas fa-info-circle" style="width: 20px"></i>
                    <a href="/user/thong_tin/${idKh}" style="color: black;">Thông tin</a></li>
                <li><i class="fas fa-key" style="width: 20px"></i><a
                        href="/user/doi_mat_khau_view/${idKh}" style="color: black;">Đổi mật khẩu</a>
                </li>
            </ul>

            <h5 class="section-title position-relative text-uppercase mb-3"><span
                    class="bg-secondary pr-3">Đơn hàng</span>
            </h5>
            <ul class="list-unstyled">
                <li><i class="fas fa-shopping-cart" style="width: 20px"></i>
                    <a href="/user/don_hang/${idKh}" style="color: black;">Danh sách đơn hàng</a></li>
            </ul>
            <h5 class="section-title position-relative text-uppercase mb-3"><span
                    class="bg-secondary pr-3">Đăng xuất</span>
            </h5>
            <ul class="list-unstyled">
                <li><i class="fas fa-sign-out-alt" style="width: 20px"></i>
                    <a href="#" style="color: black;" onclick="confirmLogout();">Đăng xuất</a></li>
            </ul>
        </div>
        <div class="col-lg-10">
            <div class="contact-form bg-light p-30">
                <div id="success"></div>
                <form method="post" action="/user/contact-done/${kh.ma}">
                    <div class="control-group">
                        <label>Họ và Tên</label>
                        <input type="text" class="form-control"
                               <c:if test="${kh.ten != null}">readonly</c:if> name="ten" value="${kh.ten}">
                        <span id="errorTen" class="text-danger"></span>
                    </div>

                    <div class="control-group">
                        <label>Ngày Sinh</label>
                        <input type="date" class="form-control" id="ngaySinh"
                               required="required" name="ngaySinh" value="${kh.ngay_sinh}"/>
                        <span id="errorNgayChon" class="text-danger"></span>
                    </div>
                    <div class="control-group">
                        <label>Giới Tính</label><br>
                        <input type="radio" value="1" name="gioiTinh" checked/> Nam <br>
                        <input type="radio" value="0" name="gioiTinh" ${kh.gioiTinh==0?"checked":""}/> Nữ
                    </div>
                    <div class="control-group">
                        <label for="province">Tỉnh:</label>
                        <select id="province" name="quocGia" class="form-control" onchange="loadDistricts(); checkSelection()">
                            <option value="">${kh.quoc_gia}</option>
                        </select>
                        <input type="hidden" id="tinh1" name="quocGia1">
                    </div>

                    <div class="control-group">
                        <label for="district">Huyện:</label>
                        <select id="district" name="thanhPho" class="form-control" onchange="loadWards(); checkSelection()"
                                disabled>
                            <option value="">${kh.thanh_pho}</option>
                        </select>
                        <input type="hidden" id="huyen1" name="thanhPho1">
                    </div>
                    <div class="control-group">
                        <label for="ward">Xã:</label>
                        <select id="ward" name="diaChi" class="form-control" onchange="checkSelection()" disabled>
                            <option value="">${kh.dia_chi}</option>
                        </select>
                        <input type="hidden" id="xa1" name="diaChi1">
                    </div>
                    <div class="control-group">
                        <label>Số điện thoại</label>
                        <input type="text" class="form-control" id="soDienThoai" placeholder="Số điện thoại của bạn"
                               required
                               name="soDienThoai" value="${kh.sdt}"/>
                        <span id="errorSoDienThoai" class="text-danger"></span>
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <label>Email</label>
                        <input type="text" class="form-control" readonly value="${kh.email}">
                    </div>
                    <div class="control-group">
                        <label>Mật khẩu</label>
                        <input type="text" class="form-control"
                               <c:if test="${kh.matKhau != null}">readonly</c:if> name="matKhau" value="${kh.matKhau}">
                        <span id="errorMatKhau" class="text-danger"></span>
                    </div>
                    <button class="btn btn-primary py-2 px-4" type="submit" onclick="addProduct()">Cập nhật thông tin
                    </button>
                </form>
            </div>
        </div>
    </div>

</div>
<!-- Cart End -->


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

    var priceInput = document.getElementById("price");
    var priceInput1 = document.getElementById("price1");
    var currentPrice = parseFloat(${tongTien});
    var quocGiaValue = '${kh.quoc_gia}';
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
<script>
    function addProduct() {

        var ten = document.getElementsByName('ten')[0].value;
        var ngaySinh = document.getElementsByName('ngaySinh')[0].value;
        var diaChi = document.getElementsByName('diaChi')[0].value;
        var thanhPho = document.getElementsByName('thanhPho')[0].value;
        var quocGia = document.getElementsByName('quocGia')[0].value;
        var soDienThoai = document.getElementsByName('soDienThoai')[0].value;
        var matKhau = document.getElementsByName('matKhau')[0].value;

        var errorTen = document.getElementById('errorTen');
        var errorNgayChon = document.getElementById('errorNgayChon');
        var errorDiaChi = document.getElementById('errorDiaChi');
        var errorThanhPho = document.getElementById('errorThanhPho');
        var errorQuocGia = document.getElementById('errorQuocGia');
        var errorSoDienThoai = document.getElementById('errorSoDienThoai');
        var errorMatKhau = document.getElementById('errorMatKhau');

        var hasError = false;

        if (ten.trim() === '') {
            errorTen.innerText = 'Vui lòng nhập tên.';
            hasError = true;
        } else {
            errorTen.innerText = '';
        }

        if (ngaySinh.trim() === '') {
            errorNgayChon.innerText = 'Vui lòng nhập ngày sinh';
            hasError = true;
        } else {
            errorNgayChon.innerText = '';
        }

        if (diaChi.trim() === '') {
            errorDiaChi.innerText = 'Vui lòng nhập địa chỉ.';
            hasError = true;
        } else {
            errorTen.innerText = '';
        }

        if (thanhPho.trim() === '') {
            errorThanhPho.innerText = 'Vui lòng nhập thành phố.';
            hasError = true;
        } else {
            errorTen.innerText = '';
        }

        if (quocGia.trim() === '') {
            errorQuocGia.innerText = 'Vui lòng nhập quốc gia.';
            hasError = true;
        } else {
            errorTen.innerText = '';
        }

        if (soDienThoai.trim() === '') {
            errorSoDienThoai.innerText = 'Vui lòng nhập số điện thoại.';
            hasError = true;
        } else {
            errorTen.innerText = '';
        }

        if (matKhau.trim() === '') {
            errorMatKhau.innerText = 'Vui lòng nhập mật khẩu.';
            hasError = true;
        } else {
            errorTen.innerText = '';
        }

        if (hasError) {
            event.preventDefault();
        }
    }
</script>

<script>
    function confirmLogout() {
        Swal.fire({
            icon: 'warning',
            text: 'Bạn có chắc chắn muốn đăng xuất?',
            showCancelButton: true,
            confirmButtonText: 'Đồng ý',
            cancelButtonText: 'Hủy bỏ'
        }).then((result) => {
            if (result.isConfirmed) {
                // Nếu người dùng đồng ý đăng xuất, chuyển họ đến trang đăng xuất
                window.location.href = "/logout";
            }
        });
    }
</script>
</body>

</html>