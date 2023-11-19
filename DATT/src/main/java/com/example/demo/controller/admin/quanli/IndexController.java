package com.example.demo.controller.admin.quanli;

import com.example.demo.entity.auth.RoleEnum;
import com.example.demo.entity.dto.AoDTO;
import com.example.demo.entity.dto.BieuDoDTO;
import com.example.demo.entity.dto.HoaDonChiTietDTO;
import com.example.demo.entity.dto.ThongKeDTO;
import com.example.demo.entity.dto.ThongKeSoLuongAoDTO;
import com.example.demo.entity.khachhang.HoaDon;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.repo.chat.DemChatRepository;
import com.example.demo.repo.users.HoaDonRepo;
import com.example.demo.ser.chat.ChatSer;
import com.example.demo.ser.sanpham.AnhSer;
import com.example.demo.ser.sanpham.AoChiTietSer;
import com.example.demo.ser.sanpham.AoSer;
import com.example.demo.ser.sanpham.ChatVaiSer;
import com.example.demo.ser.sanpham.FormSer;
import com.example.demo.ser.sanpham.HangSer;
import com.example.demo.ser.sanpham.LoaiAoSer;
import com.example.demo.ser.sanpham.MauSacSer;
import com.example.demo.ser.sanpham.SizeSer;
import com.example.demo.ser.users.HoaDonChiTietSer;
import com.example.demo.ser.users.HoaDonSer;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.Console;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    HoaDonSer hoaDonSer;

    @Autowired
    DemChatRepository demChatRepository;

    @Autowired
    HoaDonChiTietSer hoaDonChiTietSer;

    @Autowired
    ChatSer chatSer;

    @Autowired
    HoaDonRepo hoaDonRepo;

    @Autowired
    AoChiTietSer aoChiTietSer;

    @Autowired
    LoaiAoSer loaiAoSer;

    @Autowired
    MauSacSer mauSacSer;

    @GetMapping("/admin/index/*")
    public String index(Model model, HttpServletRequest request,
                        @RequestParam(name = "pageNo", required = false, defaultValue = "0") Integer pageNo) {

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;
        if (user.getRole() == RoleEnum.STAFF){
            model.addAttribute("adminOrStaff", "1");
        }else if (user.getRole() == RoleEnum.ADMIN){
            model.addAttribute("adminOrStaff", "2");
        }
        model.addAttribute("nameUser", user.getTen());

        LocalDateTime ngayHienTai = LocalDateTime.now();

        LocalDate date = LocalDate.now();

        List<ThongKeDTO> listThongKeDTOS = hoaDonSer.thongKeTheoNgayThanhToan();
        int soDonMoi = hoaDonSer.soLuongHoaDonTheoNgayandTrangThai(date, 1);
        int soDonDangGiao = hoaDonSer.countHoaDonDangGiaoByNgayHienTai(date);
        int soDonHoanThanh = hoaDonSer.soLuongHoaDonHoanThanhTheoNgay(date);
        int soDonHuy = hoaDonSer.countHoaDonHuyByNgayHienTai(date);
        Page<HoaDon> page = hoaDonSer.listHoaDonTheoNgay(date, pageNo);

        List<HoaDon> listHDChoXacNhan = hoaDonSer.listHoaDonByNgayChoXacNhan(date);
        List<HoaDon> listHDDangGiao = hoaDonSer.listHoaDonByNgayDangGiao(date);
        List<HoaDon> listHDHoanThanh = hoaDonSer.listHoaDonByNgayHoanThanh(date);
        List<HoaDon> listHDHuy = hoaDonSer.listHoaDonByNgayHuy(date);

        List<HoaDonChiTietDTO> listHoaDonChoXacNhanDTOS = hoaDonChiTietSer.listHoaDonTheoNgay(listHDChoXacNhan);
        List<HoaDonChiTietDTO> listHoaDonDangGiaoDTOS = hoaDonChiTietSer.listHoaDonTheoNgay(listHDDangGiao);
        List<HoaDonChiTietDTO> listHoaDonHoanThanhDTOS = hoaDonChiTietSer.listHoaDonTheoNgay(listHDHoanThanh);
        List<HoaDonChiTietDTO> listHoaDonHuyDTOS = hoaDonChiTietSer.listHoaDonTheoNgay(listHDHuy);

        model.addAttribute("listThongKeDTOS", listThongKeDTOS);
        model.addAttribute("ngayHienTai", ngayHienTai);
        model.addAttribute("soDonMoi", soDonMoi);
        model.addAttribute("soDonDangGiao", soDonDangGiao);
        model.addAttribute("soDonHoanThanh", soDonHoanThanh);
        model.addAttribute("soDonHuy", soDonHuy);
        model.addAttribute("page", page);
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());
        model.addAttribute("listHoaDonChoXacNhanDTOS", listHoaDonChoXacNhanDTOS);
        model.addAttribute("listHoaDonDangGiaoDTOS", listHoaDonDangGiaoDTOS);
        model.addAttribute("listHoaDonHoanThanhDTOS", listHoaDonHoanThanhDTOS);
        model.addAttribute("listHoaDonHuyDTOS", listHoaDonHuyDTOS);

        List<BieuDoDTO> listBieuDoDTOS = hoaDonSer.listBieuDo();

        model.addAttribute("listBieuDoDTOS", listBieuDoDTOS);


        return "/admin/index";
    }

    @GetMapping("/admin/thong_ke/*")
    public String thongKe(Model model, HttpServletRequest request) {

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;
        if (user.getRole() == RoleEnum.STAFF){
            model.addAttribute("adminOrStaff", "1");
        }else if (user.getRole() == RoleEnum.ADMIN){
            model.addAttribute("adminOrStaff", "2");
        }
        model.addAttribute("nameUser", user.getTen());

        LocalDate ngayHienTai = LocalDate.now();
        LocalDate ngayHomTruoc = ngayHienTai.minus(1, ChronoUnit.DAYS);
        LocalDate ngayStart = ngayHienTai.minusMonths(4);
        YearMonth yearMonth = YearMonth.from(ngayHienTai);
        LocalDate firstDayOfMonth = yearMonth.atDay(1);


        Integer soDonNgayHienTai = hoaDonSer.soLuongHoaDonHoanThanhTheoNgay(ngayHienTai);
        Integer soDonNgayHomTruoc = hoaDonSer.soLuongHoaDonHoanThanhTheoNgay(ngayHomTruoc);

        if (soDonNgayHienTai == null) {
            soDonNgayHienTai = 0;
        }
        if (soDonNgayHomTruoc == null) {
            soDonNgayHomTruoc = 0;
        }

        Integer soLuongBanNgayHienTai = hoaDonChiTietSer.soLuongBanTheoNgay(ngayHienTai);
        Integer soLuongBanNgayTruoc = hoaDonChiTietSer.soLuongBanTheoNgay(ngayHomTruoc);

        if (soLuongBanNgayHienTai == null) {
            soLuongBanNgayHienTai = 0;
        }
        if (soLuongBanNgayTruoc == null) {
            soLuongBanNgayTruoc = 0;
        }

        Double doanhThuNgayHienTai = hoaDonSer.doanhThuTheoNgay(ngayHienTai);
        Double doanhThuNgayTruocStr = hoaDonSer.doanhThuTheoNgay(ngayHomTruoc);


        if (doanhThuNgayHienTai == null) {
            doanhThuNgayHienTai = 0.0;
        }
        if (doanhThuNgayTruocStr == null) {
            doanhThuNgayTruocStr = 0.0;
        }

        Integer soLuongKhachMuaNgayHienTai = hoaDonSer.soLuongKhachMuaTheoNgay(ngayHienTai);
        Integer soLuongKhachMuaNgayTruocStr = hoaDonSer.soLuongKhachMuaTheoNgay(ngayHomTruoc);


        if (soLuongKhachMuaNgayHienTai == null) {
            soLuongKhachMuaNgayHienTai = 0;
        }
        if (soLuongKhachMuaNgayTruocStr == null) {
            soLuongKhachMuaNgayTruocStr = 0;
        }

        DecimalFormat df = new DecimalFormat("0.00");
        double soSanhHoaDon;
        if(soDonNgayHomTruoc==0){
            soSanhHoaDon=100;
        }
        else{
            soSanhHoaDon= ((double) (soDonNgayHienTai - soDonNgayHomTruoc) / soDonNgayHomTruoc) * 100;
        }
        String formatSoSanhHoaDon = df.format(soSanhHoaDon);

        if (soSanhHoaDon < 0) {
            model.addAttribute("soSanhHoaDon", formatSoSanhHoaDon);
            model.addAttribute("mauHD", "danger");
        } else {
            model.addAttribute("soSanhHoaDon", "+" + formatSoSanhHoaDon);
            model.addAttribute("mauHD", "success");
        }

        double soSanhSoLuongBan;

        if (soLuongBanNgayTruoc == 0) {
            soSanhSoLuongBan = 100;
        } else {
            soSanhSoLuongBan = ((double) (soLuongBanNgayHienTai - soLuongBanNgayTruoc) / soLuongBanNgayTruoc) * 100;
        }

        String formatSoSanhSoLuong = df.format(soSanhSoLuongBan);
        if (soSanhSoLuongBan < 0) {
            model.addAttribute("soSanhSoLuong", formatSoSanhSoLuong);
            model.addAttribute("mauSL", "danger");
        } else {
            model.addAttribute("soSanhSoLuong", "+" + formatSoSanhSoLuong);
            model.addAttribute("mauSL", "success");
        }

        double soSanhDoanhThu ;

        if (doanhThuNgayTruocStr == 0.0){
            soSanhDoanhThu = 100;
        }else {
            soSanhDoanhThu = ((doanhThuNgayHienTai - doanhThuNgayTruocStr) / doanhThuNgayTruocStr) * 100;
        }
        String formatSoSanhDoanhThu = df.format(soSanhDoanhThu);

        if (soSanhDoanhThu < 0) {
            model.addAttribute("soSanhDoanhThu", formatSoSanhDoanhThu);
            model.addAttribute("mauDT", "danger");
        } else {
            model.addAttribute("soSanhDoanhThu", "+" + formatSoSanhDoanhThu);
            model.addAttribute("mauDT", "success");
        }

        double soSanhSoLuongKhach;

        if (soLuongKhachMuaNgayTruocStr == 0){
            soSanhSoLuongKhach = 100;
        }else {
            soSanhSoLuongKhach = ((double) (soLuongKhachMuaNgayHienTai - soLuongKhachMuaNgayTruocStr) / soLuongKhachMuaNgayTruocStr) * 100;
        }

        String formatSoSanhSoLuongKhach = df.format(soSanhSoLuongKhach);

        if (soSanhSoLuongKhach < 0) {
            model.addAttribute("soSanhSoLuongKhach", formatSoSanhSoLuongKhach);
            model.addAttribute("mauSLK", "danger");
        } else {
            model.addAttribute("soSanhSoLuongKhach", "+" + formatSoSanhSoLuongKhach);
            model.addAttribute("mauSLK", "success");
        }


        List<Double> doanhThuTheoThang = hoaDonSer.doanhThuTheoThang(ngayStart, ngayHienTai);
        List<Integer> soLuongBanTheoThang = hoaDonChiTietSer.soLuongBanTheoThang(ngayStart, ngayHienTai);

        List<Integer> getThang = hoaDonSer.getDataThang(ngayStart,ngayHienTai);
        List<Integer> monthsInPeriod = new ArrayList<>();
        LocalDate currentDate = ngayStart;
        while (!currentDate.isAfter(ngayHienTai)) {
            monthsInPeriod.add(currentDate.getMonthValue());
            currentDate = currentDate.plusMonths(1);
        }

        List<Double> finalResult = new ArrayList<>();
        List<Integer> finalResult1 = new ArrayList<>();
        for (Integer month : monthsInPeriod) {
            boolean found = false,found1=false;
            for (int i = 0; i < doanhThuTheoThang.size(); i++) {
                if (month == getThang.get(i)) {
                    finalResult.add(doanhThuTheoThang.get(i));
                    found = true;
                    break;
                }
            }
            if (!found) {
                finalResult.add(0.0);
            }
            for (int i = 0; i < soLuongBanTheoThang.size(); i++) {
                if (month == getThang.get(i)) {
                    finalResult1.add(soLuongBanTheoThang.get(i));
                    found1 = true;
                    break;
                }
            }
            if (!found1) {
                finalResult1.add(0);
            }
        }
        for (int i = 0; i < finalResult.size(); i++) {
            System.out.println(finalResult);
        }

        Double doanhThuThangHienTai = hoaDonSer.doanhThuThangHienTai(firstDayOfMonth,ngayHienTai);

        NumberFormat numberFormat = new DecimalFormat("#,###");
        String doanhThuFormatted = numberFormat.format(doanhThuThangHienTai);

        Integer soLuongBanThangHienTai = hoaDonChiTietSer.soLuongBanThangHienTai(firstDayOfMonth,ngayHienTai);
        model.addAttribute("doanhThuThangHienTai",doanhThuFormatted);
        model.addAttribute("soLuongBanThangHienTai",soLuongBanThangHienTai);
        model.addAttribute("soHoaDonHomNay", soDonNgayHienTai);
        model.addAttribute("soLuongHomNay", soLuongBanNgayHienTai);
        model.addAttribute("doanhThuHomNay", doanhThuNgayHienTai);
        model.addAttribute("soLuongKhachMua", soLuongKhachMuaNgayHienTai);
        model.addAttribute("listDoanhThu", finalResult);
        model.addAttribute("listSoLuong", finalResult1);
        model.addAttribute("mauSac", mauSacSer.getAll());
        model.addAttribute("loaiAo", loaiAoSer.getAll());
        model.addAttribute("ngayHienTai", ngayHienTai);
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());

        List<ThongKeSoLuongAoDTO> listThongKeSoLuongAoDTOS = aoChiTietSer.thongKeSoLuongAoDTO();
        model.addAttribute("listThongKeSoLuongAoDTOS", listThongKeSoLuongAoDTOS);

        model.addAttribute("listLoaiAo", loaiAoSer.findAllByTrangThai(1));

        return "/admin/thongke";
    }
}
