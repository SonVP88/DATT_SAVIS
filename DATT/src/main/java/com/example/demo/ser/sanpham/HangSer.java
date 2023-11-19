package com.example.demo.ser.sanpham;

import com.example.demo.entity.sanpham.Hang;

import java.util.List;
import java.util.UUID;

public interface HangSer {

    List<Hang> getAll();

    Hang findById(UUID id);

    List<Hang> findAllByTrangThai(Integer trangThai);

    void add(Hang hang);

    void update(UUID id, Hang updateHang);
}
