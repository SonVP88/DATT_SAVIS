package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.Hang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface HangRepo extends JpaRepository<Hang, UUID> {

    @Query("select h from Hang h where h.trangthai = ?1")
    List<Hang> findAllByTrangThai(Integer trangThai);

    @Query("select count(h.id) from Hang h")
    Integer soHang();

}
