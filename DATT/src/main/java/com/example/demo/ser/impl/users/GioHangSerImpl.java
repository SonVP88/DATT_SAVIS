package com.example.demo.ser.impl.users;

import com.example.demo.entity.khachhang.GioHang;
import com.example.demo.entity.sanpham.AoChiTiet;
import com.example.demo.repo.users.GioHangRepo;
import com.example.demo.ser.users.GioHangSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class GioHangSerImpl implements GioHangSer {
    @Autowired
    GioHangRepo gioHangRepo;

    @Override
    public List<AoChiTiet> findByIdAo(UUID id) {
        return gioHangRepo.findByIdAo(id);
    }

    @Override
    public GioHang findByIdKH(UUID id) {
        return gioHangRepo.findByIdKH(id);
    }

    @Override
    public void add(GioHang gioHang) {
        gioHangRepo.save(gioHang);
    }

    @Override
    public int soLuongGioHang() {
        return gioHangRepo.soLuongGioHang();
    }
}
