package com.example.demo.repo.users;

import com.example.demo.entity.khachhang.DanhGia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface DanhGiaRepo extends JpaRepository<DanhGia, UUID> {

    @Query("select dg from DanhGia dg where dg.aoChiTiet.ao.id = ?1 ORDER BY dg.ngayDanhGia DESC")
    List<DanhGia> findAllByAo(UUID idAo);

    @Query("select sum(dg.danhGiaSao) from DanhGia dg where dg.aoChiTiet.ao.id = ?1")
    Integer tongDanhGiaSao(UUID idAo);

    @Query("select count(dg.id) from DanhGia dg where dg.aoChiTiet.ao.id = ?1")
    int tongNguoiDanhGia(UUID idAo);
}
