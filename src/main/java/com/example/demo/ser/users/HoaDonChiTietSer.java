package com.example.demo.ser.users;


import com.example.demo.entity.dto.HoaDonChiTietDTO;
import com.example.demo.entity.khachhang.HoaDon;
import com.example.demo.entity.khachhang.HoaDonChiTiet;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public interface HoaDonChiTietSer {
    void add(HoaDonChiTiet hoaDonChiTiet);

    List<HoaDonChiTiet> findByHoaDon(UUID id);

    void update(UUID id, HoaDonChiTiet updateHDCT);

    void delete(UUID id);

    HoaDonChiTiet findById(UUID id);

    int soLuongHoaDonCHiTietByHoaDon(UUID id);

    HoaDonChiTiet findByHoaDonAndAoChiTiet(UUID idHoaDon, UUID idACT);

    Integer soLuongBanTheoNgay(LocalDate date);

    List<Integer> soLuongBanTheoThang(LocalDate date1, LocalDate date2);

    List<HoaDonChiTietDTO> listHoaDonTheoNgay(List<HoaDon> listHoaDons);

    Integer soLuongBanThangHienTai(LocalDate date1, LocalDate date2);

    Integer soLuongBanTrongThang(LocalDate date);
}
