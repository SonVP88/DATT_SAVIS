package com.example.demo.entity.dto;

import com.example.demo.entity.khachhang.HoaDon;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DonHangDTO {

    HoaDon hoaDon;

    int soLuong;

    String ten;
}
