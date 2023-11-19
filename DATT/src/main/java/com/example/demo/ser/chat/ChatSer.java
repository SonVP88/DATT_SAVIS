package com.example.demo.ser.chat;

import com.example.demo.entity.chat.MessageChat;

import java.util.UUID;

public interface ChatSer {

    void update(int id, MessageChat upChat);

    int soTinNhanChuaDoc();
}
