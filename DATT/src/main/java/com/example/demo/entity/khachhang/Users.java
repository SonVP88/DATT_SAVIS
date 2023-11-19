package com.example.demo.entity.khachhang;

import com.example.demo.entity.auth.RoleEnum;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
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
@Table(name = "Users")
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Id")
    UUID id;

    @Column(name = "Ma")
    private String ma;

    @Column(name = "Ten")
    private String ten;

    @Column(name = "GioiTinh")
    private String gioiTinh;

    @Column(name = "NgaySinh")
    private String ngay_sinh;

    @Column(name = "DiaChi")
    private String dia_chi;

    @Column(name = "ThanhPho")
    private String thanh_pho;

    @Column(name = "QuocGia")
    private String quoc_gia;

    @Column(name = "SDT")
    private String sdt;

    @Column(name = "Email")
    private String email;

    @Column(name = "MatKhau")
    private String matKhau;

    @Enumerated(EnumType.STRING)
    RoleEnum role;

    @Column(name = "TrangThai")
    private int trangThai;
}
