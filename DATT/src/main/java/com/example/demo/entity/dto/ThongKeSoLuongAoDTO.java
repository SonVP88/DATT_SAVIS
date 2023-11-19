package com.example.demo.entity.dto;

import com.example.demo.entity.sanpham.LoaiAo;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ThongKeSoLuongAoDTO {

    LoaiAo loaiAo;

    int slBan;

    int slTon;
}
