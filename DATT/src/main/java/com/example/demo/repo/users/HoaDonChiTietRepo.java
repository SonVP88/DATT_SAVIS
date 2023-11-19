package com.example.demo.repo.users;

import com.example.demo.entity.khachhang.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Repository
public interface HoaDonChiTietRepo extends JpaRepository<HoaDonChiTiet, UUID> {
    @Query("select hdct from HoaDonChiTiet hdct where hdct.hoaDon.id = ?1")
    List<HoaDonChiTiet> findByHoaDon(UUID id);

    @Query("select sum(hdct.soLuong) from HoaDonChiTiet hdct where (CAST(hdct.hoaDon.ngayHoanThanh AS DATE) = ?1 and hdct.hoaDon.trangThai = 3)")
    int soLuongBanTheoNgayThanhToan(LocalDate ngayHoanThanh);

    @Query(value = "select sum(hdct.SoLuong) from HoaDonChiTiet hdct join HoaDon hd on hdct.IdHoaDon = hd.Id where hd.TrangThai = 3 and Cast(hd.NgayHoanThanh as date) = ?1",nativeQuery = true)
    Integer soLuongBanTheoNgay(LocalDate date);

    @Query("SELECT sum(hdct.soLuong)\n" +
            "FROM HoaDonChiTiet hdct\n" +
            "WHERE  CAST(hdct.hoaDon.ngayThanhToan AS DATE) >= ?1 AND CAST(hdct.hoaDon.ngayThanhToan AS DATE) <= ?2\n" +
            "GROUP BY DATEPART(month , CAST(hdct.hoaDon.ngayThanhToan AS DATE)), DATEPART(year , CAST(hdct.hoaDon.ngayThanhToan AS DATE))\n" +
            "ORDER BY DATEPART(month , CAST(hdct.hoaDon.ngayThanhToan AS DATE)), DATEPART(year , CAST(hdct.hoaDon.ngayThanhToan AS DATE))")
    List<Integer> soLuongBanTheoThang(LocalDate date1, LocalDate date2);

    @Query("SELECT sum(hdct.soLuong)\n" +
            "FROM HoaDonChiTiet hdct\n" +
            "WHERE  CAST(hdct.hoaDon.ngayThanhToan AS DATE) >= ?1 AND CAST(hdct.hoaDon.ngayThanhToan AS DATE) <= ?2\n" +
            "GROUP BY DATEPART(month , CAST(hdct.hoaDon.ngayThanhToan AS DATE)), DATEPART(year , CAST(hdct.hoaDon.ngayThanhToan AS DATE))\n" +
            "ORDER BY DATEPART(month , CAST(hdct.hoaDon.ngayThanhToan AS DATE)), DATEPART(year , CAST(hdct.hoaDon.ngayThanhToan AS DATE))")
    Integer soLuongBanThangHienTai(LocalDate date1, LocalDate date2);

    @Query("select count(hdct.id) from HoaDonChiTiet hdct where hdct.hoaDon.id = ?1")
    int soLuongHoaDonCHiTietByHoaDon(UUID id);

    @Query("select hdct from HoaDonChiTiet hdct where hdct.hoaDon.id = ?1 and hdct.aoChiTiet.id = ?2")
    HoaDonChiTiet findByHoaDonAndAoChiTiet(UUID idHoaDon, UUID idACT);

    @Query("SELECT sum (hdct.soLuong) FROM HoaDonChiTiet hdct " +
            "WHERE MONTH(hdct.hoaDon.ngayThanhToan) = MONTH(:currentDate) " +
            "AND YEAR(hdct.hoaDon.ngayThanhToan) = YEAR(:currentDate)")
    Integer soLuongBanTrongThang(@Param("currentDate") LocalDate currentDate);
}
