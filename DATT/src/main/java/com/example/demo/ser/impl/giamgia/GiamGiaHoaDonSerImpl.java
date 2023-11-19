package com.example.demo.ser.impl.giamgia;

import com.example.demo.entity.giamgia.GiamGiaHoaDon;
import com.example.demo.repo.giamgia.GiamGiaHoaDonRepo;
import com.example.demo.ser.giamgia.GiamGiaHoaDonSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class GiamGiaHoaDonSerImpl implements GiamGiaHoaDonSer {

    @Autowired
    GiamGiaHoaDonRepo giamGiaHoaDonRepo;

    @Override
    public List<GiamGiaHoaDon> getAll() {
        return giamGiaHoaDonRepo.findAll();
    }

    @Override
    public Page<GiamGiaHoaDon> view(Integer pageNo, Integer size) {
        Pageable pageable = PageRequest.of(pageNo, size);
        return giamGiaHoaDonRepo.findAll(pageable);
    }

    @Override
    public void add(GiamGiaHoaDon giamGiaHoaDon) {
        giamGiaHoaDonRepo.save(giamGiaHoaDon);
    }

    @Override
    public void update(UUID id, GiamGiaHoaDon update) {
        Optional<GiamGiaHoaDon> optionalGiamGiaHoaDon = giamGiaHoaDonRepo.findById(id);
        if (optionalGiamGiaHoaDon.isPresent()) {
            GiamGiaHoaDon giamGiaHoaDon = optionalGiamGiaHoaDon.get();
            giamGiaHoaDon.setMa(update.getMa());
            giamGiaHoaDon.setTen(update.getTen());
            giamGiaHoaDon.setPhanTramGiam(update.getPhanTramGiam());
            giamGiaHoaDon.setSoLuongSanPham(update.getSoLuongSanPham());
            giamGiaHoaDon.setSoTienHoaDon(update.getSoTienHoaDon());
            giamGiaHoaDon.setNgayBatDau(update.getNgayBatDau());
            giamGiaHoaDon.setNgayKetThuc(update.getNgayKetThuc());
            giamGiaHoaDon.setTrangThai(update.getTrangThai());
            giamGiaHoaDonRepo.save(giamGiaHoaDon);
        }
    }

    @Override
    public GiamGiaHoaDon findId(UUID id) {
        Optional<GiamGiaHoaDon> optionalGiamGiaHoaDon = giamGiaHoaDonRepo.findById(id);
        return optionalGiamGiaHoaDon.orElse(null);
    }

    @Override
    public Page<GiamGiaHoaDon> searchTen(String ten, Integer pageNo, Integer size) {
        Pageable pageable = PageRequest.of(pageNo, size);
        return giamGiaHoaDonRepo.findByTen(ten, pageable);
    }

    @Override
    public Page<GiamGiaHoaDon> loc(Date ngayBatDau, Date ngayKetThuc, Integer pageNo, Integer size) {
        Pageable pageable = PageRequest.of(pageNo, size);

        if (ngayBatDau == null && ngayKetThuc == null) {
            return giamGiaHoaDonRepo.findAll(pageable);
        } else if (ngayBatDau != null && ngayKetThuc == null) {
            return giamGiaHoaDonRepo.findByNgayBatDau(ngayBatDau, pageable);
        } else if (ngayBatDau == null && ngayKetThuc != null) {
            return giamGiaHoaDonRepo.findByNgayKetThuc(ngayKetThuc, pageable);
        } else {
            return giamGiaHoaDonRepo.findByNgayBatDauAndNgayKetThuc(ngayBatDau, ngayKetThuc, pageable);
        }
    }

    @Override
    public List<GiamGiaHoaDon> findByTrangThai(int trangThai) {
        return giamGiaHoaDonRepo.findByTrangThai(trangThai);
    }

    @Override
    public List<GiamGiaHoaDon> findBySlandTt(int sl, BigDecimal tt) {
        return giamGiaHoaDonRepo.findBySlandTt(sl, tt);
    }
}
