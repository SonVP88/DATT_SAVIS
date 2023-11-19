package com.example.demo.ser.impl.sanpham;

import com.example.demo.entity.sanpham.Anh;
import com.example.demo.repo.sanpham.AnhRepo;
import com.example.demo.ser.sanpham.AnhSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class AnhSerImpl implements AnhSer {

    @Autowired
    AnhRepo anhRepo;

    @Override
    public List<Anh> findAllByAoId(UUID id) {
        return anhRepo.findAllByAoId(id);
    }

    @Override
    public void add(Anh anh) {
        anhRepo.save(anh);
    }

    @Override
    public void delete(UUID id) {
        anhRepo.deleteById(id);
    }

    @Override
    public Anh findById(UUID id) {
        return anhRepo.findById(id).orElse(null);
    }

    @Override
    public int soLuongAnhByIdAo(UUID id) {
        return anhRepo.soLuongAnhByIdAo(id);
    }
}
