package com.example.demo.controller.admin.giamgia;

import com.example.demo.entity.giamgia.GiamGiaHoaDon;
import com.example.demo.entity.giamgia.GiamGiaSanPham;
import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;
import com.example.demo.entity.sanpham.Ao;
import com.example.demo.ser.giamgia.GiamGiaHoaDonSer;
import com.example.demo.ser.giamgia.GiamGiaSanPhamChiTietSer;
import com.example.demo.ser.giamgia.GiamGiaSanPhamSer;
import com.example.demo.ser.sanpham.AoChiTietSer;
import com.example.demo.ser.sanpham.AoSer;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Component
@EnableScheduling
@RestController
public class HoTroTimKiemController {
    @Autowired
    GiamGiaSanPhamSer giamGiaSanPhamSer;

    @Autowired
    GiamGiaHoaDonSer giamGiaHoaDonSer;

    @Autowired
    AoChiTietSer aoChiTietSer;

    @Autowired
    AoSer aoSer;

    @Autowired
    GiamGiaSanPhamChiTietSer giamGiaSanPhamChiTietSer;

    private List<String> performSearch(String keyword) {
        // Thực hiện tìm kiếm trong danh sách dữ liệu của bạn và trả về kết quả
        List<GiamGiaSanPham> dataList = giamGiaSanPhamSer.getAll();
        List<String> resultList = new ArrayList<>();

        for (GiamGiaSanPham data : dataList) {
            if (data.getTen().toLowerCase().contains(keyword.toLowerCase())) {
                resultList.add(data.getTen());
            }
        }

        return resultList;
    }

    private List<String> performSearch1(String keyword) {
        // Thực hiện tìm kiếm trong danh sách dữ liệu của bạn và trả về kết quả
        List<GiamGiaHoaDon> dataList = giamGiaHoaDonSer.getAll();
        List<String> resultList = new ArrayList<>();

        for (GiamGiaHoaDon data : dataList) {
            if (data.getTen().toLowerCase().contains(keyword.toLowerCase())) {
                resultList.add(data.getTen());
            }
        }

        return resultList;
    }

    private List<String> performSearch2(String keyword) {

        List<Ao> dataList = aoSer.getAll();
        List<String> resultList = new ArrayList<>();

        for (Ao data : dataList) {
            if (data.getTen().toLowerCase().contains(keyword.toLowerCase())) {
                resultList.add(data.getTen());
            }
        }

        return resultList;
    }

    @GetMapping("/search")
    public List<String> search( HttpServletRequest request) {
        String keyword = request.getParameter("keyword");
        if(keyword != null && !keyword.isEmpty()){
            List<String> resultList = performSearch(keyword);
            return resultList;
        }
        return Collections.emptyList();
    }

    @GetMapping("/search1")
    public List<String> search1( HttpServletRequest request) {
        String keyword = request.getParameter("keyword1");
        if(keyword != null && !keyword.isEmpty()){
            List<String> resultList = performSearch1(keyword);
            return resultList;
        }
        return Collections.emptyList();
    }

    @GetMapping("/search2")
    public List<String> search2( HttpServletRequest request) {
        String keyword = request.getParameter("keyword2");
        if(keyword != null && !keyword.isEmpty()){
            List<String> resultList = performSearch2(keyword);
            return resultList;
        }
        return Collections.emptyList();
    }

    @Scheduled(cron = "0 0 * * * ?")
    public void updateTrangThai() {
        LocalDate localDate = LocalDate.now();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            for (GiamGiaSanPham giamGiaSanPham : giamGiaSanPhamSer.getAll()){
                String ngayKetThucStr = dateFormat.format(giamGiaSanPham.getNgayKetThuc());
                LocalDate ngayKetThuc = LocalDate.parse(ngayKetThucStr);
                if (localDate.compareTo(ngayKetThuc) > 0){

                    List<GiamGiaSanPhamChiTiet> listGG = giamGiaSanPhamChiTietSer.findAllByGiamGiaSP(giamGiaSanPham.getId());

                    for (GiamGiaSanPhamChiTiet update : listGG){
                        GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = new GiamGiaSanPhamChiTiet();

                        giamGiaSanPhamChiTiet.setAo(update.getAo());
                        giamGiaSanPhamChiTiet.setGiamGiaSanPham(update.getGiamGiaSanPham());
                        giamGiaSanPhamChiTiet.setSoTienDaGiam(update.getSoTienDaGiam());
                        giamGiaSanPhamChiTiet.setTrangThai(1);

                        giamGiaSanPhamChiTietSer.update(update.getId(),giamGiaSanPhamChiTiet);
                    }

                    GiamGiaSanPham giamGiaSanPham1 = new GiamGiaSanPham();

                    giamGiaSanPham1.setMa(giamGiaSanPham.getMa());
                    giamGiaSanPham1.setTen(giamGiaSanPham.getTen());
                    giamGiaSanPham1.setNgayBatDau(giamGiaSanPham.getNgayBatDau());
                    giamGiaSanPham1.setNgayKetThuc(giamGiaSanPham.getNgayKetThuc());
                    giamGiaSanPham1.setPhanTramGiam(giamGiaSanPham.getPhanTramGiam());
                    giamGiaSanPham1.setTrangThai(1);

                    giamGiaSanPhamSer.update(giamGiaSanPham.getId(),giamGiaSanPham1);
                    System.out.println("Oke");
                }else {
                    GiamGiaSanPham giamGiaSanPham1 = new GiamGiaSanPham();

                    giamGiaSanPham1.setMa(giamGiaSanPham.getMa());
                    giamGiaSanPham1.setTen(giamGiaSanPham.getTen());
                    giamGiaSanPham1.setNgayBatDau(giamGiaSanPham.getNgayBatDau());
                    giamGiaSanPham1.setNgayKetThuc(giamGiaSanPham.getNgayKetThuc());
                    giamGiaSanPham1.setPhanTramGiam(giamGiaSanPham.getPhanTramGiam());
                    giamGiaSanPham1.setTrangThai(0);

                    giamGiaSanPhamSer.update(giamGiaSanPham.getId(),giamGiaSanPham1);
                    System.out.println("Oke");
                }
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        try {
            for (GiamGiaHoaDon giamGiaHoaDon : giamGiaHoaDonSer.getAll()){
                String ngayKetThucStr = dateFormat.format(giamGiaHoaDon.getNgayKetThuc());
                LocalDate ngayKetThuc = LocalDate.parse(ngayKetThucStr);
                if (localDate.compareTo(ngayKetThuc) > 0){
                    GiamGiaHoaDon giamGiaHoaDon1 = new GiamGiaHoaDon();

                    giamGiaHoaDon1.setMa(giamGiaHoaDon.getMa());
                    giamGiaHoaDon1.setTen(giamGiaHoaDon.getTen());
                    giamGiaHoaDon1.setNgayBatDau(giamGiaHoaDon.getNgayBatDau());
                    giamGiaHoaDon1.setNgayKetThuc(giamGiaHoaDon.getNgayKetThuc());
                    giamGiaHoaDon1.setPhanTramGiam(giamGiaHoaDon.getPhanTramGiam());
                    giamGiaHoaDon1.setSoLuongSanPham(giamGiaHoaDon.getSoLuongSanPham());
                    giamGiaHoaDon1.setSoTienHoaDon(giamGiaHoaDon.getSoTienHoaDon());
                    giamGiaHoaDon1.setTrangThai(1);

                    giamGiaHoaDonSer.update(giamGiaHoaDon.getId(),giamGiaHoaDon1);
                    System.out.println("Oke");
                }else {
                    GiamGiaHoaDon giamGiaHoaDon1 = new GiamGiaHoaDon();

                    giamGiaHoaDon1.setMa(giamGiaHoaDon.getMa());
                    giamGiaHoaDon1.setTen(giamGiaHoaDon.getTen());
                    giamGiaHoaDon1.setNgayBatDau(giamGiaHoaDon.getNgayBatDau());
                    giamGiaHoaDon1.setNgayKetThuc(giamGiaHoaDon.getNgayKetThuc());
                    giamGiaHoaDon1.setPhanTramGiam(giamGiaHoaDon.getPhanTramGiam());
                    giamGiaHoaDon1.setSoLuongSanPham(giamGiaHoaDon.getSoLuongSanPham());
                    giamGiaHoaDon1.setSoTienHoaDon(giamGiaHoaDon.getSoTienHoaDon());
                    giamGiaHoaDon1.setTrangThai(0);

                    giamGiaHoaDonSer.update(giamGiaHoaDon1.getId(),giamGiaHoaDon1);
                    System.out.println("Oke");
                }
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
    }
}
