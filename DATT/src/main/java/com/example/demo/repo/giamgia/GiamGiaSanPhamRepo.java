package com.example.demo.repo.giamgia;

import com.example.demo.entity.giamgia.GiamGiaSanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Repository
public interface GiamGiaSanPhamRepo extends JpaRepository<GiamGiaSanPham, UUID> {

    Page<GiamGiaSanPham> findByTen(String ten, Pageable pageable);

    @Query("SELECT g FROM GiamGiaSanPham g WHERE g.ngayBatDau >= ?1 AND g.ngayKetThuc <= ?2")
    Page<GiamGiaSanPham> findByNgayBatDauAndNgayKetThuc(Date ngayBatDau, Date ngayKetThuc, Pageable pageable);

    @Query("SELECT g FROM GiamGiaSanPham g WHERE g.ngayBatDau >= ?1")
    Page<GiamGiaSanPham> findByNgayBatDau(Date ngayBatDau, Pageable pageable);

    @Query("SELECT g FROM GiamGiaSanPham g WHERE g.ngayKetThuc <= ?1")
    Page<GiamGiaSanPham> findByNgayKetThuc(Date ngayKetThuc, Pageable pageable);

    GiamGiaSanPham findByTen(String ten);

    @Query(value = "select top 2 gg.Id from ChuongTrinhGiamGiaSanPham gg where gg.TrangThai = 0 order by gg.PhanTramGiam desc ",nativeQuery = true)
    List<UUID> findTop2GiamGiaSanPham();

    @Query("select gg from GiamGiaSanPham gg where gg.trangThai = 0")
    List<GiamGiaSanPham> findAllByTrangThai();
}
