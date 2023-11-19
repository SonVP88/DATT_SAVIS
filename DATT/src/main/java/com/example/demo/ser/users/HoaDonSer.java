package com.example.demo.ser.users;

import com.example.demo.entity.dto.BieuDoDTO;
import com.example.demo.entity.khachhang.HoaDon;
import com.example.demo.entity.dto.DonHangDTO;
import com.example.demo.entity.dto.HoaDonDTO;
import com.example.demo.entity.dto.ThongKeDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public interface HoaDonSer {
    List<HoaDon> getAll();

    HoaDon findId(UUID id);

    void update(UUID id, HoaDon updateHoaDon);

    void add(HoaDon hoaDon);

    void delete(UUID id);

    Long tongSl(UUID id);

    Page<HoaDon> listHoaDonFindByKhAndTrangThai(Integer pageNo, Integer size,UUID idKh, int trangThai);

    Page<HoaDon> listHoaDonFindByTrangThai(Integer pageNo, Integer size, int trangThai);

    List<HoaDon> findByUserAndTrangThai(UUID id, int trangThai);

    List<HoaDonDTO> findHoaDonDT0(List<HoaDon> listHoaDons);

    HoaDon findByMa(String ma);

    List<ThongKeDTO> thongKeTheoNgayThanhToan();

    int soLuongHoaDonTheoNgayandTrangThai(LocalDate date, int trangThai);

    int countHoaDonHuyByNgayHienTai(LocalDate date);

    int soLuongHoaDonHoanThanhTheoNgay(LocalDate date);

    int countHoaDonDangGiaoByNgayHienTai(LocalDate date);

    List<DonHangDTO> findAllByOrderByNgayTaoDesc();

    Page<HoaDon> listHoaDonTheoNgay(LocalDate date, Integer pageNo);

    Double doanhThuTheoNgay(LocalDate date);

    Integer soLuongKhachMuaTheoNgay(LocalDate date);

    List<Double> doanhThuTheoThang(LocalDate date1, LocalDate date2);

    List<Integer> getDataThang(LocalDate date1, LocalDate date2);

    List<HoaDon> listHoaDonByNgayChoXacNhan(LocalDate localDate);

    List<HoaDon> listHoaDonByNgayDangGiao(LocalDate localDate);

    List<HoaDon> listHoaDonByNgayHoanThanh(LocalDate localDate);

    List<HoaDon> listHoaDonByNgayHuy(LocalDate localDate);

    Double doanhThuThangHienTai(LocalDate date1, LocalDate date2);

    List<BieuDoDTO> listBieuDo();

    List<HoaDon> listHoaDonFindByTrangThaiCho( int trangThai);

    Integer soHoaDonTrongThang(LocalDate date);

    Double doanhThuThang(LocalDate date);

    Integer soLuongKhachMuaTrongThang(LocalDate date);

    Integer demHoaDon();

    List<DonHangDTO> findAllByOptionalFilters(Integer trangThai, LocalDate startDate, LocalDate endDate);

    List<DonHangDTO> findAllByStartDateAndEndDateOrBoth(LocalDate startDate, LocalDate endDate);
}
