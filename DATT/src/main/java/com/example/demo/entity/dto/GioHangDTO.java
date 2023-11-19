package com.example.demo.entity.dto;

import com.example.demo.entity.khachhang.GioHangChiTiet;
import com.example.demo.entity.khachhang.HoaDonChiTiet;
import com.example.demo.entity.sanpham.AoChiTiet;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class GioHangDTO {

    AoChiTiet aoChiTiet;

    int gia;

    GioHangChiTiet gioHangChiTiet;

    HoaDonChiTiet hoaDonChiTiet;
}
