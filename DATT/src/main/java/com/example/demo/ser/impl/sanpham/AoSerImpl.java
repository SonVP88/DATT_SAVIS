package com.example.demo.ser.impl.sanpham;

import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;
import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.dto.AoDTO;
import com.example.demo.repo.giamgia.GiamGiaSanPhamChiTietRepo;
import com.example.demo.repo.sanpham.AoRepo;
import com.example.demo.ser.sanpham.AoSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class AoSerImpl implements AoSer {

    @Autowired
    AoRepo aoRepo;

    @Autowired
    GiamGiaSanPhamChiTietRepo giamGiaSanPhamChiTietRepo;

    @Override
    public List<Ao> getAll() {
        return aoRepo.findAll();
    }

    @Override
    public void add(Ao ao) {
        aoRepo.save(ao);
    }

    @Override
    public void update(UUID id, Ao updateAo) {
        Ao ao = aoRepo.findById(id).orElse(null);
        ao.setMa(updateAo.getMa());
        ao.setTen(updateAo.getTen());
        ao.setChatVai(updateAo.getChatVai());
        ao.setLoaiAo(updateAo.getLoaiAo());
        ao.setCoAo(updateAo.getCoAo());
        ao.setTui(updateAo.getTui());
        ao.setTayAo(updateAo.getTayAo());
        ao.setForm(updateAo.getForm());
        ao.setHang(updateAo.getHang());
        ao.setMoTa(updateAo.getMoTa());
        ao.setNgayNhap(updateAo.getNgayNhap());
        ao.setGiaNhap(updateAo.getGiaNhap());
        ao.setGiaBan(updateAo.getGiaBan());
        ao.setTrangThai(updateAo.getTrangThai());

        aoRepo.save(ao);
    }

    @Override
    public Ao findById(UUID id) {
        return aoRepo.findById(id).orElse(null);
    }

    @Override
    public List<Ao> findAllByTrangThai(Integer trangThai) {
        return aoRepo.findAllByTrangThai(trangThai);
    }

    @Override
    public Ao findByTen(String ten) {
        return aoRepo.findByTen(ten);
    }

    @Override
    public List<AoDTO> findTop8AoBanChay() {
        List<UUID> top8UUID = aoRepo.uuidTop8();
        List<AoDTO> top8Ao = new ArrayList<>();
        for (UUID uuid : top8UUID) {
            Ao ao = aoRepo.findById(uuid).orElse(null);
            Long slBan = aoRepo.soLuongBanByUUID(uuid);
            AoDTO aoDTO = new AoDTO();
            aoDTO.setAo(ao);
            aoDTO.setSlBan(slBan);
            top8Ao.add(aoDTO);
        }
        return top8Ao;
    }

    @Override
    public List<AoDTO> findAllByTen(String ten) {

        List<Ao> listAos = aoRepo.findAllByTen(ten);
        List<AoDTO> list = new ArrayList<>();

        for (Ao ao : listAos){
            AoDTO aoDTO = new AoDTO();
            aoDTO.setAo(ao);
            aoDTO.setSlBan(aoRepo.soLuongBanByUUID(ao.getId()));

            GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietRepo.findByIdAoAndTrangThai(ao.getId());
            if (giamGiaSanPhamChiTiet != null){
                int giaBan = ao.getGiaBan().toBigInteger().intValue() - (giamGiaSanPhamChiTiet.getSoTienDaGiam().toBigInteger().intValue()/100);
                aoDTO.setGiaBan(giaBan);
            }else {
                int giaBan = ao.getGiaBan().toBigInteger().intValue();
                aoDTO.setGiaBan(giaBan);
            }
            list.add(aoDTO);
        }
        return list;
    }

    @Override
    public Integer soLuongAo() {
        return aoRepo.soLuongAo();
    }

    @Override
    public List<AoDTO> findAllAoDTO() {
        List<Ao> listAos = aoRepo.findAllByTrangThai(2);
        List<AoDTO> list = new ArrayList<>();

        for (Ao ao : listAos){
            AoDTO aoDTO = new AoDTO();
            aoDTO.setAo(ao);
            aoDTO.setSlBan(aoRepo.soLuongBanByUUID(ao.getId()));

            GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietRepo.findByIdAoAndTrangThai(ao.getId());
            if (giamGiaSanPhamChiTiet != null){
                int giaBan = ao.getGiaBan().toBigInteger().intValue() - (giamGiaSanPhamChiTiet.getSoTienDaGiam().toBigInteger().intValue()/100);
                aoDTO.setGiaBan(giaBan);
            }else {
                int giaBan = ao.getGiaBan().toBigInteger().intValue();
                aoDTO.setGiaBan(giaBan);
            }
            list.add(aoDTO);
        }
        return list;
    }

    @Override
    public List<AoDTO> findByAo(List<Ao> listAos) {

        List<AoDTO> list = new ArrayList<>();

        for (Ao ao : listAos){
            AoDTO aoDTO = new AoDTO();
            aoDTO.setAo(ao);
            aoDTO.setSlBan(aoRepo.soLuongBanByUUID(ao.getId()));

            GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietRepo.findByIdAoAndTrangThai(ao.getId());
            if (giamGiaSanPhamChiTiet != null){
                int giaBan = ao.getGiaBan().toBigInteger().intValue() - (giamGiaSanPhamChiTiet.getSoTienDaGiam().toBigInteger().intValue()/100);
                aoDTO.setGiaBan(giaBan);
            }else {
                int giaBan = ao.getGiaBan().toBigInteger().intValue();
                aoDTO.setGiaBan(giaBan);
            }
            list.add(aoDTO);
        }

        return list;
    }

    @Override
    public List<Ao> listAoFindByLoaiAo(String ma) {
        return aoRepo.listAoFindByLoaiAo(ma);
    }

    @Override
    public List<Ao> findAoNhapTrongThangHienTai() {
        return aoRepo.findAoNhapTrongThangHienTai();
    }

    @Override
    public List<Ao> timKiemNangCao(UUID idChatVai, UUID idLoaiAo, UUID idForm, UUID idHang, BigDecimal minPrice, BigDecimal maxPrice, List<UUID> mauSacIds) {
        return aoRepo.timKiemNangCao(idChatVai, idLoaiAo, idForm, idHang, minPrice, maxPrice, mauSacIds);
    }

    @Override
    public Long soLuongBanByUUID(UUID id) {
        return aoRepo.soLuongBanByUUID(id);
    }

    @Override
    public Ao findByMa(String ma) {
        return aoRepo.findByMa(ma);
    }
}
