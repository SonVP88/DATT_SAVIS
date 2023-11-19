package com.example.demo.ser.impl.users;

import com.example.demo.entity.khachhang.Users;
import com.example.demo.repo.users.UsersRepo;
import com.example.demo.ser.users.UsersSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class UsersSerImpl implements UsersSer {

    @Autowired
    UsersRepo usersRepo;

    @Override
    public List<Users> getAll() {
        return usersRepo.findAll();
    }

    @Override
    public Users findById(UUID id) {
        Optional<Users> optionalKhachHang = usersRepo.findById(id);
        return optionalKhachHang.orElse(null);
    }

    @Override
    public Users findByEmailAndMatKhau(String email, String matKhau) {
        return usersRepo.findByEmailAndMatKhau(email, matKhau);
    }

    @Override
    public Users findByMa(String ma) {
        return usersRepo.findByMa(ma);
    }

    @Override
    public void add(Users users) {
        usersRepo.save(users);
    }

    @Override
    public void update(UUID id, Users update) {
        Users users = usersRepo.findById(id).orElse(null);
        users.setMa(update.getMa());
        users.setTen(update.getTen());
        users.setNgay_sinh(update.getNgay_sinh());
        users.setDia_chi(update.getDia_chi());
        users.setThanh_pho(update.getThanh_pho());
        users.setQuoc_gia(update.getQuoc_gia());
        users.setSdt(update.getSdt());
        users.setEmail(update.getEmail());
        users.setMatKhau(update.getMatKhau());
        users.setTrangThai(update.getTrangThai());
        usersRepo.save(users);

    }

    @Override
    public Users findByEmail(String email) {
        return usersRepo.findByEmail(email);
    }

    @Override
    public int soLuongUser() {
        return usersRepo.soLuongUser();
    }

    @Override
    public int demLoginGG(String email) {
        return usersRepo.demLoginGG(email);
    }

    @Override
    public Users findByHD(UUID id) {
        return usersRepo.findByHD(id);
    }
    @Override
    public List<Users> findAllKhachHang() {
        return usersRepo.findAllKhachHang();
    }
}
