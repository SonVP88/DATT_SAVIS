package com.example.demo.ser.giamgia;

import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;

import java.util.List;
import java.util.UUID;

public interface GiamGiaSanPhamChiTietSer {

    List<GiamGiaSanPhamChiTiet> getAll();

    void add(GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet);

    List<GiamGiaSanPhamChiTiet> findAllByTrangThai(Integer trangThai);

    GiamGiaSanPhamChiTiet findByIdAoAndTrangThai(UUID id);

    List<GiamGiaSanPhamChiTiet> findAllByGiamGiaSP(UUID id);

    void update(UUID id, GiamGiaSanPhamChiTiet update);
}
