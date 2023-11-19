package com.example.demo.ser.sanpham;

import com.example.demo.entity.sanpham.HuongDanBaoQuan;

import java.util.List;
import java.util.UUID;

public interface HuongDanBaoQuanSer {

    List<HuongDanBaoQuan> getAll();

    void add(HuongDanBaoQuan huong_dan_bao_quan);

    void update(UUID id, HuongDanBaoQuan updateHDBQ);

    HuongDanBaoQuan findById(UUID id);

    List<HuongDanBaoQuan> findByAllByTrangThai(Integer trangThai);
}
