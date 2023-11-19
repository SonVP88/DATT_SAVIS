package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.Size;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface SizeRepo extends JpaRepository<Size, UUID> {
    @Query("select sz from Size sz where sz.trangthai = ?1")
    List<Size> findAllByTrangThai(Integer trangThai);

    @Query("select count(s.id) from Size s")
    Integer soS();
}
