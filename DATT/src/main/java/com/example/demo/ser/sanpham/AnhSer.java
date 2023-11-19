package com.example.demo.ser.sanpham;

import com.example.demo.entity.sanpham.Anh;

import java.util.List;
import java.util.UUID;

public interface AnhSer {

    List<Anh> findAllByAoId(UUID id);

    void add(Anh anh);

    void delete(UUID id);

    Anh findById(UUID id);

    int soLuongAnhByIdAo(UUID id);
}
