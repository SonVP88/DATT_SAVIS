package com.example.demo.repo.users;

import com.example.demo.entity.khachhang.HoaDon;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Repository
public interface HoaDonRepo extends JpaRepository<HoaDon, UUID> {

    @Query("select sum(hdct.soLuong) from HoaDonChiTiet hdct where hdct.hoaDon.id = ?1")
    Long tongSl(UUID id);

    @Query("select count(hd.id) from HoaDon hd")
    Integer demHoaDon();

    @Query("select hd from HoaDon hd where hd.khachHang.id = ?1 and hd.trangThai = ?2")
    Page<HoaDon> listHoaDonFindByKhAndTrangThai(UUID idKh, int trangThai, Pageable pageable);

    @Query("select hd from HoaDon hd where hd.trangThai = ?1")
    Page<HoaDon> listHoaDonFindByTrangThai(int trangThai, Pageable pageable);

    @Query("select hd from HoaDon hd where hd.khachHang.id = ?1 and hd.trangThai = ?2 order by hd.ngayTao DESC")
    List<HoaDon> findByUserAndTrangThai(UUID id, int trangThai);

    @Query("select hd from HoaDon hd where hd.ma = ?1")
    HoaDon findByMa(String ma);

    @Query("SELECT distinct cast(hd.ngayHoanThanh as date)  FROM HoaDon hd WHERE cast(hd.ngayHoanThanh as date) IS NOT NULL ORDER BY CAST(hd.ngayHoanThanh AS date) desc ")
    List<Object[]> listNgayThanhToanHoanThanh();

    @Query("select count(hd.ma) from HoaDon hd where CAST(hd.ngayChoXacNhan AS DATE) = ?1 and hd.trangThai = ?2")
    int soLuongHoaDonTheoNgayandTrangThai(LocalDate date, int trangThai);

    @Query("select count(hd.ma) from HoaDon hd where CAST(hd.ngayHoanThanh AS DATE)  = ?1")
    int soLuongHoaDonHoanThanhTheoNgay(LocalDate date);

    @Query("SELECT COUNT(hd.ma) FROM HoaDon hd WHERE  CAST(hd.ngayXacNhan AS DATE) <= ?1 AND hd.trangThai = 2")
    int countHoaDonDangGiaoByNgayHienTai(LocalDate date);

    @Query("SELECT COUNT(hd.ma) FROM HoaDon hd WHERE  CAST(hd.ngayHuy AS DATE) = ?1 AND hd.trangThai = 4")
    int countHoaDonHuyByNgayHienTai(LocalDate date);

    @Query("SELECT hd FROM HoaDon hd WHERE CAST(hd.ngayChoXacNhan AS date) = ?1 or CAST(hd.ngayXacNhan AS date) = ?1 or CAST(hd.ngayHoanThanh AS date) = ?1 or CAST(hd.ngayHuy AS date) = ?1  order by hd.ngayTao DESC")
    Page<HoaDon> listHoaDonTheoNgay(LocalDate date, Pageable pageable);

    @Query(value = "select * from HoaDon where TrangThai = 1 or TrangThai = 2 or TrangThai = 3 or TrangThai = 4 order by NgayTao DESC", nativeQuery = true)
    List<HoaDon> findAllByOrderByNgayTaoDesc();

    @Query("select sum(hd.tongTien) from HoaDon hd where cast(hd.ngayThanhToan as date)  = ?1")
    Double doanhThuTheoNgay(LocalDate date);

    @Query("SELECT COUNT(DISTINCT  hd.khachHang) FROM HoaDon hd\n" +
            "WHERE cast(hd.ngayThanhToan as date)  = ?1")
    Integer soLuongKhachMuaTheoNgay(LocalDate date);

    @Query("SELECT  sum(hd.tongTien) " +
            "FROM HoaDon hd " +
            "WHERE cast(hd.ngayThanhToan as date) >= ?1 AND cast(hd.ngayThanhToan as date) <= ?2 " +
            "And hd.trangThai = 3" +
            "GROUP BY DATEPART(MONTH, cast(hd.ngayThanhToan as date) ), DATEPART(YEAR, cast(hd.ngayThanhToan as date)) " +
            "ORDER BY DATEPART(YEAR, cast(hd.ngayThanhToan as date)), DATEPART(MONTH, cast(hd.ngayThanhToan as date))")
    List<Double> doanhThuTheoThang(LocalDate date1, LocalDate date2);

    @Query("SELECT DATEPART(MONTH, hd.ngayThanhToan)  " +
            "FROM HoaDon hd " +
            "WHERE cast(hd.ngayThanhToan as date) >= ?1 AND cast(hd.ngayThanhToan as date) <= ?2 " +
            "And hd.trangThai = 3" +
            "GROUP BY DATEPART(MONTH, hd.ngayThanhToan), DATEPART(YEAR, hd.ngayThanhToan) " +
            "ORDER BY DATEPART(YEAR, hd.ngayThanhToan), DATEPART(MONTH, hd.ngayThanhToan)")
    List<Integer> getDataThang(LocalDate date1, LocalDate date2);

    @Query("select hd from HoaDon hd where cast(hd.ngayChoXacNhan as date) = ?1 and hd.trangThai = 1")
    List<HoaDon> listHoaDonByNgayChoXacNhan(LocalDate localDate);

    @Query("select hd from HoaDon hd where cast(hd.ngayXacNhan as date) <= ?1 and hd.trangThai = 2")
    List<HoaDon> listHoaDonByNgayDangGiao(LocalDate localDate);

    @Query("select hd from HoaDon hd where cast(hd.ngayHoanThanh as date) = ?1 and hd.trangThai = 3")
    List<HoaDon> listHoaDonByNgayHoanThanh(LocalDate localDate);

    @Query("select hd from HoaDon hd where cast(hd.ngayHuy as date) = ?1 and hd.trangThai = 4")
    List<HoaDon> listHoaDonByNgayHuy(LocalDate localDate);

    @Query("SELECT  sum(hd.tongTien) " +
            "FROM HoaDon hd " +
            "WHERE cast(hd.ngayThanhToan as date) >= ?1 AND cast(hd.ngayThanhToan as date) <= ?2 " +
            "And hd.trangThai = 3" +
            "GROUP BY DATEPART(MONTH, cast(hd.ngayThanhToan as date) ), DATEPART(YEAR, cast(hd.ngayThanhToan as date)) " +
            "ORDER BY DATEPART(YEAR, cast(hd.ngayThanhToan as date)), DATEPART(MONTH, cast(hd.ngayThanhToan as date))")
    Double doanhThuThangHienTai(LocalDate date1, LocalDate date2);

    @Query("select sum(hd.tongTien) from HoaDon hd where month(hd.ngayHoanThanh) = ?1 and year(hd.ngayHoanThanh) = ?2 and hd.trangThai = 3")
    BigDecimal tongTienTheoThangNam(int month, int year);

    @Query("select sum(hd.tongTien) from HoaDon hd where month(hd.ngayHuy) = ?1 and year(hd.ngayHuy) = ?2 and hd.trangThai = 4")
    BigDecimal tongTienHuyTheoThangNam(int month, int year);

    @Query("select count(hd.id) from HoaDon hd where month(hd.ngayHoanThanh) = ?1 and year(hd.ngayHoanThanh) = ?2 and hd.trangThai = 3")
    int soDonHoanThanh(int month, int year);

    @Query("select count(hd.id) from HoaDon hd where month(hd.ngayHuy) = ?1 and year(hd.ngayHuy) = ?2 and hd.trangThai = 4")
    int soDonHuy(int month, int year);

    @Query(value = "SELECT DISTINCT YEAR(NgayTao) AS Nam\n" +
            "FROM HoaDon;", nativeQuery = true)
    List<String> listYearByHoaDon();

    @Query("select hd from HoaDon hd where hd.trangThai = ?1")
    List<HoaDon> listHoaDonFindByTrangThaiCho(int trangThai);

    @Query("SELECT COUNT(*) FROM HoaDon hd " +
            "WHERE MONTH(hd.ngayThanhToan) = MONTH(:currentDate) " +
            "AND YEAR(hd.ngayThanhToan) = YEAR(:currentDate)" +
            "And hd.trangThai = 3")
    Integer soHoaDonTrongThang(@Param("currentDate") LocalDate currentDate);

    @Query("SELECT SUM(hd.tongTien) FROM HoaDon hd " +
            "WHERE MONTH(hd.ngayThanhToan) = MONTH(:date) " +
            "AND YEAR(hd.ngayThanhToan) = YEAR(:date) And hd.trangThai = 3")
    Double doanhThuThang(@Param("date") LocalDate date1);

    @Query("SELECT COUNT(DISTINCT hd.khachHang.id) FROM HoaDon hd " +
            "WHERE MONTH(hd.ngayThanhToan) = MONTH(:currentDate) " +
            "AND YEAR(hd.ngayThanhToan) = YEAR(:currentDate)")
    Integer soLuongKhachMuaTrongThang(@Param("currentDate") LocalDate currentDate);

    @Query("SELECT hd FROM HoaDon hd WHERE " +
            "(:trangThai IS NULL OR hd.trangThai = :trangThai) " +
            "AND (:startDate IS NULL OR cast(hd.ngayTao as date)  >= :startDate) " +
            "AND (:endDate IS NULL OR cast(hd.ngayTao as date) <= :endDate) order by hd.ngayTao DESC")
    List<HoaDon> findAllByOptionalFilters(
            @Param("trangThai") Integer trangThai,
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate
    );

    @Query(value = "SELECT * FROM HoaDon WHERE cast(NgayTao as date)  >= ?1 and cast(NgayTao as date)  <= ?2 AND TrangThai IN (1, 2, 3, 4) order by NgayTao DESC", nativeQuery = true)
    List<HoaDon> findAllByStartDateAndEndDateOrBoth(LocalDate startDate, LocalDate endDate);

    @Query(value = "SELECT * FROM HoaDon WHERE NgayTao >= ?1 AND TrangThai IN (1, 2, 3, 4) order by NgayTao DESC", nativeQuery = true)
    List<HoaDon> findHoaDonByFilterStartNgayTao(LocalDate startDate);

    @Query(value = "SELECT * FROM HoaDon WHERE NgayTao <= ?1 AND TrangThai IN (1, 2, 3, 4) order by NgayTao DESC", nativeQuery = true)
    List<HoaDon> findHoaDonByFilterEndNgayTao(LocalDate endDate);
}
