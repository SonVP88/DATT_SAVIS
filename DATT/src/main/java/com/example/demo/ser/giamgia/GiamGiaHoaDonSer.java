package com.example.demo.ser.giamgia;

import com.example.demo.entity.giamgia.GiamGiaHoaDon;
import org.springframework.data.domain.Page;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public interface GiamGiaHoaDonSer {

    List<GiamGiaHoaDon> getAll();

    Page<GiamGiaHoaDon> view(Integer pageNo, Integer size);

    void add(GiamGiaHoaDon giamGiaHoaDon);

    void update(UUID id, GiamGiaHoaDon update);

    GiamGiaHoaDon findId(UUID id);

    Page<GiamGiaHoaDon> searchTen(String ten, Integer pageNo, Integer size);

    Page<GiamGiaHoaDon> loc(Date ngayBatDau, Date ngayKetThuc, Integer pageNo, Integer size);

    List<GiamGiaHoaDon> findByTrangThai(int trangThai);

    List<GiamGiaHoaDon> findBySlandTt(int sl, BigDecimal tt);
}
