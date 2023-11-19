package com.example.demo.entity.khachhang;

import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.sanpham.AoChiTiet;
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

import java.time.LocalDateTime;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "DanhGia")
public class DanhGia {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Id")
    UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdAoChiTiet", referencedColumnName = "Id")
    AoChiTiet aoChiTiet;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdNguoiDung", referencedColumnName = "Id")
    Users khachHang;

    @Column(name = "DanhGiaBinhLuan")
    String danhGiaBinhLuan;

    @Column(name = "UrlVideo")
    String urlVideo;

    @Column(name = "DanhGiaSao")
    int danhGiaSao;

    @Column(name = "NgayDanhGia")
    LocalDateTime ngayDanhGia;

    @Column(name = "TrangThai")
    int trangThai;
}
