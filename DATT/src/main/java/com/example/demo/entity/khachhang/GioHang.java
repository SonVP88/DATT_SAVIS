package com.example.demo.entity.khachhang;

import com.example.demo.entity.khachhang.Users;
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

import java.util.Date;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "GioHang")
public class GioHang {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Id")
    UUID id;

    @Column(name = "Ma")
    private String ma;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdKhachHang",referencedColumnName = "Id")
    Users khachHang;

    @Column(name = "NgayTao")
    Date ngayTao;

    @Column(name = "TrangThai")
    private int trangThai;
}
