package com.example.demo.ser.impl.sanpham;

import com.example.demo.entity.dto.AoDTO;
import com.example.demo.entity.dto.ThongKeSoLuongAoDTO;
import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.sanpham.AoChiTiet;
import com.example.demo.entity.sanpham.LoaiAo;
import com.example.demo.entity.sanpham.MauSac;
import com.example.demo.entity.sanpham.Size;
import com.example.demo.repo.sanpham.AoChiTietRepo;
import com.example.demo.repo.sanpham.AoRepo;
import com.example.demo.repo.sanpham.LoaiAoRepo;
import com.example.demo.repo.sanpham.MauSacRepo;
import com.example.demo.ser.sanpham.AoChiTietSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class AoChiTietSerImpl implements AoChiTietSer {

    @Autowired
    AoChiTietRepo aoChiTietRepo;

    @Autowired
    MauSacRepo mauSacRepo;

    @Autowired
    LoaiAoRepo loaiAoRepo;

    @Autowired
    AoRepo aoRepo;

    @Override
    public List<AoChiTiet> findByAoId(UUID id) {
        return aoChiTietRepo.findByAoId(id);
    }

    @Override
    public void add(AoChiTiet aoChiTiet) {
        aoChiTietRepo.save(aoChiTiet);
    }

    @Override
    public void update(UUID id, AoChiTiet updateACT) {
        AoChiTiet aoChiTiet = aoChiTietRepo.findById(id).orElse(null);
        aoChiTiet.setAo(updateACT.getAo());
        aoChiTiet.setMau_sac(updateACT.getMau_sac());
        aoChiTiet.setSize(updateACT.getSize());
        aoChiTiet.setSlton(updateACT.getSlton());
        aoChiTiet.setSlban(updateACT.getSlban());
        aoChiTiet.setTrangthai(updateACT.getTrangthai());
        aoChiTietRepo.save(aoChiTiet);
    }

    @Override
    public AoChiTiet findById(UUID id) {
        return aoChiTietRepo.findById(id).orElse(null);
    }

    @Override
    public List<Size> findSizeByIdAo(UUID idAo) {
        return aoChiTietRepo.findSizeByIdAo(idAo);
    }

    @Override
    public List<MauSac> findMauSacByIdAo(UUID idAo) {
        return aoChiTietRepo.findMauSacByIdAo(idAo);
    }

    @Override
    public AoChiTiet findIdByIdAoMsSize(UUID id, UUID idMauSac, UUID idSize) {
        return aoChiTietRepo.findIdByIdAoMsSize(id, idMauSac, idSize);
    }

    @Override
    public int soLuongAoChiTietByIdAo(UUID id) {
        return aoChiTietRepo.soLuongAoChiTietByIdAo(id);
    }

    @Override
    public List<ThongKeSoLuongAoDTO> thongKeSoLuongAoDTO() {
        List<LoaiAo> listLoaiAos = loaiAoRepo.findAllByTrangThai(1);

        List<ThongKeSoLuongAoDTO> listThongKeSoLuongAoDTOS = new ArrayList<>();

        for(LoaiAo loaiAo : listLoaiAos){

            ThongKeSoLuongAoDTO thongKeSoLuongAoDTO = new ThongKeSoLuongAoDTO();

            Integer slBanStr = aoChiTietRepo.soLuongAoBanByLoaiAo(loaiAo.getId());
            Integer slTonStr = aoChiTietRepo.soLuongAoTonByLoaiAo(loaiAo.getId());

            int slBan;
            int slTon;

            if (slBanStr == null){
                slBan = 0;
            }else {
                slBan = slBanStr;
            }

            if (slTonStr == null){
                slTon = 0;
            }else {
                slTon = slTonStr;
            }

            thongKeSoLuongAoDTO.setLoaiAo(loaiAo);
            thongKeSoLuongAoDTO.setSlBan(slBan);
            thongKeSoLuongAoDTO.setSlTon(slTon);
            listThongKeSoLuongAoDTOS.add(thongKeSoLuongAoDTO);
        }

        return listThongKeSoLuongAoDTOS;
    }

    @Override
    public List<AoDTO> thongKeAoDto(String ma) {

        List<AoDTO> listAoDTOS = new ArrayList<>();

        List<Ao> listAo = aoRepo.listAoFindByLoaiAo(ma);

        for (Ao ao : listAo){
            Integer slBanStr = aoChiTietRepo.soLuongAoBanByAo(ao.getId());
            Integer slTonStr = aoChiTietRepo.soLuongAoTonByAo(ao.getId());

            int slBan;
            int slTon;

            if (slBanStr == null){
                slBan = 0;
            }else {
                slBan = slBanStr;
            }

            if (slTonStr == null){
                slTon = 0;
            }else {
                slTon = slTonStr;
            }

            AoDTO aoDTO = new AoDTO();

            aoDTO.setTenAo(ao.getTen());
            aoDTO.setSlBan((long) slBan);
            aoDTO.setSlTon(slTon);

            listAoDTOS.add(aoDTO);
        }

        return listAoDTOS;
    }

}
