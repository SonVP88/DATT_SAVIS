package com.example.demo.ser.users;

import com.example.demo.entity.khachhang.Users;
import com.example.demo.entity.sanpham.Ao;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

public interface UsersSer {

    List<Users> getAll();

    Users findById(UUID id);

    Users findByEmailAndMatKhau(String email, String matKhau);

    Users findByMa(String ma);

    void add(Users users);

    void update(UUID id, Users update);

    Users findByEmail(String email);

    int soLuongUser();

    int demLoginGG(String email);

    Users findByHD(UUID id);
    List<Users> findAllKhachHang();
}
