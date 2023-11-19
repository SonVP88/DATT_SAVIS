package com.example.demo.entity.giamgia;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "ChuongTrinhGiamGiaSanPham")
public class GiamGiaSanPham {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Id")
    UUID id;

    @Column(name = "Ma")
    String ma;

    @Column(name = "Ten")
    String ten;

    @Column(name = "PhanTramGiam")
    int phanTramGiam;

    @Column(name = "NgayBatDau")
    Date ngayBatDau;

    @Column(name = "NgayKetThuc")
    Date ngayKetThuc;

    @Column(name = "TrangThai")
    int trangThai;
}
