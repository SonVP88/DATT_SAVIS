package com.example.demo.repo.users;

import com.example.demo.entity.auth.RoleEnum;
import com.example.demo.entity.khachhang.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Repository
public interface UsersRepo extends JpaRepository<Users, UUID> {

    @Query("select p from Users p where p.email= ?1 and  p.matKhau= ?2")
    Users findByEmailAndMatKhau(String email, String matKhau);

    @Query("select p from Users p where p.ma= ?1")
    Users findByMa(String ma);

    @Query("select p from Users p where p.email= ?1")
    Users findByEmail(String email);

    @Query("select count(u.ma) from Users u")
    int soLuongUser();

    @Query("select count(u.email) from Users u where u.email = ?1")
    int demLoginGG(String email);

    @Query("select p from Users p where p.role= ?1")
    List<Users> findByRole(RoleEnum role);

    @Query("select p from Users p where p.role= ?1")
    Users findByRole1(RoleEnum role);

    @Query("select u from Users u where u.role='MENBER'")
    List<Users> findAllKhachHang();

    Users findUsersById(UUID id);

    @Query("select u from Users u where u.role='STAFF'")
    List<Users> findAllNhanVien();

    @Query(" select hd.khachHang from HoaDon hd where hd.id= ?1")
    Users findByHD(UUID id);
}
