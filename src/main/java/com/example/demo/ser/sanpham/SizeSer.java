package com.example.demo.ser.sanpham;

import com.example.demo.entity.sanpham.Size;

import java.util.List;
import java.util.UUID;

public interface SizeSer {

    List<Size> getAll();

    List<Size> findAllByTrangThai(Integer trangThai);

    Size findById(UUID id);

    void add(Size size);

    void update(UUID id, Size updateSize);
}
