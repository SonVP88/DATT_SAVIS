package com.example.demo.repo.giamgia;

import com.example.demo.entity.giamgia.GiamGiaHoaDon;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Repository
public interface GiamGiaHoaDonRepo extends JpaRepository<GiamGiaHoaDon, UUID> {

    Page<GiamGiaHoaDon> findByTen(String ten, Pageable pageable);

    @Query("SELECT g FROM GiamGiaHoaDon g WHERE g.ngayBatDau >= ?1 AND g.ngayKetThuc <= ?2")
    Page<GiamGiaHoaDon> findByNgayBatDauAndNgayKetThuc(Date ngayBatDau, Date ngayKetThuc, Pageable pageable);

    @Query("SELECT g FROM GiamGiaHoaDon g WHERE g.ngayBatDau >= ?1")
    Page<GiamGiaHoaDon> findByNgayBatDau(Date ngayBatDau, Pageable pageable);

    @Query("SELECT g FROM GiamGiaHoaDon g WHERE g.ngayKetThuc <= ?1")
    Page<GiamGiaHoaDon> findByNgayKetThuc(Date ngayKetThuc, Pageable pageable);

    @Query("SELECT g FROM GiamGiaHoaDon g WHERE g.trangThai = ?1")
    List<GiamGiaHoaDon> findByTrangThai(int trangThai);

    @Query("SELECT hd FROM GiamGiaHoaDon hd WHERE hd.soLuongSanPham <= ?1 and hd.soTienHoaDon <= ?2")
    List<GiamGiaHoaDon> findBySlandTt(int sl, BigDecimal tt);
}
