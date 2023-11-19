package com.example.demo.ser.sanpham;

import com.example.demo.entity.sanpham.MauSac;

import java.util.List;
import java.util.UUID;

public interface MauSacSer {

    List<MauSac> getAll();

    List<MauSac> findAllByTrangThai(Integer trangThai);

    MauSac findById(UUID id);

    void add(MauSac mauSac);

    void update(UUID id, MauSac updateMS);
}
