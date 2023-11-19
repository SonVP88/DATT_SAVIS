package com.example.demo.ser.giamgia;

import com.example.demo.entity.giamgia.GiamGiaSanPham;
import org.springframework.data.domain.Page;

import java.util.Date;
import java.util.List;
import java.util.UUID;

public interface GiamGiaSanPhamSer {

    List<GiamGiaSanPham> getAll();

    Page<GiamGiaSanPham> view(Integer pageNo, Integer size);

    void add(GiamGiaSanPham giamGiaSanPham);

    void update(UUID id, GiamGiaSanPham update);

    GiamGiaSanPham findId(UUID id);

    GiamGiaSanPham findByTen(String ten);

    Page<GiamGiaSanPham> searchTen(String ten, Integer pageNo, Integer size);

    Page<GiamGiaSanPham> loc(Date ngayBatDau, Date ngayKetThuc, Integer pageNo, Integer size);

    List<GiamGiaSanPham> findTop2GiamGiaSanPham();
}
