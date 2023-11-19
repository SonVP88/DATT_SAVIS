package com.example.demo.repo.chat;

import com.example.demo.entity.chat.MessageChat;
import com.example.demo.entity.khachhang.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ChatMessageRepository extends JpaRepository<MessageChat,Integer> {
    List<MessageChat> findAllByBientrunggian(String a);

    @Query("select u , t from MessageChat m inner join Users u on m.users = u inner join ThoiGian t on t.users=u where u.role='MENBER' group by u,t order by t.timestamp desc")
    List<Users> Alluser();


    @Query("select distinct m.bientrunggian from MessageChat m where m.users.id = ?1")
    String bienTrungGianByUser(UUID id);

    @Query("select m from MessageChat m where m.users.id = ?1 order by m.timestamp desc")
    List<MessageChat> listChatByUser(UUID id);

    @Query("select m from MessageChat m where m.bientrunggian = ?1 order by m.timestamp desc")
    List<MessageChat> listChat(String bienTrungGian);

}
