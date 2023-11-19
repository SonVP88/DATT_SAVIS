package com.example.demo.ser.impl.giamgia;

import com.example.demo.entity.giamgia.GiamGiaSanPham;
import com.example.demo.repo.giamgia.GiamGiaSanPhamRepo;
import com.example.demo.ser.giamgia.GiamGiaSanPhamSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class GiamGiaSanPhamSerImpl implements GiamGiaSanPhamSer {

    @Autowired
    GiamGiaSanPhamRepo giamGiaSanPhamRepo;

    @Override
    public List<GiamGiaSanPham> getAll() {
        return giamGiaSanPhamRepo.findAllByTrangThai();
    }

    @Override
    public Page<GiamGiaSanPham> view(Integer pageNo, Integer size) {
        Pageable pageable = PageRequest.of(pageNo, size);
        return giamGiaSanPhamRepo.findAll(pageable);
    }

    @Override
    public void add(GiamGiaSanPham giamGiaSanPham) {
        giamGiaSanPhamRepo.save(giamGiaSanPham);
    }

    @Override
    public void update(UUID id, GiamGiaSanPham update) {
        Optional<GiamGiaSanPham> optionalGiamGiaSanPham = giamGiaSanPhamRepo.findById(id);
        if (optionalGiamGiaSanPham.isPresent()) {
            GiamGiaSanPham giamGiaSanPham = optionalGiamGiaSanPham.get();
            giamGiaSanPham.setMa(update.getMa());
            giamGiaSanPham.setTen(update.getTen());
            giamGiaSanPham.setPhanTramGiam(update.getPhanTramGiam());
            giamGiaSanPham.setNgayBatDau(update.getNgayBatDau());
            giamGiaSanPham.setNgayKetThuc(update.getNgayKetThuc());
            giamGiaSanPham.setTrangThai(update.getTrangThai());
            giamGiaSanPhamRepo.save(giamGiaSanPham);
        }
    }

    @Override
    public GiamGiaSanPham findId(UUID id) {
        Optional<GiamGiaSanPham> optionalGiamGiaSanPham = giamGiaSanPhamRepo.findById(id);
        return optionalGiamGiaSanPham.orElse(null);
    }

    @Override
    public GiamGiaSanPham findByTen(String ten) {
        return giamGiaSanPhamRepo.findByTen(ten);
    }

    @Override
    public Page<GiamGiaSanPham> searchTen(String ten, Integer pageNo, Integer size) {
        Pageable pageable = PageRequest.of(pageNo, size);
        return giamGiaSanPhamRepo.findByTen(ten, pageable);
    }

    @Override
    public Page<GiamGiaSanPham> loc(Date ngayBatDau, Date ngayKetThuc, Integer pageNo, Integer size) {
        Pageable pageable = PageRequest.of(pageNo, size);

        if (ngayBatDau == null && ngayKetThuc == null) {
            return giamGiaSanPhamRepo.findAll(pageable);
        } else if (ngayBatDau != null && ngayKetThuc == null) {
            return giamGiaSanPhamRepo.findByNgayBatDau(ngayBatDau, pageable);
        } else if (ngayBatDau == null && ngayKetThuc != null) {
            return giamGiaSanPhamRepo.findByNgayKetThuc(ngayKetThuc, pageable);
        } else {
            return giamGiaSanPhamRepo.findByNgayBatDauAndNgayKetThuc(ngayBatDau, ngayKetThuc, pageable);
        }
    }

    @Override
    public List<GiamGiaSanPham> findTop2GiamGiaSanPham() {
        List<UUID> top2UUID = giamGiaSanPhamRepo.findTop2GiamGiaSanPham();
        return giamGiaSanPhamRepo.findAllById(top2UUID);
    }

}
