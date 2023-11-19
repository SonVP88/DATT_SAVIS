package com.example.demo.controller.admin.giamgia;

import com.example.demo.entity.giamgia.GiamGiaHoaDon;
import com.example.demo.entity.giamgia.GiamGiaSanPham;
import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;
import com.example.demo.entity.sanpham.Ao;
import com.example.demo.ser.chat.ChatSer;
import com.example.demo.ser.giamgia.GiamGiaSanPhamChiTietSer;
import com.example.demo.ser.sanpham.AoSer;
import com.example.demo.ser.giamgia.GiamGiaHoaDonSer;
import com.example.demo.ser.giamgia.GiamGiaSanPhamSer;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class ChuongTrinhGiamGiaController {
    @Autowired
    GiamGiaSanPhamSer giamGiaSanPhamSer;

    @Autowired
    GiamGiaHoaDonSer giamGiaHoaDonSer;

    @Autowired
    AoSer aoSer;

    @Autowired
    ChatSer chatSer;

    @Autowired
    GiamGiaSanPhamChiTietSer giamGiaSanPhamChiTietSer;

    @GetMapping("/admin/chuong_trinh_giam_gia/add_view/*")
    public String viewAdd(Model model, HttpServletRequest request) {

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/chuong_trinh_giam_gia/add_view/");
        String id = parts[1];

        try {
            GiamGiaSanPham giamGiaSanPham = giamGiaSanPhamSer.findId(UUID.fromString(id));
            GiamGiaHoaDon giamGiaHoaDon = giamGiaHoaDonSer.findId(UUID.fromString(id));

            if (giamGiaSanPham != null) {
                model.addAttribute("item", giamGiaSanPham);

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                String ngayBatDau = dateFormat.format(giamGiaSanPham.getNgayBatDau());
                String ngayKetThuc = dateFormat.format(giamGiaSanPham.getNgayKetThuc());

                model.addAttribute("ngayBatDau_sp", ngayBatDau);
                model.addAttribute("ngayKetThuc_sp", ngayKetThuc);
                model.addAttribute("CTGG", giamGiaSanPham);
                model.addAttribute("loai", "giamgia_sp");
                model.addAttribute("CTGGSP", giamGiaSanPham);
            } else if (giamGiaHoaDon != null) {
                model.addAttribute("item", giamGiaHoaDon);

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                String ngayBatDau = dateFormat.format(giamGiaHoaDon.getNgayBatDau());
                String ngayKetThuc = dateFormat.format(giamGiaHoaDon.getNgayKetThuc());

                model.addAttribute("ngayBatDau_hd", ngayBatDau);
                model.addAttribute("ngayKetThuc_hd", ngayKetThuc);
                model.addAttribute("CTGG", giamGiaHoaDon);
                model.addAttribute("loai", "giamgia_hd");
                model.addAttribute("CTGGHD", giamGiaHoaDon);
            }


        } catch (Exception e) {

        }
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());
        return "/admin/add/add_chuong_trinh";
    }

    @GetMapping("/admin/view_chuong_trinh_giam_gia_sp/*")
    public String viewCTGGSP(Model model) {

        List<GiamGiaSanPham> listGiamGiaSanPhams = giamGiaSanPhamSer.getAll();
        model.addAttribute("listGiamGiaSanPhams", listGiamGiaSanPhams);
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());
        return "/admin/chuong_trinh_giam_gia_sp";
    }

    @GetMapping("/admin/ap-dung")
    public String viewApDung(Model model) {
        List<GiamGiaSanPhamChiTiet> listGiamGiaSanPhamChiTiets = giamGiaSanPhamChiTietSer.getAll();
        model.addAttribute("listGiamGiaSanPhamChiTiets",listGiamGiaSanPhamChiTiets);
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());
        return "/admin/add/ap_dung";
    }

    @GetMapping("/admin/view_chuong_trinh_giam_gia_hd/*")
    public String viewCTGGHD(Model model) {

        List<GiamGiaHoaDon> listGiamGiaHoaDons = giamGiaHoaDonSer.getAll();
        model.addAttribute("listGiamGiaHoaDons", listGiamGiaHoaDons);
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());
        return "/admin/chuong_trinh_giam_gia_hd";
    }

    @PostMapping("/chuong-trinh-giam-gia/add")
    public String add(HttpServletRequest request) {
        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        String loai = request.getParameter("loai");
        String sosp = request.getParameter("sosp");
        String phanTramGiamSP = request.getParameter("tigiam");
        String phanTramGiamHD = request.getParameter("tigiam_hd");

        if (loai.equals("giamgia_sp")) {
            GiamGiaSanPham giamGiaSanPham = new GiamGiaSanPham();
            giamGiaSanPham.setMa(ma);
            giamGiaSanPham.setTen(ten);
            giamGiaSanPham.setPhanTramGiam(Integer.parseInt(phanTramGiamSP));

            String ngayBatDauSPString = request.getParameter("ngaybd");
            LocalDate ngayBatDauSP = LocalDate.parse(ngayBatDauSPString);
            giamGiaSanPham.setNgayBatDau(Date.from(ngayBatDauSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            String ngayKetThucSPString = request.getParameter("ngaykt");
            LocalDate ngayKetThucSP = LocalDate.parse(ngayKetThucSPString);
            giamGiaSanPham.setNgayKetThuc(Date.from(ngayKetThucSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            giamGiaSanPhamSer.add(giamGiaSanPham);
        } else if (loai.equals("giamgia_hd")) {
            BigDecimal tongtien = new BigDecimal(request.getParameter("tongtien"));
            GiamGiaHoaDon giamGiaHoaDon = new GiamGiaHoaDon();
            giamGiaHoaDon.setMa(ma);
            giamGiaHoaDon.setTen(ten);
            giamGiaHoaDon.setSoLuongSanPham(Integer.parseInt(sosp));
            giamGiaHoaDon.setPhanTramGiam(Integer.parseInt(phanTramGiamHD));

            String ngayBatDauSPString = request.getParameter("ngaybd_hd");
            LocalDate ngayBatDauSP = LocalDate.parse(ngayBatDauSPString);
            giamGiaHoaDon.setNgayBatDau(Date.from(ngayBatDauSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            String ngayKetThucSPString = request.getParameter("ngaykt_hd");
            LocalDate ngayKetThucSP = LocalDate.parse(ngayKetThucSPString);
            giamGiaHoaDon.setNgayKetThuc(Date.from(ngayKetThucSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            giamGiaHoaDon.setSoTienHoaDon(tongtien);
            giamGiaHoaDonSer.add(giamGiaHoaDon);
        }
        return "redirect:/admin/chuong_trinh_giam_gia/add_view/1";
    }

    @PostMapping("/chuong-trinh-giam-gia/update")
    public String update(HttpServletRequest request) {
        String id = request.getParameter("id");
        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        String loai = request.getParameter("loai");
        String sosp = request.getParameter("sosp");
        String phanTramGiamSP = request.getParameter("tigiam");
        String phanTramGiamHD = request.getParameter("tigiam_hd");

        if (loai.equals("giamgia_sp")) {
            GiamGiaSanPham giamGiaSanPham = new GiamGiaSanPham();
            giamGiaSanPham.setMa(ma);
            giamGiaSanPham.setTen(ten);
            giamGiaSanPham.setPhanTramGiam(Integer.parseInt(phanTramGiamSP));

            String ngayBatDauSPString = request.getParameter("ngaybd");
            LocalDate ngayBatDauSP = LocalDate.parse(ngayBatDauSPString);
            giamGiaSanPham.setNgayBatDau(Date.from(ngayBatDauSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            String ngayKetThucSPString = request.getParameter("ngaykt");
            LocalDate ngayKetThucSP = LocalDate.parse(ngayKetThucSPString);
            giamGiaSanPham.setNgayKetThuc(Date.from(ngayKetThucSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            giamGiaSanPhamSer.update(UUID.fromString(id), giamGiaSanPham);
        } else if (loai.equals("giamgia_hd")) {
            BigDecimal tongtien = new BigDecimal(request.getParameter("tongtien"));
            GiamGiaHoaDon giamGiaHoaDon = new GiamGiaHoaDon();
            giamGiaHoaDon.setMa(ma);
            giamGiaHoaDon.setTen(ten);
            giamGiaHoaDon.setSoLuongSanPham(Integer.parseInt(sosp));
            giamGiaHoaDon.setPhanTramGiam(Integer.parseInt(phanTramGiamHD));

            String ngayBatDauSPString = request.getParameter("ngaybd_hd");
            LocalDate ngayBatDauSP = LocalDate.parse(ngayBatDauSPString);
            giamGiaHoaDon.setNgayBatDau(Date.from(ngayBatDauSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            String ngayKetThucSPString = request.getParameter("ngaykt_hd");
            LocalDate ngayKetThucSP = LocalDate.parse(ngayKetThucSPString);
            giamGiaHoaDon.setNgayKetThuc(Date.from(ngayKetThucSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            giamGiaHoaDon.setSoTienHoaDon(tongtien);
            giamGiaHoaDonSer.update(UUID.fromString(id), giamGiaHoaDon);
        }
        return "redirect:/admin/chuong_trinh_giam_gia/add_view/1";
    }

    @PostMapping("/chuong-trinh-giam-gia/detail_sp")
    public String detailGGSP(HttpServletRequest request) {
        String detail = request.getParameter("detail_sp");
        return "redirect:/admin/chuong_trinh_giam_gia/add_view/" + detail;
    }

    @PostMapping("/chuong-trinh-giam-gia/detail_hd")
    public String detailGGHD(HttpServletRequest request) {
        String detail = request.getParameter("detail_hd");
        return "redirect:/admin/chuong_trinh_giam_gia/add_view/" + detail;
    }

    @PostMapping("/chuong-trinh-giam-gia/ap-dung-san-pham")
    public String apDungSanPham(HttpServletRequest request) {

        GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = new GiamGiaSanPhamChiTiet();

        String tenSanPham = request.getParameter("tenSanPham");
        String tenChuongTrinh = request.getParameter("tenChuongTrinh");
        Ao ao = aoSer.findByTen(tenSanPham);
        GiamGiaSanPham giamGiaSanPham = giamGiaSanPhamSer.findByTen(tenChuongTrinh);

        BigDecimal phanTramGiam = BigDecimal.valueOf(giamGiaSanPham.getPhanTramGiam());

        giamGiaSanPhamChiTiet.setGiamGiaSanPham(giamGiaSanPham);
        giamGiaSanPhamChiTiet.setAo(ao);
        giamGiaSanPhamChiTiet.setSoTienDaGiam(ao.getGiaBan().multiply(phanTramGiam));
        giamGiaSanPhamChiTiet.setTrangThai(0);

        giamGiaSanPhamChiTietSer.add(giamGiaSanPhamChiTiet);
        return "redirect:/admin/ap-dung";
    }
}
