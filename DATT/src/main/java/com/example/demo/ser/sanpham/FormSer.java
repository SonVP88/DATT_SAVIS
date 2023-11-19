package com.example.demo.ser.sanpham;

import com.example.demo.entity.sanpham.Form;

import java.util.List;
import java.util.UUID;

public interface FormSer {

    List<Form> getAll();

    Form findById(UUID id);

    List<Form> findAllByTrangThai(Integer trangThai);

    void add(Form form);

    void update(UUID id, Form updateForm);
}
