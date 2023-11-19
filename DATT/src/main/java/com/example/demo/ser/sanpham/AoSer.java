package com.example.demo.ser.sanpham;

import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.dto.AoDTO;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

public interface AoSer {

    List<Ao> getAll();

    void add(Ao ao);

    void update(UUID id, Ao updateAo);

    Ao findById(UUID id);

    List<Ao> findAllByTrangThai(Integer trangThai);

    Ao findByTen(String ten);

    List<AoDTO> findTop8AoBanChay();

    List<AoDTO> findAllByTen(String ten);

    Integer soLuongAo();

    List<AoDTO> findAllAoDTO();

    List<AoDTO> findByAo(List<Ao> listAos);

    List<Ao> listAoFindByLoaiAo(String ma);

    List<Ao> findAoNhapTrongThangHienTai();

    List<Ao> timKiemNangCao(UUID idChatVai, UUID idLoaiAo, UUID idForm, UUID idHang, BigDecimal minPrice, BigDecimal maxPrice, List<UUID> mauSacIds);

    Long soLuongBanByUUID(UUID id);

    Ao findByMa(String ma);
}
