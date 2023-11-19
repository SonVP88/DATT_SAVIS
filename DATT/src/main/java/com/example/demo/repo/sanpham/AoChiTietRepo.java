package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.sanpham.AoChiTiet;
import com.example.demo.entity.sanpham.MauSac;
import com.example.demo.entity.sanpham.Size;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface AoChiTietRepo extends JpaRepository<AoChiTiet, UUID> {

    @Query("select act from AoChiTiet act where act.ao.id = ?1 ORDER BY act.mau_sac.ten ASC")
    List<AoChiTiet> findByAoId(UUID id);
    @Query("select act.size from AoChiTiet act where act.ao.id = ?1")
    List<Size> findSizeByIdAo(UUID idAo);

    @Query("select act.mau_sac from AoChiTiet act where act.ao.id = ?1")
    List<MauSac> findMauSacByIdAo(UUID idAo);

    @Query("select p from AoChiTiet p where p.ao.id = ?1 and p.mau_sac.id = ?2 and p.size.id = ?3")
    AoChiTiet findIdByIdAoMsSize(UUID id, UUID idMauSac, UUID idSize);

    @Query("select count(act.ao.id) from AoChiTiet act where act.ao.id = ?1")
    int soLuongAoChiTietByIdAo(UUID id);

    @Query("select p from AoChiTiet p where p.ao.ma = ?1 and p.mau_sac.ma = ?2 and p.size.ma = ?3")
    AoChiTiet findByMaAoMsSize(String id, String idMauSac, String idSize);

    @Query("select sum(act.slban) from AoChiTiet act where act.ao.loaiAo.id = ?1")
    Integer soLuongAoBanByLoaiAo(UUID id);

    @Query("select sum(act.slton) from AoChiTiet act where act.ao.loaiAo.id = ?1")
    Integer soLuongAoTonByLoaiAo(UUID id);

    @Query("select sum(act.slban) from AoChiTiet act where act.ao.id = ?1")
    Integer soLuongAoBanByAo(UUID id);

    @Query("select sum(act.slton) from AoChiTiet act where act.ao.id = ?1")
    Integer soLuongAoTonByAo(UUID id);

    @Query("select act from Ao a join LoaiAo la on a.loaiAo=la join AoChiTiet act on act.ao=a join Size s on act.size=s join MauSac m on m=act.mau_sac where la.ten=?1 and a.ten=?2 and m.ten=?3")
    List<AoChiTiet> listSoLuongbyMauAo(String la,String ao,String mau);

    @Query("select a from Ao a join LoaiAo la on a.loaiAo=la where la.ten=?1")
    List<Ao> listAoByLoaiAo(String la);
}
