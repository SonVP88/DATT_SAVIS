package com.example.demo.ser.impl.users;

import com.example.demo.entity.dto.HoaDonChiTietDTO;
import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;
import com.example.demo.entity.khachhang.HoaDon;
import com.example.demo.entity.khachhang.HoaDonChiTiet;
import com.example.demo.entity.sanpham.Ao;
import com.example.demo.repo.giamgia.GiamGiaSanPhamChiTietRepo;
import com.example.demo.repo.users.HoaDonChiTietRepo;
import com.example.demo.ser.users.HoaDonChiTietSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class HoaDonChiTietSerImpl implements HoaDonChiTietSer {

    @Autowired
    HoaDonChiTietRepo hoaDonChiTietRepo;

    @Autowired
    GiamGiaSanPhamChiTietRepo giamGiaSanPhamChiTietRepo;

    @Override
    public void add(HoaDonChiTiet hoaDonChiTiet) {
        hoaDonChiTietRepo.save(hoaDonChiTiet);
    }

    @Override
    public List<HoaDonChiTiet> findByHoaDon(UUID id) {
        return hoaDonChiTietRepo.findByHoaDon(id);
    }

    @Override
    public void update(UUID id, HoaDonChiTiet updateHDCT) {
        Optional<HoaDonChiTiet> optionalHoaDonChiTiet = hoaDonChiTietRepo.findById(id);
        if(optionalHoaDonChiTiet.isPresent()){
            HoaDonChiTiet hoaDonChiTiet = optionalHoaDonChiTiet.get();

            hoaDonChiTiet.setAoChiTiet(updateHDCT.getAoChiTiet());
            hoaDonChiTiet.setHoaDon(updateHDCT.getHoaDon());
            hoaDonChiTiet.setDonGia(updateHDCT.getDonGia());
            hoaDonChiTiet.setTrangThai(updateHDCT.getTrangThai());
            hoaDonChiTiet.setSoLuong(updateHDCT.getSoLuong());

            hoaDonChiTietRepo.save(hoaDonChiTiet);
        }
    }

    @Override
    public void delete(UUID id) {
        hoaDonChiTietRepo.deleteById(id);
    }

    @Override
    public HoaDonChiTiet findById(UUID id) {
        return hoaDonChiTietRepo.findById(id).orElse(null);
    }

    @Override
    public int soLuongHoaDonCHiTietByHoaDon(UUID id) {
        return hoaDonChiTietRepo.soLuongHoaDonCHiTietByHoaDon(id);
    }

    @Override
    public HoaDonChiTiet findByHoaDonAndAoChiTiet(UUID idHoaDon, UUID idACT) {
        return hoaDonChiTietRepo.findByHoaDonAndAoChiTiet(idHoaDon,idACT);
    }

    @Override
    public Integer soLuongBanTheoNgay(LocalDate date) {
        return hoaDonChiTietRepo.soLuongBanTheoNgay(date);
    }

    @Override
    public List<Integer> soLuongBanTheoThang(LocalDate date1, LocalDate date2) {
        return hoaDonChiTietRepo.soLuongBanTheoThang(date1,date2);
    }

    @Override
    public List<HoaDonChiTietDTO> listHoaDonTheoNgay(List<HoaDon> listHoaDons) {
        List<HoaDonChiTietDTO> listHoaDonChiTietDTOS = new ArrayList<>();
        for (HoaDon hoaDon : listHoaDons){
            List<HoaDonChiTiet> hoaDonChiTiets = hoaDonChiTietRepo.findByHoaDon(hoaDon.getId());
            for (HoaDonChiTiet hoaDonChiTiet : hoaDonChiTiets) {
                Ao ao = hoaDonChiTiet.getAoChiTiet().getAo();
                GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietRepo.findByIdAoAndTrangThai(ao.getId());

                HoaDonChiTietDTO hoaDonChiTietDTO = new HoaDonChiTietDTO();
                int gia;

                if (giamGiaSanPhamChiTiet != null) {
                    gia = ao.getGiaBan().toBigInteger().intValue() * (100 - giamGiaSanPhamChiTiet.getGiamGiaSanPham().getPhanTramGiam()) / 100;
                } else {
                    gia = ao.getGiaBan().toBigInteger().intValue();
                }
                hoaDonChiTietDTO.setHoaDonChiTiet(hoaDonChiTiet);
                hoaDonChiTietDTO.setGia(gia);
                listHoaDonChiTietDTOS.add(hoaDonChiTietDTO);
            }
        }
        return listHoaDonChiTietDTOS;
    }

    @Override
    public Integer soLuongBanThangHienTai(LocalDate date1, LocalDate date2) {
        return hoaDonChiTietRepo.soLuongBanThangHienTai(date1,date2);
    }

    @Override
    public Integer soLuongBanTrongThang(LocalDate date) {
        return hoaDonChiTietRepo.soLuongBanTrongThang(date);
    }

}
