package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.Ao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import org.springframework.data.domain.Pageable;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

@Repository
public interface AoRepo extends JpaRepository<Ao, UUID> {

    @Query("select a from Ao a where a.trangThai = ?1")
    List<Ao> findAllByTrangThai(Integer trangThai);

    @Query("select p from Ao p where p.ten = ?1")
    Ao findByTen(String ten);

    @Query(value = "select top 8 ao.Id from Ao ao \n" +
            "join AoChiTiet act on ao.Id = act.IdAo \n" +
            "where ao.TrangThai = 2\n" +
            "group by ao.Id \n" +
            "order by sum(act.SoLuongBan) desc\n",nativeQuery = true)
    List<UUID> uuidTop8();

    @Query("select a from Ao a where a.loaiAo.ma = ?1 and a.trangThai = 2")
    List<Ao> listAoFindByLoaiAo(String ma);


    @Query("select sum(act.slban) from AoChiTiet act where act.ao.id = ?1")
    Long soLuongBanByUUID(UUID id);

    @Query("select count (ao.id) from Ao ao")
    Integer soLuongAo();

    @Query("SELECT a FROM Ao a WHERE a.ten LIKE %:ten% and a.trangThai = 2")
    List<Ao> findAllByTen(@Param("ten") String ten);

    @Query("SELECT a FROM Ao a WHERE EXTRACT(MONTH FROM a.ngayNhap) = EXTRACT(MONTH FROM CURRENT_DATE) and a.trangThai = 2")
    List<Ao> findAoNhapTrongThangHienTai();

    @Query("SELECT a FROM Ao a WHERE " +
            "(a.trangThai = 2) AND " +
            "(:idChatVai IS NULL OR a.chatVai.id = :idChatVai) AND " +
            "(:idLoaiAo IS NULL OR a.loaiAo.id = :idLoaiAo) AND " +
            "(:idForm IS NULL OR a.form.id = :idForm) AND " +
            "(:idHang IS NULL OR a.hang.id = :idHang) AND " +
            "(:mauSacIds IS NULL OR EXISTS (SELECT 1 FROM AoChiTiet act WHERE act.ao = a AND act.mau_sac.id IN :mauSacIds)) AND " +
            "((:minPrice IS NULL AND :maxPrice IS NULL) OR " +
            "(:minPrice IS NULL AND a.giaBan <= :maxPrice) OR " +
            "(:maxPrice IS NULL AND a.giaBan >= :minPrice) OR " +
            "(a.giaBan BETWEEN :minPrice AND :maxPrice))")
    List<Ao> timKiemNangCao(
            @Param("idChatVai") UUID idChatVai,
            @Param("idLoaiAo") UUID idLoaiAo,
            @Param("idForm") UUID idForm,
            @Param("idHang") UUID idHang,
            @Param("minPrice") BigDecimal minPrice,
            @Param("maxPrice") BigDecimal maxPrice,
            @Param("mauSacIds") List<UUID> mauSacIds
    );

    @Query("select p from Ao p where p.ma = ?1")
    Ao findByMa(String ma);

}
