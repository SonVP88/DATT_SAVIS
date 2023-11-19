package com.example.demo.ser.impl.sanpham;

import com.example.demo.entity.sanpham.MauSac;
import com.example.demo.repo.sanpham.MauSacRepo;
import com.example.demo.ser.sanpham.MauSacSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class MauSacSerImpl implements MauSacSer {

    @Autowired
    MauSacRepo mauSacRepo;


    @Override
    public List<MauSac> getAll() {
        return mauSacRepo.findAll();
    }

    @Override
    public List<MauSac> findAllByTrangThai(Integer trangThai) {
        return mauSacRepo.findAllByTrangThai(trangThai);
    }

    @Override
    public MauSac findById(UUID id) {
        return mauSacRepo.findById(id).orElse(null);
    }

    @Override
    public void add(MauSac mauSac) {
        mauSacRepo.save(mauSac);
    }

    @Override
    public void update(UUID id, MauSac updateMS) {
        MauSac mauSac = mauSacRepo.findById(id).orElse(null);
        mauSac.setMa(updateMS.getMa());
        mauSac.setTen(updateMS.getTen());
        mauSac.setTrangthai(updateMS.getTrangthai());
        mauSacRepo.save(mauSac);
    }
}
