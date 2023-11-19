package com.example.demo.repo.users;

import com.example.demo.entity.khachhang.GioHangChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface GioHangChiTietRepo extends JpaRepository<GioHangChiTiet, UUID> {
    @Query("select ghct from GioHangChiTiet ghct where ghct.gioHang.id = ?1 and ghct.trangThai = 0")
    List<GioHangChiTiet> findByIdGH(UUID id);

    @Query("select count(ghct.gioHang.id) from GioHangChiTiet ghct where ghct.gioHang.id = ?1 and ghct.trangThai = 0")
    Long soLuongSanPhamGioHang(UUID id);

    @Query("select ghct from GioHangChiTiet ghct where ghct.gioHang.khachHang.id = ?1 and ghct.aoChiTiet.id = ?2")
    GioHangChiTiet findByKhachHangAndAoChiTiet(UUID idKh, UUID idAoChiTiet);
}
