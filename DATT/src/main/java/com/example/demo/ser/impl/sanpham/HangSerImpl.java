package com.example.demo.ser.impl.sanpham;

import com.example.demo.entity.sanpham.Hang;
import com.example.demo.repo.sanpham.HangRepo;
import com.example.demo.ser.sanpham.HangSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class HangSerImpl implements HangSer {

    @Autowired
    HangRepo hangRepo;

    @Override
    public List<Hang> getAll() {
        return hangRepo.findAll();
    }

    @Override
    public Hang findById(UUID id) {
        return hangRepo.findById(id).orElse(null);
    }

    @Override
    public List<Hang> findAllByTrangThai(Integer trangThai) {
        return hangRepo.findAllByTrangThai(trangThai);
    }

    @Override
    public void add(Hang hang) {
        hangRepo.save(hang);
    }

    @Override
    public void update(UUID id, Hang updateHang) {
        Hang hang = hangRepo.findById(id).orElse(null);
        hang.setMa(updateHang.getMa());
        hang.setTen(updateHang.getTen());
        hang.setDiaChi(updateHang.getDiaChi());
        hang.setTrangthai(updateHang.getTrangthai());
        hangRepo.save(hang);
    }
}
