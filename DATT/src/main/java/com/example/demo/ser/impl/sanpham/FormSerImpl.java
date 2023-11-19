package com.example.demo.ser.impl.sanpham;

import com.example.demo.entity.sanpham.Form;
import com.example.demo.repo.sanpham.FormRepo;
import com.example.demo.ser.sanpham.FormSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class FormSerImpl implements FormSer {

    @Autowired
    FormRepo formRepo;

    @Override
    public List<Form> getAll() {
        return formRepo.findAll();
    }

    @Override
    public Form findById(UUID id) {
        return formRepo.findById(id).orElse(null);
    }

    @Override
    public List<Form> findAllByTrangThai(Integer trangThai) {
        return formRepo.findAllByTrangThai(trangThai);
    }

    @Override
    public void add(Form form) {
        formRepo.save(form);
    }

    @Override
    public void update(UUID id, Form updateForm) {
        Form form = formRepo.findById(id).orElse(null);
        form.setMa(updateForm.getMa());
        form.setTen(updateForm.getTen());
        form.setTrangthai(updateForm.getTrangthai());
    }
}
