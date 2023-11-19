package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.Anh;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface AnhRepo extends JpaRepository<Anh, UUID> {

    @Query("select a from Anh a where a.ao.id = ?1")
    List<Anh> findAllByAoId(UUID id);

    @Query("select count(anh.ao.id) from Anh anh where anh.ao.id = ?1")
    int soLuongAnhByIdAo(UUID id);
}
