package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.MauSac;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface MauSacRepo extends JpaRepository<MauSac, UUID> {
    @Query("select ms from MauSac ms where ms.trangthai = ?1")
    List<MauSac> findAllByTrangThai(Integer trangThai);

    @Query("select count(ms.id) from MauSac ms")
    Integer soMS();
}
