package com.example.demo.ser.impl.chat;

import com.example.demo.entity.chat.MessageChat;
import com.example.demo.entity.dto.ChatDTO;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.repo.chat.ChatMessageRepository;
import com.example.demo.ser.chat.ChatSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class ChatSerImpl implements ChatSer {

    @Autowired
    ChatMessageRepository chatMessageRepository;

    @Override
    public void update(int id, MessageChat upChat) {
        MessageChat messageChat = chatMessageRepository.findById(id).orElse(null);
        messageChat.setUsers(upChat.getUsers());
        messageChat.setTimestamp(upChat.getTimestamp());
        messageChat.setBientrunggian(upChat.getBientrunggian());
        messageChat.setContent(upChat.getContent());
        messageChat.setTrangThai(upChat.getTrangThai());

        chatMessageRepository.save(messageChat);
    }

    @Override
    public int soTinNhanChuaDoc() {
        int sl = 0;

        List<Users> listUsers = chatMessageRepository.Alluser();
        for (Users users : listUsers){
            String bienTrungGianByUser = chatMessageRepository.bienTrungGianByUser(users.getId());

            List<MessageChat> listMessageChats = chatMessageRepository.listChat(bienTrungGianByUser);

            if(listMessageChats.get(0).getTrangThai() == 1){
                sl += 1;
            }
        }
        return sl;
    }
}
