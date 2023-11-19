package com.example.demo.ser.sanpham;

import com.example.demo.entity.sanpham.LoaiAo;

import java.util.List;
import java.util.UUID;

public interface LoaiAoSer {

    List<LoaiAo> getAll();

    void add(LoaiAo loai_ao);

    void update(UUID id, LoaiAo updateLA);

    LoaiAo findById(UUID id);

    List<LoaiAo> findAllByTrangThai(Integer trangThai);

    LoaiAo findByMa(String ma);

}
