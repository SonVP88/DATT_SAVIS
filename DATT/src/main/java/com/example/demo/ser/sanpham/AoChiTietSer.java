package com.example.demo.ser.sanpham;

import com.example.demo.entity.dto.AoDTO;
import com.example.demo.entity.dto.ThongKeSoLuongAoDTO;
import com.example.demo.entity.sanpham.AoChiTiet;
import com.example.demo.entity.sanpham.MauSac;
import com.example.demo.entity.sanpham.Size;

import java.util.List;
import java.util.UUID;

public interface AoChiTietSer {

    List<AoChiTiet> findByAoId(UUID id);

    void add(AoChiTiet aoChiTiet);

    void update(UUID id, AoChiTiet updateACT);

    AoChiTiet findById(UUID id);

    List<Size> findSizeByIdAo(UUID idAo);

    List<MauSac> findMauSacByIdAo(UUID idAo);

    AoChiTiet findIdByIdAoMsSize(UUID id, UUID idMauSac, UUID idSize);

    int soLuongAoChiTietByIdAo(UUID id);

    List<ThongKeSoLuongAoDTO> thongKeSoLuongAoDTO();

    List<AoDTO> thongKeAoDto(String ma);

}
