package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.LoaiAo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface LoaiAoRepo extends JpaRepository<LoaiAo, UUID> {

    @Query("select la from LoaiAo la where la.trangthai = ?1")
    List<LoaiAo> findAllByTrangThai(Integer trangThai);

    LoaiAo findByMa(String ma);

    @Query("select count(la.id) from LoaiAo la")
    Integer soLA();
}
