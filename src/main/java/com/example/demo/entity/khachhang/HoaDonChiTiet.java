package com.example.demo.entity.khachhang;

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

import java.math.BigDecimal;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "HoaDonChiTiet")
public class HoaDonChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Id")
    UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdHoaDon",referencedColumnName = "Id")
    HoaDon hoaDon;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdAoChiTiet",referencedColumnName = "Id")
    AoChiTiet aoChiTiet;

    @Column(name = "SoLuong")
    int soLuong;

    @Column(name = "DonGia")
    BigDecimal donGia;

    @Column(name = "TrangThai")
    int trangThai;
}
