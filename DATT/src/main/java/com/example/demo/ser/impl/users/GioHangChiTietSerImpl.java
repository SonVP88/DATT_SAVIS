package com.example.demo.ser.impl.users;

import com.example.demo.entity.khachhang.GioHangChiTiet;
import com.example.demo.repo.users.GioHangChiTietRepo;
import com.example.demo.ser.users.GioHangChiTietSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class GioHangChiTietSerImpl implements GioHangChiTietSer {

    @Autowired
    GioHangChiTietRepo gioHangChiTietRepo;

    @Override
    public List<GioHangChiTiet> getAll() {
        return gioHangChiTietRepo.findAll();
    }

    @Override
    public void add(GioHangChiTiet gioHangChiTiet) {
        gioHangChiTietRepo.save(gioHangChiTiet);
    }

    @Override
    public List<GioHangChiTiet> view(UUID idGH) {
        return gioHangChiTietRepo.findByIdGH(idGH);
    }

    @Override
    public void update(UUID id, GioHangChiTiet update) {
        Optional<GioHangChiTiet> optionalGioHangChiTiet = gioHangChiTietRepo.findById(id);
        if (!optionalGioHangChiTiet.isPresent()) {
            throw new RuntimeException("...,");
        }

        GioHangChiTiet gioHangChiTiet = optionalGioHangChiTiet.get();
        gioHangChiTiet.setGioHang(update.getGioHang());
        gioHangChiTiet.setAoChiTiet(update.getAoChiTiet());
        gioHangChiTiet.setSoLuong(update.getSoLuong());
        gioHangChiTiet.setDonGia(update.getDonGia());
        gioHangChiTiet.setTrangThai(update.getTrangThai());
        gioHangChiTietRepo.save(gioHangChiTiet);
    }

    @Override
    public GioHangChiTiet findById(UUID id) {
        Optional<GioHangChiTiet> optionalGioHangChiTiet = gioHangChiTietRepo.findById(id);
        return optionalGioHangChiTiet.orElse(null);
    }

    @Override
    public Long soLuongSanPhamGioHang(UUID id) {
        return gioHangChiTietRepo.soLuongSanPhamGioHang(id);
    }

    @Override
    public void delete(UUID id) {
        gioHangChiTietRepo.deleteById(id);
    }

    @Override
    public GioHangChiTiet findByKhachHangAndAoChiTiet(UUID idKh, UUID idAoChiTiet) {
        return gioHangChiTietRepo.findByKhachHangAndAoChiTiet(idKh, idAoChiTiet);
    }
}
