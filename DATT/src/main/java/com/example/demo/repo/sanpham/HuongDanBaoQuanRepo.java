package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.HuongDanBaoQuan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface HuongDanBaoQuanRepo extends JpaRepository<HuongDanBaoQuan, UUID> {

    @Query("select hdbq from HuongDanBaoQuan hdbq where hdbq.trangthai = ?1")
    List<HuongDanBaoQuan> findByAllByTrangThai(Integer trangThai);

    @Query("select count(hdbq.id) from HuongDanBaoQuan hdbq")
    Integer soHDBQ();
}
