package com.example.demo.ser.users;

import com.example.demo.entity.khachhang.DanhGia;

import java.util.List;
import java.util.UUID;

public interface DanhGiaSer {

    void add(DanhGia danhGia);

    List<DanhGia> findAllByAo(UUID idAo);

    Integer tongDanhGiaSao(UUID idAo);

    int tongNguoiDanhGia(UUID idAo);
}
