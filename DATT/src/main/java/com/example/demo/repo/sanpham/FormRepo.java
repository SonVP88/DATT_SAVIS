package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.Form;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface FormRepo extends JpaRepository<Form, UUID> {

    @Query("select f from Form f where f.trangthai = ?1")
    List<Form> findAllByTrangThai(Integer trangThai);

    @Query("select count(f.id) from Form f")
    Integer soF();
}
