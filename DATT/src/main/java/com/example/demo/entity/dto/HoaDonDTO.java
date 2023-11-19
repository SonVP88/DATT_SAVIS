package com.example.demo.entity.dto;

import com.example.demo.entity.khachhang.HoaDon;
import com.example.demo.entity.khachhang.HoaDonChiTiet;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.entity.sanpham.AoChiTiet;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HoaDonDTO {

    HoaDon hoaDon;

    List<HoaDonChiTiet> hoaDonChiTiets;

    int donGia;

    HoaDonChiTiet hoaDonChiTiet;

    Users user;

    int gia;

    AoChiTiet aoChiTiet;
}
