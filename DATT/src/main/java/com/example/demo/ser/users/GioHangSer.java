package com.example.demo.ser.users;

import com.example.demo.entity.khachhang.GioHang;
import com.example.demo.entity.sanpham.AoChiTiet;

import java.util.List;
import java.util.UUID;

public interface GioHangSer {
    List<AoChiTiet> findByIdAo(UUID id);

    GioHang findByIdKH(UUID id);

    void add(GioHang gioHang);

    int soLuongGioHang();
}
