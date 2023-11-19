package com.example.demo.ser.impl.sanpham;

import com.example.demo.entity.sanpham.LoaiAo;
import com.example.demo.repo.sanpham.LoaiAoRepo;
import com.example.demo.ser.sanpham.LoaiAoSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class LoaiAoSerImpl implements LoaiAoSer {

    @Autowired
    LoaiAoRepo loaiAoRepo;

    @Override
    public List<LoaiAo> getAll() {
        return loaiAoRepo.findAll();
    }

    @Override
    public void add(LoaiAo loai_ao) {
        loaiAoRepo.save(loai_ao);
    }

    @Override
    public void update(UUID id, LoaiAo updateLA) {
        LoaiAo loaiAo = loaiAoRepo.findById(id).orElse(null);
        loaiAo.setMa(updateLA.getMa());
        loaiAo.setTen(updateLA.getTen());
        loaiAo.setTenURL(updateLA.getTenURL());
        loaiAo.setTrangthai(updateLA.getTrangthai());
        loaiAoRepo.save(loaiAo);
    }

    @Override
    public LoaiAo findById(UUID id) {
        return loaiAoRepo.findById(id).orElse(null);
    }

    @Override
    public List<LoaiAo> findAllByTrangThai(Integer trangThai) {
        return loaiAoRepo.findAllByTrangThai(trangThai);
    }

    @Override
    public LoaiAo findByMa(String ma) {
        return loaiAoRepo.findByMa(ma);
    }
}
