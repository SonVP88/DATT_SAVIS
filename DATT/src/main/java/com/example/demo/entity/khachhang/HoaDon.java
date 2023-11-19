package com.example.demo.entity.khachhang;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "HoaDon")
public class HoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Id")
    UUID id;

    @Column(name = "Ma")
    String ma;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdNhanVien",referencedColumnName = "Id")
    Users nhanVien;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdKhachHang",referencedColumnName = "Id")
    Users khachHang;

    @Column(name = "NgayTao")
    LocalDateTime ngayTao;

    @Column(name = "NgayChoXacNhan")
    LocalDateTime ngayChoXacNhan;

    @Column(name = "NgayXacNhan")
    LocalDateTime ngayXacNhan;

    @Column(name = "NgayHoanThanh")
    LocalDateTime ngayHoanThanh;

    @Column(name = "NgayHuy")
    LocalDateTime ngayHuy;

    @Column(name = "NgayThanhToan")
    LocalDateTime ngayThanhToan;

    @Column(name = "MoTa")
    String moTa;

    @Column(name = "GhiChu")
    String ghiChu;

    @Column(name = "TongTien")
    BigDecimal tongTien;

    @Column(name = "HinhThuc")
    int hinhThuc;

    @Column(name = "TrangThai")
    int trangThai;
}
