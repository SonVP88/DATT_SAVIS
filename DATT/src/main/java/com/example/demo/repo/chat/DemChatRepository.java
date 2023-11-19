package com.example.demo.repo.chat;

import com.example.demo.entity.chat.DemChat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DemChatRepository extends JpaRepository<DemChat,Integer> {
    long countByBientrunggian(String bientrunggian);
    void deleteByBientrunggian(String bientrunggian);
    void deleteAll();

    DemChat findDemChatById(String id);
}
