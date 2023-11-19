package com.example.demo.ser.impl.users;

import com.example.demo.entity.khachhang.DanhGia;
import com.example.demo.repo.users.DanhGiaRepo;
import com.example.demo.ser.users.DanhGiaSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class DanhGiaSerImpl implements DanhGiaSer {

    @Autowired
    DanhGiaRepo danhGiaRepo;

    @Override
    public void add(DanhGia danhGia) {
        danhGiaRepo.save(danhGia);
    }

    @Override
    public List<DanhGia> findAllByAo(UUID idAo) {
        return danhGiaRepo.findAllByAo(idAo);
    }

    @Override
    public Integer tongDanhGiaSao(UUID idAo) {
        return danhGiaRepo.tongDanhGiaSao(idAo);
    }

    @Override
    public int tongNguoiDanhGia(UUID idAo) {
        return danhGiaRepo.tongNguoiDanhGia(idAo);
    }
}
