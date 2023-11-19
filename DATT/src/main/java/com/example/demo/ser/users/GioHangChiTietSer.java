package com.example.demo.ser.users;

import com.example.demo.entity.khachhang.GioHangChiTiet;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public interface GioHangChiTietSer {

    List<GioHangChiTiet> getAll();

    void add(GioHangChiTiet gioHangChiTiet);

    List<GioHangChiTiet> view(UUID idGH);

    void update(UUID id, GioHangChiTiet update);

    GioHangChiTiet findById(UUID id);

    Long soLuongSanPhamGioHang(UUID id);

    void delete(UUID id);

    GioHangChiTiet findByKhachHangAndAoChiTiet(UUID idKh, UUID idAoChiTiet);
}
