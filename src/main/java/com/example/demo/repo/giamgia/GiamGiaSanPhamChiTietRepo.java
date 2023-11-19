package com.example.demo.repo.giamgia;

import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface GiamGiaSanPhamChiTietRepo extends JpaRepository<GiamGiaSanPhamChiTiet, UUID> {

    @Query("select gg from GiamGiaSanPhamChiTiet gg where gg.trangThai = ?1")
    List<GiamGiaSanPhamChiTiet> findAllByTrangThai(Integer trangThai);

    @Query("select gg from GiamGiaSanPhamChiTiet gg where gg.ao.id = ?1 and gg.trangThai = 0")
    GiamGiaSanPhamChiTiet findByIdAoAndTrangThai(UUID id);

    @Query("select gg from GiamGiaSanPhamChiTiet gg where gg.giamGiaSanPham.id = ?1")
    List<GiamGiaSanPhamChiTiet> findAllByGiamGiaSP(UUID id);
}
