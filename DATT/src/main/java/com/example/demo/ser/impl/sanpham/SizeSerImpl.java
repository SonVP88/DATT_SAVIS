package com.example.demo.ser.impl.sanpham;

import com.example.demo.entity.sanpham.Size;
import com.example.demo.repo.sanpham.SizeRepo;
import com.example.demo.ser.sanpham.SizeSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class SizeSerImpl implements SizeSer {

    @Autowired
    SizeRepo sizeRepo;

    @Override
    public List<Size> getAll() {
        return sizeRepo.findAll();
    }

    @Override
    public List<Size> findAllByTrangThai(Integer trangThai) {
        return sizeRepo.findAllByTrangThai(trangThai);
    }

    @Override
    public Size findById(UUID id) {
        return sizeRepo.findById(id).orElse(null);
    }

    @Override
    public void add(Size size) {
        sizeRepo.save(size);
    }

    @Override
    public void update(UUID id, Size updateSize) {
        Size size = sizeRepo.findById(id).orElse(null);
        size.setMa(updateSize.getMa());
        size.setTen(updateSize.getTen());
        size.setTrangthai(updateSize.getTrangthai());
        sizeRepo.save(size);
    }
}
