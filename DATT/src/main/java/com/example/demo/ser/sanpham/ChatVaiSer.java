package com.example.demo.ser.sanpham;

import com.example.demo.entity.sanpham.ChatVai;

import java.util.List;
import java.util.UUID;

public interface ChatVaiSer {

    List<ChatVai> getAll();

    void add(ChatVai chatVai);

    void update(UUID id, ChatVai updateCV);

    ChatVai findById(UUID id);

    List<ChatVai> findAllByTrangThai(Integer trangThai);
}
