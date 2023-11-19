package com.example.demo.repo.users;

import com.example.demo.entity.khachhang.GioHang;
import com.example.demo.entity.sanpham.AoChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface GioHangRepo extends JpaRepository<GioHang, UUID> {
    @Query("select act from AoChiTiet act where act.ao.id = ?1")
    List<AoChiTiet> findByIdAo(UUID id);

    @Query("select gh from GioHang gh where gh.khachHang.id = ?1")
    GioHang findByIdKH(UUID id);

    @Query("select count(gh.ma) from GioHang gh")
    int soLuongGioHang();
}
