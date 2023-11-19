package com.example.demo.ser.impl.users;

import com.example.demo.entity.dto.BieuDoDTO;
import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;
import com.example.demo.entity.khachhang.HoaDon;
import com.example.demo.entity.khachhang.HoaDonChiTiet;
import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.dto.DonHangDTO;
import com.example.demo.entity.dto.HoaDonDTO;
import com.example.demo.entity.dto.ThongKeDTO;
import com.example.demo.repo.giamgia.GiamGiaSanPhamChiTietRepo;
import com.example.demo.repo.users.HoaDonChiTietRepo;
import com.example.demo.repo.users.HoaDonRepo;
import com.example.demo.ser.users.HoaDonSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class HoaDonSerImpl implements HoaDonSer {

    @Autowired
    HoaDonRepo hoaDonRepo;

    @Autowired
    HoaDonChiTietRepo hoaDonChiTietRepo;

    @Autowired
    GiamGiaSanPhamChiTietRepo giamGiaSanPhamChiTietRepo;

    @Override
    public List<HoaDon> getAll() {
        return hoaDonRepo.findAll();
    }

    @Override
    public HoaDon findId(UUID id) {
        Optional<HoaDon> optionalHoaDon = hoaDonRepo.findById(id);
        return optionalHoaDon.orElse(null);
    }

    @Override
    public void update(UUID id, HoaDon updateHoaDon) {
        Optional<HoaDon> optionalHoaDon = hoaDonRepo.findById(id);
        if (optionalHoaDon.isPresent()) {
            HoaDon hoaDon = optionalHoaDon.get();

            hoaDon.setMa(updateHoaDon.getMa());
            hoaDon.setNgayTao(updateHoaDon.getNgayTao());
            hoaDon.setNgayChoXacNhan(updateHoaDon.getNgayChoXacNhan());
            hoaDon.setNgayXacNhan(updateHoaDon.getNgayXacNhan());
            hoaDon.setNgayHoanThanh(updateHoaDon.getNgayHoanThanh());
            hoaDon.setNgayHuy(updateHoaDon.getNgayHuy());
            hoaDon.setNgayThanhToan(updateHoaDon.getNgayThanhToan());
            hoaDon.setNhanVien(updateHoaDon.getNhanVien());
            hoaDon.setKhachHang(updateHoaDon.getKhachHang());
            hoaDon.setMoTa(updateHoaDon.getMoTa());
            hoaDon.setGhiChu(updateHoaDon.getGhiChu());
            hoaDon.setTongTien(updateHoaDon.getTongTien());
            hoaDon.setHinhThuc(updateHoaDon.getHinhThuc());
            hoaDon.setTrangThai(updateHoaDon.getTrangThai());

            hoaDonRepo.save(hoaDon);
        }
    }

    @Override
    public void add(HoaDon hoaDon) {
        hoaDonRepo.save(hoaDon);
    }

    @Override
    public void delete(UUID id) {
        hoaDonRepo.deleteById(id);
    }

    @Override
    public Long tongSl(UUID id) {
        return hoaDonRepo.tongSl(id);
    }

    @Override
    public Page<HoaDon> listHoaDonFindByKhAndTrangThai(Integer pageNo, Integer size, UUID idKh, int trangThai) {
        Pageable pageable = PageRequest.of(pageNo, size);
        return hoaDonRepo.listHoaDonFindByKhAndTrangThai(idKh, trangThai, pageable);
    }

    @Override
    public Page<HoaDon> listHoaDonFindByTrangThai(Integer pageNo, Integer size, int trangThai) {
        Pageable pageable = PageRequest.of(pageNo, size);
        return hoaDonRepo.listHoaDonFindByTrangThai(trangThai, pageable);
    }

    @Override
    public List<HoaDon> findByUserAndTrangThai(UUID id, int trangThai) {
        return hoaDonRepo.findByUserAndTrangThai(id, trangThai);
    }

    @Override
    public List<HoaDonDTO> findHoaDonDT0(List<HoaDon> listHoaDons) {

        List<HoaDonDTO> hoaDonDTOS = new ArrayList<>();

        for (HoaDon hoaDon : listHoaDons) {
            int donGia = 0;
            HoaDonDTO hoaDonDTO = new HoaDonDTO();
            List<HoaDonChiTiet> listHoaDonChiTiets = hoaDonChiTietRepo.findByHoaDon(hoaDon.getId());
            for (HoaDonChiTiet hoaDonChiTiet : listHoaDonChiTiets) {
                Ao ao = hoaDonChiTiet.getAoChiTiet().getAo();
                GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietRepo.findByIdAoAndTrangThai(ao.getId());
                if (giamGiaSanPhamChiTiet != null) {
                    donGia += (ao.getGiaBan().toBigInteger().intValue() * (100 - giamGiaSanPhamChiTiet.getGiamGiaSanPham().getPhanTramGiam()) / 100) * hoaDonChiTiet.getSoLuong();
                } else {
                    donGia += ao.getGiaBan().toBigInteger().intValue() * hoaDonChiTiet.getSoLuong();
                }
            }
            hoaDonDTO.setHoaDon(hoaDon);
            hoaDonDTO.setHoaDonChiTiets(listHoaDonChiTiets);
            hoaDonDTO.setDonGia(donGia);
            hoaDonDTOS.add(hoaDonDTO);
        }
        return hoaDonDTOS;
    }

    @Override
    public HoaDon findByMa(String ma) {
        return hoaDonRepo.findByMa(ma);
    }

    @Override
    public List<ThongKeDTO> thongKeTheoNgayThanhToan() {

        List<ThongKeDTO> listThongKeDTOS = new ArrayList<>();
        List<Object[]> listDates = hoaDonRepo.listNgayThanhToanHoanThanh();

        for (Object[] date : listDates) {
            LocalDate localDate = ((java.sql.Date) date[0]).toLocalDate();
            ThongKeDTO thongKeDTO = new ThongKeDTO();
            thongKeDTO.setNgayThanhToan(localDate);
            thongKeDTO.setSoLuong(hoaDonChiTietRepo.soLuongBanTheoNgayThanhToan(localDate));
            listThongKeDTOS.add(thongKeDTO);
        }

        return listThongKeDTOS;
    }

    @Override
    public int soLuongHoaDonTheoNgayandTrangThai(LocalDate date, int trangThai) {
        return hoaDonRepo.soLuongHoaDonTheoNgayandTrangThai(date, trangThai);
    }

    @Override
    public int countHoaDonHuyByNgayHienTai(LocalDate date) {
        return hoaDonRepo.countHoaDonHuyByNgayHienTai(date);
    }

    @Override
    public int soLuongHoaDonHoanThanhTheoNgay(LocalDate date) {
        return hoaDonRepo.soLuongHoaDonHoanThanhTheoNgay(date);
    }

    @Override
    public int countHoaDonDangGiaoByNgayHienTai(LocalDate date) {
        return hoaDonRepo.countHoaDonDangGiaoByNgayHienTai(date);
    }

    @Override
    public List<DonHangDTO> findAllByOrderByNgayTaoDesc() {

        List<DonHangDTO> listDonHangDTOS = new ArrayList<>();
        List<HoaDon> listHoaDons = hoaDonRepo.findAllByOrderByNgayTaoDesc();
        for (HoaDon hoaDon : listHoaDons) {
            DonHangDTO donHangDTO = new DonHangDTO();

            int sl = Math.toIntExact(hoaDonRepo.tongSl(hoaDon.getId()));

            if(hoaDon.getKhachHang() == null){
                donHangDTO.setTen(null);
            }else {
                donHangDTO.setTen(hoaDon.getKhachHang().getTen());
            }

            donHangDTO.setHoaDon(hoaDon);
            donHangDTO.setSoLuong(sl);

            listDonHangDTOS.add(donHangDTO);
        }

        return listDonHangDTOS;
    }

    @Override
    public Page<HoaDon> listHoaDonTheoNgay(LocalDate date, Integer pageNo) {
        Pageable pageable = PageRequest.of(pageNo, 5);
        return hoaDonRepo.listHoaDonTheoNgay(date, pageable);
    }

    @Override
    public Double doanhThuTheoNgay(LocalDate date) {
        return hoaDonRepo.doanhThuTheoNgay(date);
    }

    @Override
    public Integer soLuongKhachMuaTheoNgay(LocalDate date) {
        return hoaDonRepo.soLuongKhachMuaTheoNgay(date);
    }

    @Override
    public List<Double> doanhThuTheoThang(LocalDate date1, LocalDate date2) {
        return hoaDonRepo.doanhThuTheoThang(date1, date2);
    }

    @Override
    public List<Integer> getDataThang(LocalDate date1, LocalDate date2) {
        return hoaDonRepo.getDataThang(date1, date2);
    }

    @Override
    public List<HoaDon> listHoaDonByNgayChoXacNhan(LocalDate localDate) {
        return hoaDonRepo.listHoaDonByNgayChoXacNhan(localDate);
    }

    @Override
    public List<HoaDon> listHoaDonByNgayDangGiao(LocalDate localDate) {
        return hoaDonRepo.listHoaDonByNgayDangGiao(localDate);
    }

    @Override
    public List<HoaDon> listHoaDonByNgayHoanThanh(LocalDate localDate) {
        return hoaDonRepo.listHoaDonByNgayHoanThanh(localDate);
    }

    @Override
    public List<HoaDon> listHoaDonByNgayHuy(LocalDate localDate) {
        return hoaDonRepo.listHoaDonByNgayHuy(localDate);
    }

    @Override
    public Double doanhThuThangHienTai(LocalDate date1, LocalDate date2) {
        return hoaDonRepo.doanhThuThangHienTai(date1, date2);
    }

    @Override
    public List<BieuDoDTO> listBieuDo() {

        List<BieuDoDTO> listBieuDoDTOS = new ArrayList<>();

        List<String> listYear = hoaDonRepo.listYearByHoaDon();

        LocalDate currentDate = LocalDate.now();
        int currentMonth = currentDate.getMonthValue();
        int currentYear = currentDate.getYear();


        for (int i = 1; i <= currentMonth; i++) {
            BieuDoDTO bieuDoDTO = new BieuDoDTO();

            BigDecimal tongTien = hoaDonRepo.tongTienTheoThangNam(i, currentYear);
            BigDecimal tt;
            if (tongTien == null) {
                tt = BigDecimal.valueOf(0);
            } else {
                tt = tongTien;
            }

            BigDecimal tongTienHuy = hoaDonRepo.tongTienHuyTheoThangNam(i, currentYear);
            BigDecimal ttHuy;
            if (tongTienHuy == null) {
                ttHuy = BigDecimal.valueOf(0);
            } else {
                ttHuy = tongTienHuy;
            }

            int soDonHoanThanh = hoaDonRepo.soDonHoanThanh(i, currentYear);
            int soDonHuy = hoaDonRepo.soDonHuy(i, currentYear);

            String thang = "tháng " + i;

            bieuDoDTO.setThang(thang);
            bieuDoDTO.setTongTienHoanThanh(tt);
            bieuDoDTO.setTongTienHuy(ttHuy);
            bieuDoDTO.setSoDonHoanThanh(soDonHoanThanh);
            bieuDoDTO.setSoDonHuy(soDonHuy);

            listBieuDoDTOS.add(bieuDoDTO);
        }

        return listBieuDoDTOS;
    }

    @Override
    public List<HoaDon> listHoaDonFindByTrangThaiCho(int trangThai) {
        return hoaDonRepo.listHoaDonFindByTrangThaiCho(trangThai);
    }

    @Override
    public Integer soHoaDonTrongThang(LocalDate date) {
        return hoaDonRepo.soHoaDonTrongThang(date);
    }

    @Override
    public Double doanhThuThang(LocalDate date) {
        return hoaDonRepo.doanhThuThang(date);
    }

    @Override
    public Integer soLuongKhachMuaTrongThang(LocalDate date) {
        return hoaDonRepo.soLuongKhachMuaTrongThang(date);
    }

    @Override
    public Integer demHoaDon() {
        return hoaDonRepo.demHoaDon();
    }

    @Override
    public List<DonHangDTO> findAllByOptionalFilters(Integer trangThai, LocalDate startDate, LocalDate endDate) {
        List<DonHangDTO> listDonHangDTOS = new ArrayList<>();
        List<HoaDon> listHoaDons = hoaDonRepo.findAllByOptionalFilters(trangThai, startDate, endDate);
        for (HoaDon hoaDon : listHoaDons) {
            DonHangDTO donHangDTO = new DonHangDTO();

            int sl = Math.toIntExact(hoaDonRepo.tongSl(hoaDon.getId()));

            if(hoaDon.getKhachHang() == null){
                donHangDTO.setTen(null);
            }else {
                donHangDTO.setTen(hoaDon.getKhachHang().getTen());
            }

            donHangDTO.setHoaDon(hoaDon);
            donHangDTO.setSoLuong(sl);

            listDonHangDTOS.add(donHangDTO);
        }

        return listDonHangDTOS;
    }

    @Override
    public List<DonHangDTO> findAllByStartDateAndEndDateOrBoth(LocalDate startDate, LocalDate endDate) {
        List<DonHangDTO> listDonHangDTOS = new ArrayList<>();
        List<HoaDon> listHoaDons = new ArrayList<>();

        if (startDate != null && endDate == null){
            listHoaDons = hoaDonRepo.findHoaDonByFilterStartNgayTao(startDate);
        }else if (startDate == null && endDate != null){
            listHoaDons = hoaDonRepo.findHoaDonByFilterEndNgayTao(endDate);
        }else if(startDate != null && endDate != null){
            listHoaDons = hoaDonRepo.findAllByStartDateAndEndDateOrBoth(startDate, endDate);
        }else if(startDate == null && endDate == null){
            listHoaDons = hoaDonRepo.findAllByOrderByNgayTaoDesc();
        }

        for (HoaDon hoaDon : listHoaDons) {
            DonHangDTO donHangDTO = new DonHangDTO();

            int sl = Math.toIntExact(hoaDonRepo.tongSl(hoaDon.getId()));

            if(hoaDon.getKhachHang() == null){
                donHangDTO.setTen(null);
            }else {
                donHangDTO.setTen(hoaDon.getKhachHang().getTen());
            }

            donHangDTO.setHoaDon(hoaDon);
            donHangDTO.setSoLuong(sl);

            listDonHangDTOS.add(donHangDTO);
        }

        return listDonHangDTOS;
    }
}
