package com.example.demo.ser.impl.sanpham;

import com.example.demo.entity.sanpham.ChatVai;
import com.example.demo.repo.sanpham.ChatVaiRepo;
import com.example.demo.ser.sanpham.ChatVaiSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class ChatVaiSerImpl implements ChatVaiSer {

    @Autowired
    ChatVaiRepo chatVaiRepo;

    @Override
    public List<ChatVai> getAll() {
        return chatVaiRepo.findAll();
    }

    @Override
    public void add(ChatVai chatVai) {
        chatVaiRepo.save(chatVai);
    }

    @Override
    public void update(UUID id, ChatVai updateCV) {
        ChatVai chatVai = chatVaiRepo.findById(id).orElse(null);
        chatVai.setMa(updateCV.getMa());
        chatVai.setTen(updateCV.getTen());
        chatVai.setThongtin(updateCV.getThongtin());
        chatVai.setHuong_dan_bao_quan(updateCV.getHuong_dan_bao_quan());
        chatVai.setTrangthai(updateCV.getTrangthai());
        chatVaiRepo.save(chatVai);
    }

    @Override
    public ChatVai findById(UUID id) {
        return chatVaiRepo.findById(id).orElse(null);
    }

    @Override
    public List<ChatVai> findAllByTrangThai(Integer trangThai) {
        return chatVaiRepo.findAllByTrangThai(trangThai);
    }
}
