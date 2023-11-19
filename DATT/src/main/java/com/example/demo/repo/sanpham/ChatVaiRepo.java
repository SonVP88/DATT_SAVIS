package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.ChatVai;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ChatVaiRepo extends JpaRepository<ChatVai, UUID> {

    @Query("select cv from ChatVai cv where cv.trangthai = ?1")
    List<ChatVai> findAllByTrangThai(Integer trangThai);

    @Query("select count(cv.id) from ChatVai cv")
    Integer soCV();
}
