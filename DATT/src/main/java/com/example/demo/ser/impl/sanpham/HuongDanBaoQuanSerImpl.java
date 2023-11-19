package com.example.demo.ser.impl.sanpham;

import com.example.demo.entity.sanpham.HuongDanBaoQuan;
import com.example.demo.repo.sanpham.HuongDanBaoQuanRepo;
import com.example.demo.ser.sanpham.HuongDanBaoQuanSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class HuongDanBaoQuanSerImpl implements HuongDanBaoQuanSer {

    @Autowired
    HuongDanBaoQuanRepo huongDanBaoQuanRepo;

    @Override
    public List<HuongDanBaoQuan> getAll() {
        return huongDanBaoQuanRepo.findAll();
    }

    @Override
    public void add(HuongDanBaoQuan huong_dan_bao_quan) {
        huongDanBaoQuanRepo.save(huong_dan_bao_quan);
    }

    @Override
    public void update(UUID id, HuongDanBaoQuan updateHDBQ) {
        HuongDanBaoQuan huong_dan_bao_quan = huongDanBaoQuanRepo.findById(id).orElse(null);
        huong_dan_bao_quan.setMa(updateHDBQ.getMa());
        huong_dan_bao_quan.setTen(updateHDBQ.getTen());
        huong_dan_bao_quan.setChitiet(updateHDBQ.getChitiet());
        huong_dan_bao_quan.setTrangthai(updateHDBQ.getTrangthai());
        huongDanBaoQuanRepo.save(huong_dan_bao_quan);
    }

    @Override
    public HuongDanBaoQuan findById(UUID id) {
        return huongDanBaoQuanRepo.findById(id).orElse(null);
    }

    @Override
    public List<HuongDanBaoQuan> findByAllByTrangThai(Integer trangThai) {
        return huongDanBaoQuanRepo.findByAllByTrangThai(trangThai);
    }
}
