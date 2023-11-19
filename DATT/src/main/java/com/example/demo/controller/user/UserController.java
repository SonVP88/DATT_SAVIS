package com.example.demo.controller.user;

import com.example.demo.entity.dto.Province;
import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;
import com.example.demo.entity.khachhang.GioHang;
import com.example.demo.entity.khachhang.GioHangChiTiet;
import com.example.demo.entity.khachhang.HoaDon;
import com.example.demo.entity.khachhang.HoaDonChiTiet;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.sanpham.AoChiTiet;
import com.example.demo.entity.dto.GioHangDTO;
import com.example.demo.entity.dto.HoaDonChiTietDTO;
import com.example.demo.entity.dto.HoaDonDTO;
import com.example.demo.entity.sanpham.LoaiAo;
import com.example.demo.ser.giamgia.GiamGiaHoaDonSer;
import com.example.demo.ser.giamgia.GiamGiaSanPhamChiTietSer;
import com.example.demo.ser.sanpham.LoaiAoSer;
import com.example.demo.ser.users.GioHangChiTietSer;
import com.example.demo.ser.users.GioHangSer;
import com.example.demo.ser.sanpham.AoChiTietSer;
import com.example.demo.ser.users.HoaDonChiTietSer;
import com.example.demo.ser.users.HoaDonSer;
import com.example.demo.ser.users.UsersSer;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class UserController {

    @Autowired
    GioHangSer gioHangSer;

    @Autowired
    UsersSer usersSer;

    @Autowired
    GioHangChiTietSer gioHangChiTietSer;

    @Autowired
    AoChiTietSer aoChiTietSer;

    @Autowired
    GiamGiaSanPhamChiTietSer giamGiaSanPhamChiTietSer;

    @Autowired
    HoaDonSer hoaDonSer;

    @Autowired
    HoaDonChiTietSer hoaDonChiTietSer;

    @Autowired
    GiamGiaHoaDonSer giamGiaHoaDonSer;

    @Autowired
    JavaMailSender mailSender;

    @Autowired
    LoaiAoSer loaiAoSer;

    @GetMapping("/user/gio_hang/view/*")
    public String viewGioHang(HttpServletRequest request, Model model) {

        String url = request.getRequestURI();
        String[] parts = url.split("/user/gio_hang/view/");
        String ma = parts[1];

        Users users = usersSer.findByMa(ma);
        GioHang gioHang = gioHangSer.findByIdKH(users.getId());

        Long soLuongSanPham = gioHangChiTietSer.soLuongSanPhamGioHang(gioHang.getId());

        model.addAttribute("idKh", users.getMa());
        model.addAttribute("soLuongSanPham", soLuongSanPham);

        List<GioHangChiTiet> list = gioHangChiTietSer.view(gioHang.getId());
        List<GioHangDTO> listGioHangChiTiets = new ArrayList<>();
        for (GioHangChiTiet gioHangChiTiet : list) {
            Ao ao = gioHangChiTiet.getAoChiTiet().getAo();
            GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietSer.findByIdAoAndTrangThai(ao.getId());

            GioHangDTO gioHangDTO = new GioHangDTO();
            int gia;
            if (giamGiaSanPhamChiTiet != null) {
                gia = ao.getGiaBan().toBigInteger().intValue() * (100 - giamGiaSanPhamChiTiet.getGiamGiaSanPham().getPhanTramGiam()) / 100;
            } else {
                gia = ao.getGiaBan().toBigInteger().intValue();
            }
            gioHangDTO.setAoChiTiet(gioHangChiTiet.getAoChiTiet());
            gioHangDTO.setGia(gia);
            gioHangDTO.setGioHangChiTiet(gioHangChiTiet);
            listGioHangChiTiets.add(gioHangDTO);
        }
        model.addAttribute("listGioHangChiTiets", listGioHangChiTiets);
        model.addAttribute("checkGH", "0");

        List<LoaiAo> listLoaiAos = loaiAoSer.findAllByTrangThai(1);
        model.addAttribute("listLoaiAos", listLoaiAos);

        return "/user/gio_hang";
    }

    @GetMapping("/user/gio_hang/delete/*/*")
    public String deleteGioHang(HttpServletRequest request){
        String url = request.getRequestURI();
        String[] parts = url.split("/user/gio_hang/delete/");
        String pStr = parts[1];
        String[] p = pStr.split("/");

        String idKh = p[0];
        String idGioHangChiTiet = p[1];

        gioHangChiTietSer.delete(UUID.fromString(idGioHangChiTiet));
        return "redirect:/user/gio_hang/view/"+ idKh;
    }

    @GetMapping("/user/hoa_don/view_hoa_don/*")
    public String viewHoaDon(HttpServletRequest request, Model model) {

        String url = request.getRequestURI();
        String[] p = url.split("/user/hoa_don/view_hoa_don/");
        String id = p[1];

        Long sl = hoaDonSer.tongSl(UUID.fromString(id));
        HoaDon hoaDon = hoaDonSer.findId(UUID.fromString(id));
        List<HoaDonChiTiet> hoaDonChiTiets = hoaDonChiTietSer.findByHoaDon(hoaDon.getId());

        GioHang gioHang = gioHangSer.findByIdKH(hoaDon.getKhachHang().getId());
        Long soLuongSanPham = gioHangChiTietSer.soLuongSanPhamGioHang(gioHang.getId());

        model.addAttribute("idKh", hoaDon.getKhachHang().getMa());
        model.addAttribute("soLuongSanPham", soLuongSanPham);

        List<HoaDonChiTietDTO> listHoaDonChiTietDTOS = new ArrayList<>();

        int tongTien = 0;
        for (HoaDonChiTiet hoaDonChiTiet : hoaDonChiTiets) {
            Ao ao = hoaDonChiTiet.getAoChiTiet().getAo();
            GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietSer.findByIdAoAndTrangThai(ao.getId());

            HoaDonChiTietDTO hoaDonChiTietDTO = new HoaDonChiTietDTO();
            int gia;

            if (giamGiaSanPhamChiTiet != null) {
                gia = ao.getGiaBan().toBigInteger().intValue() * (100 - giamGiaSanPhamChiTiet.getGiamGiaSanPham().getPhanTramGiam()) / 100;
            } else {
                gia = ao.getGiaBan().toBigInteger().intValue();
            }
            hoaDonChiTietDTO.setHoaDonChiTiet(hoaDonChiTiet);
            hoaDonChiTietDTO.setGia(gia);
            listHoaDonChiTietDTOS.add(hoaDonChiTietDTO);
            tongTien += hoaDonChiTiet.getSoLuong() * gia;
        }
        BigDecimal tongTienBigDecimal = BigDecimal.valueOf(tongTien);

        model.addAttribute("slDK", sl);
        model.addAttribute("tongTienDK",tongTienBigDecimal);
        model.addAttribute("CTGG", giamGiaHoaDonSer.findByTrangThai(0));
        model.addAttribute("hoaDon", hoaDonSer.findId(UUID.fromString(id)));
        model.addAttribute("listHoaDonChiTietDTOS", listHoaDonChiTietDTOS);
        model.addAttribute("idKh", hoaDon.getKhachHang().getMa());
        model.addAttribute("tongTien", tongTien);
        model.addAttribute("idHoaDon", id);
        model.addAttribute("khachHang", hoaDon.getKhachHang());

        List<LoaiAo> listLoaiAos = loaiAoSer.findAllByTrangThai(1);
        model.addAttribute("listLoaiAos", listLoaiAos);

        return "/user/view_hoa_don";
    }

    @GetMapping("/user/don_hang/*")
    public String caNhanView(HttpServletRequest request, Model model, HttpSession session) {

        String url = request.getRequestURI();
        String[] parts = url.split("/user/don_hang/");
        String ma = parts[1];

        Users users = usersSer.findByMa(ma);
        GioHang gioHang = gioHangSer.findByIdKH(users.getId());
        Long soLuongSanPham = gioHangChiTietSer.soLuongSanPhamGioHang(gioHang.getId());

        List<HoaDon> listHoaDonChuaThanhToan = hoaDonSer.findByUserAndTrangThai(users.getId(), 0);
        List<HoaDon> listHoaDonChoXacNhan = hoaDonSer.findByUserAndTrangThai(users.getId(), 1);
        List<HoaDon> listHoaDonDangGiao = hoaDonSer.findByUserAndTrangThai(users.getId(), 2);
        List<HoaDon> listHoaDonHoanThanh = hoaDonSer.findByUserAndTrangThai(users.getId(), 3);
        List<HoaDon> listHoaDonHuy = hoaDonSer.findByUserAndTrangThai(users.getId(), 4);

        List<HoaDonDTO> listHoaDonDTOChuaThanhToan = hoaDonSer.findHoaDonDT0(listHoaDonChuaThanhToan);
        List<HoaDonDTO> listHoaDonDTOChoXacNhan = hoaDonSer.findHoaDonDT0(listHoaDonChoXacNhan);
        List<HoaDonDTO> listHoaDonDTODangGiao = hoaDonSer.findHoaDonDT0(listHoaDonDangGiao);
        List<HoaDonDTO> listHoaDonDTOHoanThanh = hoaDonSer.findHoaDonDT0(listHoaDonHoanThanh);
        List<HoaDonDTO> listHoaDonDTOHuy = hoaDonSer.findHoaDonDT0(listHoaDonHuy);

        HoaDon hoaDon = (HoaDon) session.getAttribute("hoaDonDanhGia");

        if (hoaDon != null) {
            List<HoaDonChiTiet> listHoaDonChiTiets = hoaDonChiTietSer.findByHoaDon(hoaDon.getId());
            model.addAttribute("hoaDon", hoaDon);
            model.addAttribute("listHoaDonChiTiets", listHoaDonChiTiets);
            model.addAttribute("noneOrBlock", "block");
        }
        session.removeAttribute("hoaDonDanhGia");

        model.addAttribute("idKh", users.getMa());
        model.addAttribute("soLuongSanPham", soLuongSanPham);
        model.addAttribute("listHoaDonDTOChuaThanhToan", listHoaDonDTOChuaThanhToan);
        model.addAttribute("listHoaDonDTOChoXacNhan", listHoaDonDTOChoXacNhan);
        model.addAttribute("listHoaDonDTODangGiao", listHoaDonDTODangGiao);
        model.addAttribute("listHoaDonDTOHoanThanh", listHoaDonDTOHoanThanh);
        model.addAttribute("listHoaDonDTOHuy", listHoaDonDTOHuy);

        List<LoaiAo> listLoaiAos = loaiAoSer.findAllByTrangThai(1);
        model.addAttribute("listLoaiAos", listLoaiAos);

        return "/user/don_hang";
    }

    @GetMapping("/user/hoa_don/mua_lai/*")
    public String muaLaiHoaDon(HttpServletRequest request) {

        LocalDateTime now = LocalDateTime.now();
        int maHd = hoaDonSer.demHoaDon() +1;

        String url = request.getRequestURI();
        String[] parts = url.split("/user/hoa_don/mua_lai/");
        String id = parts[1];

        HoaDon hd = hoaDonSer.findId(UUID.fromString(id));

        Users khachHang = hd.getKhachHang();

        HoaDon hoaDon = new HoaDon();
        hoaDon.setMa("HD" + now.getMonthValue() +now.getDayOfMonth()+ now.getHour()+ now.getMinute()+ now.getSecond());
        hoaDon.setKhachHang(khachHang);
        hoaDon.setNgayTao(LocalDateTime.now());
        hoaDon.setTrangThai(0);

        hoaDonSer.add(hoaDon);

        for (HoaDonChiTiet hdct : hoaDonChiTietSer.findByHoaDon(hd.getId())) {
            HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
            hoaDonChiTiet.setHoaDon(hoaDon);
            hoaDonChiTiet.setAoChiTiet(aoChiTietSer.findById(hdct.getAoChiTiet().getId()));
            hoaDonChiTiet.setSoLuong(hdct.getSoLuong());
            hoaDonChiTietSer.add(hoaDonChiTiet);
        }

        return "redirect:/user/hoa_don/view_hoa_don/" + hoaDon.getId();
    }

    @GetMapping("/user/doi_mat_khau_view/*")
    public String viewDoiMatKhau(HttpServletRequest request, Model model){

        String url = request.getRequestURI();
        String[] parts = url.split("/user/doi_mat_khau_view/");
        String ma = parts[1];

        Users users = usersSer.findByMa(ma);
        GioHang gioHang = gioHangSer.findByIdKH(users.getId());
        Long soLuongSanPham = gioHangChiTietSer.soLuongSanPhamGioHang(gioHang.getId());

        model.addAttribute("idKh", users.getMa());
        model.addAttribute("taiKhoan", users);
        model.addAttribute("soLuongSanPham", soLuongSanPham);

        List<LoaiAo> listLoaiAos = loaiAoSer.findAllByTrangThai(1);
        model.addAttribute("listLoaiAos", listLoaiAos);

        return "/user/doi_mat_khau";
    }

    @GetMapping("/user/hoa_don/chinh_sua/*")
    public String hoaDonChinhSua(HttpServletRequest request, Model model){

        String url = request.getRequestURI();
        String[] parts = url.split("/user/hoa_don/chinh_sua/");
        String ma = parts[1];

        HoaDon hoaDon = hoaDonSer.findByMa(ma);

        Users users = hoaDon.getKhachHang();
        GioHang gioHang = gioHangSer.findByIdKH(users.getId());

        Long soLuongSanPham = gioHangChiTietSer.soLuongSanPhamGioHang(gioHang.getId());

        model.addAttribute("idKh", users.getMa());
        model.addAttribute("soLuongSanPham", soLuongSanPham);

        List<HoaDonChiTiet> list = hoaDonChiTietSer.findByHoaDon(hoaDon.getId());
        List<GioHangDTO> listGioHangChiTiets = new ArrayList<>();
        for (HoaDonChiTiet hoaDonChiTiet : list) {
            Ao ao = hoaDonChiTiet.getAoChiTiet().getAo();
            GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietSer.findByIdAoAndTrangThai(ao.getId());

            GioHangDTO gioHangDTO = new GioHangDTO();
            int gia;
            if (giamGiaSanPhamChiTiet != null) {
                gia = ao.getGiaBan().toBigInteger().intValue() * (100 - giamGiaSanPhamChiTiet.getGiamGiaSanPham().getPhanTramGiam()) / 100;
            } else {
                gia = ao.getGiaBan().toBigInteger().intValue();
            }
            gioHangDTO.setAoChiTiet(hoaDonChiTiet.getAoChiTiet());
            gioHangDTO.setGia(gia);
            gioHangDTO.setHoaDonChiTiet(hoaDonChiTiet);
            listGioHangChiTiets.add(gioHangDTO);
        }
        model.addAttribute("listGioHangChiTiets", listGioHangChiTiets);
        model.addAttribute("checkGH", "1");
        model.addAttribute("maHoaDon", hoaDon.getMa());

        List<LoaiAo> listLoaiAos = loaiAoSer.findAllByTrangThai(1);
        model.addAttribute("listLoaiAos", listLoaiAos);

        return "/user/gio_hang";
    }

    @GetMapping("/user/hoa_don_chinh_sua/delete/*")
    public String hoaDonChinhSuaDelete(HttpServletRequest request){
        String url = request.getRequestURI();
        String[] p = url.split("/user/hoa_don_chinh_sua/delete/");

        String idHoaDonChiTiet = p[1];

        HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietSer.findById(UUID.fromString(idHoaDonChiTiet));

        HoaDon hoaDon = hoaDonChiTiet.getHoaDon();

        String idKh = hoaDon.getKhachHang().getMa();

        hoaDonChiTietSer.delete(UUID.fromString(idHoaDonChiTiet));

        int soHDCT = hoaDonChiTietSer.soLuongHoaDonCHiTietByHoaDon(hoaDon.getId());

        if(soHDCT == 0){
            hoaDonSer.delete(hoaDon.getId());
            return "redirect:/user/don_hang/"+idKh;
        }

        return "redirect:/user/hoa_don/chinh_sua/"+hoaDonChiTiet.getHoaDon().getMa();
    }

    @PostMapping("/user/gio_hang/add_gio_hang/*")
    public String addGioHang(HttpServletRequest request, Model model) {
        String url = request.getRequestURI();
        String[] parts = url.split("/user/gio_hang/add_gio_hang/");
        String ma = parts[1];

        Users users = usersSer.findByMa(ma);

        String idAo = request.getParameter("idAo");
        String mauSac = request.getParameter("mauSac");
        String size = request.getParameter("size");
        String sl = request.getParameter("sl");

        AoChiTiet aoChiTiet = aoChiTietSer.findIdByIdAoMsSize(UUID.fromString(idAo), UUID.fromString(mauSac), UUID.fromString(size));

        GioHangChiTiet checkGHCT = gioHangChiTietSer.findByKhachHangAndAoChiTiet(users.getId(), aoChiTiet.getId());
        if(checkGHCT == null){
            GioHangChiTiet gioHangChiTiet = new GioHangChiTiet();

            gioHangChiTiet.setGioHang(gioHangSer.findByIdKH(users.getId()));
            gioHangChiTiet.setAoChiTiet(aoChiTiet);
            gioHangChiTiet.setSoLuong(Integer.parseInt(sl));

            gioHangChiTietSer.add(gioHangChiTiet);
        }else {
            GioHangChiTiet ghct = new GioHangChiTiet();

            int soLuong = checkGHCT.getSoLuong() + Integer.parseInt(sl);

            ghct.setGioHang(checkGHCT.getGioHang());
            ghct.setAoChiTiet(checkGHCT.getAoChiTiet());
            ghct.setSoLuong(soLuong);
            ghct.setDonGia(checkGHCT.getDonGia());
            ghct.setTrangThai(checkGHCT.getTrangThai());

            gioHangChiTietSer.update(checkGHCT.getId(), ghct);
        }
        return "redirect:/user/gio_hang/view/" + users.getMa();
    }

    @PostMapping("/user/hoa_don/add/*")
    public String addHoaDon(HttpServletRequest request, Model model,
                            @RequestParam(value = "chon", required = false) List<String> chon,
                            @RequestParam(value = "idAoChiTiet", required = false) List<UUID> idAoChiTiet,
                            @RequestParam(value = "soLuong", required = false) List<String> soLuong) {

        LocalDateTime now = LocalDateTime.now();
        String url = request.getRequestURI();
        String[] parts = url.split("/user/hoa_don/add/");
        String ma = parts[1];

        Users khachHang = usersSer.findByMa(ma);

        HoaDon hoaDon = new HoaDon();
        hoaDon.setMa("HD" + now.getMonthValue() +now.getDayOfMonth()+ now.getHour()+ now.getMinute()+ now.getSecond());
        hoaDon.setKhachHang(khachHang);
        hoaDon.setNgayTao(LocalDateTime.now());
        hoaDon.setHinhThuc(0);
        hoaDon.setTrangThai(0);

        hoaDonSer.add(hoaDon);

        if (chon != null) {
            for (String selectedValue : chon) {
                HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
                hoaDonChiTiet.setHoaDon(hoaDon);
                hoaDonChiTiet.setAoChiTiet(aoChiTietSer.findById(idAoChiTiet.get(Integer.parseInt(selectedValue))));
                hoaDonChiTiet.setSoLuong(Integer.parseInt(soLuong.get(Integer.parseInt(selectedValue))));
                hoaDonChiTietSer.add(hoaDonChiTiet);
            }
        }

        return "redirect:/user/hoa_don/view_hoa_don/" + hoaDon.getId();
    }

    @PostMapping("/user/hoa_don_chinh_sua/update/*")
    public String hoaDonChinhSuaUpdate(HttpServletRequest request, Model model,
                                       @RequestParam(value = "chon", required = false) List<String> chon,
                                       @RequestParam(value = "idAoChiTiet", required = false) List<UUID> idAoChiTiet,
                                       @RequestParam(value = "soLuong", required = false) List<String> soLuong){

        String url = request.getRequestURI();
        String[] parts = url.split("/user/hoa_don_chinh_sua/update/");
        String ma = parts[1];

        HoaDon hoaDon = hoaDonSer.findByMa(ma);

        if (chon != null) {
            for (String selectedValue : chon) {

                HoaDonChiTiet updateHDCT = hoaDonChiTietSer.findByHoaDonAndAoChiTiet(hoaDon.getId(), idAoChiTiet.get(Integer.parseInt(selectedValue)));

                HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();

                hoaDonChiTiet.setAoChiTiet(updateHDCT.getAoChiTiet());
                hoaDonChiTiet.setHoaDon(updateHDCT.getHoaDon());
                hoaDonChiTiet.setDonGia(updateHDCT.getDonGia());
                hoaDonChiTiet.setTrangThai(updateHDCT.getTrangThai());
                hoaDonChiTiet.setSoLuong(Integer.parseInt(soLuong.get(Integer.parseInt(selectedValue))));

                hoaDonChiTietSer.update(updateHDCT.getId(), hoaDonChiTiet);
            }
        }
        return "redirect:/user/don_hang/"+hoaDon.getKhachHang().getMa();
    }

    @PostMapping("/user/hoa_don/dat_hang/*")
    public String datHang(HttpServletRequest request, Model model, HttpSession session) {

        String url = request.getRequestURI();
        String[] p = url.split("/user/hoa_don/dat_hang/");
        String id = p[1];

        String hinhThuc = request.getParameter("payment");
        String tongTien = request.getParameter("tongTien");
        String ten = request.getParameter("ten");
        String email = request.getParameter("email");
        String sdt = request.getParameter("sdt");
        String quocGia = request.getParameter("quocGia");
        String thanhPho = request.getParameter("thanhPho");
        String diaChi = request.getParameter("diaChi");

        String ten1 = request.getParameter("ten1");
        String email1 = request.getParameter("email1");
        String sdt1 = request.getParameter("sdt1");
        String quocGia1 = request.getParameter("quocGia1");
        String thanhPho1 = request.getParameter("thanhPho1");
        String diaChi1 = request.getParameter("diaChi1");

        HoaDon hoaDon = hoaDonSer.findId(UUID.fromString(id));

        HoaDon hd = new HoaDon();

        String diaChiChon = request.getParameter("diaChiChon");

        hd.setMa(hoaDon.getMa());
        hd.setTongTien(BigDecimal.valueOf(Float.valueOf(tongTien)));
        hd.setNgayTao(hoaDon.getNgayTao());
        hd.setNgayChoXacNhan(LocalDateTime.now());
        hd.setKhachHang(hoaDon.getKhachHang());
        hd.setTrangThai(1);
        if (diaChiChon.equals("diaChiMoi")) {
            hd.setMoTa("Người nhận: " + ten1 + " , Email: " + email1 + " , Sđt nhận hàng: " + sdt1 + " , Địa chỉ giao hàng" + diaChi1 + " huyện " + thanhPho1 + " tỉnh " + quocGia1);
            hoaDonSer.update(hoaDon.getId(), hd);
        } else {
            hd.setMoTa("Người nhận: " + ten + " , Email: " + email + " , Sđt nhận hàng: " + sdt + " , Địa chỉ giao hàng" + diaChi + " huyện " + thanhPho + " tỉnh " + quocGia);
        }
        hd.setHinhThuc(3);

        hoaDonSer.update(hoaDon.getId(), hd);

        String mail = hoaDon.getKhachHang().getEmail();
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(mail);
        message.setSubject("Thông tin đơn hàng");
        String bodymail = "";

        if (hinhThuc.equals("bank")) {
            session.setAttribute("maHoaDon", hoaDon.getMa());
            return "redirect:/pay/" + hoaDon.getMa() + "/" + tongTien;
        }
        model.addAttribute("idKh", hoaDon.getKhachHang().getMa());

        List<HoaDonChiTiet> listHoaDonChiTiets = hoaDonChiTietSer.findByHoaDon(hoaDon.getId());

        for (HoaDonChiTiet hoaDonChiTiet : listHoaDonChiTiets){
            Ao ao = hoaDonChiTiet.getAoChiTiet().getAo();

            GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietSer.findByIdAoAndTrangThai(ao.getId());

            int gia;

            if (giamGiaSanPhamChiTiet != null) {
                gia = ao.getGiaBan().toBigInteger().intValue() * (100 - giamGiaSanPhamChiTiet.getGiamGiaSanPham().getPhanTramGiam()) / 100;
            } else {
                gia = ao.getGiaBan().toBigInteger().intValue();
            }

            int donGia = gia * hoaDonChiTiet.getSoLuong();
            BigDecimal bigDecimalDonGia = new BigDecimal(donGia);

            HoaDonChiTiet hdct = new HoaDonChiTiet();
            hdct.setHoaDon(hoaDonChiTiet.getHoaDon());
            hdct.setAoChiTiet(hoaDonChiTiet.getAoChiTiet());
            hdct.setSoLuong(hoaDonChiTiet.getSoLuong());
            hdct.setDonGia(bigDecimalDonGia);

            hoaDonChiTietSer.update(hoaDonChiTiet.getId(), hdct);

            AoChiTiet act = hoaDonChiTiet.getAoChiTiet();

            AoChiTiet aoChiTiet = new AoChiTiet();

            int slTon = act.getSlton() - hoaDonChiTiet.getSoLuong();
            int slBan = act.getSlban() + hoaDonChiTiet.getSoLuong();

            aoChiTiet.setMau_sac(act.getMau_sac());
            aoChiTiet.setSize(act.getSize());
            aoChiTiet.setAo(act.getAo());
            aoChiTiet.setSlton(slTon);
            aoChiTiet.setSlban(slBan);
            aoChiTiet.setTrangthai(act.getTrangthai());

            aoChiTietSer.update(act.getId(), aoChiTiet);
            bodymail += hdct.getAoChiTiet().getAo().getTen()+" "+hdct.getAoChiTiet().getSize().getTen()+" x "+hdct.getSoLuong()+"\n";
        }
        message.setText("Chúc mừng bạn đã đặt hàng thành công sản phẩm từ SD-99" +
                "\nMã đơn hàng : " + hoaDon.getMa()
                +"\nSản phẩm :\n"+bodymail+"\nTổng tiền : "+hoaDon.getTongTien()+" VND"+
                "\nCảm ơn bạn đã mua hàng");

        mailSender.send(message);

        return "/user/thanh_cong";
    }

    @PostMapping("/user/hoa_don/huy")
    public String huyHoaDon(HttpServletRequest request) {

        LocalDate currentDate = LocalDate.now();

        String id = request.getParameter("idHoaDon");

        HoaDon hoaDon = hoaDonSer.findId(UUID.fromString(id));
        HoaDon hd = new HoaDon();

        hd.setMa(hoaDon.getMa());
        hd.setTongTien(hoaDon.getTongTien());
        hd.setNgayTao(hoaDon.getNgayTao());
        hd.setNgayChoXacNhan(hoaDon.getNgayChoXacNhan());
        hd.setNgayThanhToan(hoaDon.getNgayThanhToan());
        hd.setNgayHuy(LocalDateTime.now());
        hd.setKhachHang(hoaDon.getKhachHang());
        hd.setHinhThuc(hoaDon.getHinhThuc());
        hd.setTrangThai(4);
        hd.setMoTa(hoaDon.getMoTa());
        hoaDonSer.update(hoaDon.getId(), hd);

        List<HoaDonChiTiet> listHoaDonChiTiets = hoaDonChiTietSer.findByHoaDon(hoaDon.getId());

        for (HoaDonChiTiet hoaDonChiTiet : listHoaDonChiTiets){

            AoChiTiet act = hoaDonChiTiet.getAoChiTiet();

            AoChiTiet aoChiTiet = new AoChiTiet();

            int slTon = act.getSlton() + hoaDonChiTiet.getSoLuong();
            int slBan = act.getSlban() - hoaDonChiTiet.getSoLuong();

            aoChiTiet.setMau_sac(act.getMau_sac());
            aoChiTiet.setSize(act.getSize());
            aoChiTiet.setAo(act.getAo());
            aoChiTiet.setSlton(slTon);
            aoChiTiet.setSlban(slBan);
            aoChiTiet.setTrangthai(act.getTrangthai());

            aoChiTietSer.update(act.getId(), aoChiTiet);
        }

        return "redirect:/user/don_hang/" + hoaDon.getKhachHang().getMa();
    }

    @PostMapping("/user/hoa_don/hoan_thanh")
    public String hoanThanhHoaDon(HttpServletRequest request) {

        String id = request.getParameter("idHoaDon");

        LocalDate currentDate = LocalDate.now();

        HoaDon hoaDon = hoaDonSer.findId(UUID.fromString(id));
        HoaDon hd = new HoaDon();

        hd.setMa(hoaDon.getMa());
        hd.setTongTien(hoaDon.getTongTien());
        hd.setNgayTao(hoaDon.getNgayTao());
        hd.setNgayChoXacNhan(hoaDon.getNgayChoXacNhan());
        hd.setNgayHoanThanh(LocalDateTime.now());
        hd.setKhachHang(hoaDon.getKhachHang());
        hd.setNgayThanhToan(LocalDateTime.now());
        hd.setHinhThuc(hoaDon.getHinhThuc());
        hd.setTrangThai(3);
        hd.setMoTa(hoaDon.getMoTa());
        hoaDonSer.update(hoaDon.getId(), hd);

        List<HoaDonChiTiet> listHoaDonChiTiets = hoaDonChiTietSer.findByHoaDon(hoaDon.getId());

        for (HoaDonChiTiet hoaDonChiTiet : listHoaDonChiTiets){
            AoChiTiet act = hoaDonChiTiet.getAoChiTiet();

            GioHangChiTiet gioHangChiTiet = gioHangChiTietSer.findByKhachHangAndAoChiTiet(hoaDon.getKhachHang().getId(), act.getId());
            if(gioHangChiTiet != null){
                gioHangChiTietSer.delete(gioHangChiTiet.getId());
            }
        }

        return "redirect:/user/don_hang/" + hoaDon.getKhachHang().getMa();
    }

    @PostMapping("/user/doi_mat_khau")
    public String doiMatKhau(HttpServletRequest request){

        String maKh = request.getParameter("maKh");
        String newPassword = request.getParameter("newPassword");

        Users khachHang = usersSer.findByMa(maKh);

        Users kh = new Users();

        kh.setMa(khachHang.getMa());
        kh.setTen(khachHang.getTen());
        kh.setNgay_sinh(khachHang.getNgay_sinh());
        kh.setDia_chi(khachHang.getDia_chi());
        kh.setThanh_pho(khachHang.getThanh_pho());
        kh.setQuoc_gia(khachHang.getQuoc_gia());
        kh.setSdt(khachHang.getSdt());
        kh.setEmail(khachHang.getEmail());
        kh.setMatKhau(newPassword);
        kh.setTrangThai(khachHang.getTrangThai());

        usersSer.update(khachHang.getId(), kh);

        return "redirect:/user/doi_mat_khau_view/"+ maKh;
    }

}
