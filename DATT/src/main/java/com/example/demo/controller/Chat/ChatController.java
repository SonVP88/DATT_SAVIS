package com.example.demo.controller.Chat;

import com.example.demo.entity.auth.RoleEnum;
import com.example.demo.entity.chat.DemChat;
import com.example.demo.entity.chat.MessageChat;
import com.example.demo.entity.chat.ThoiGian;
import com.example.demo.entity.dto.ChatDTO;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.repo.chat.ChatMessageRepository;
import com.example.demo.repo.chat.DemChatRepository;
import com.example.demo.repo.chat.ThoiGianRepository;
import com.example.demo.repo.users.UsersRepo;
import com.example.demo.ser.chat.ChatSer;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Controller
public class ChatController {
    @Autowired
    private SimpMessagingTemplate messagingTemplate;
    @Autowired
    private ChatMessageRepository chatMessageRepository;
    @Autowired
    private UsersRepo userRepository;

    @Autowired
    private DemChatRepository demChatRepository;

    @Autowired
    private ThoiGianRepository thoiGianRepository;

    @Autowired
    ChatSer chatSer;

    @MessageMapping("/chat.sendMessage")
    @SendTo("/topic/publicChatRoom/")
    public MessageChat sendMessage(@Payload MessageChat message) {
        Users u = userRepository.findByMa(message.getUsers().getMa());
        message.setUsers(u);
        message.setTimestamp(LocalDateTime.now());
        message.setBientrunggian(message.getBientrunggian());
        message.setTrangThai(message.getTrangThai());
        chatMessageRepository.save(message);
        return message;
    }
    @MessageMapping("/chat.sendPrivateMessage")
    public MessageChat sendMessage(@Payload MessageChat message, @Header("simpSessionId") String sessionId) {
        // Lấy giá trị privateRoomName từ tin nhắn
        Users u = userRepository.findByMa(message.getUsers().getMa());
        message.setUsers(u);
        message.setTimestamp(LocalDateTime.now());
        message.setBientrunggian(message.getBientrunggian());
        message.setTrangThai(message.getTrangThai());

        if (u.getRole() == RoleEnum.MENBER){
            message.setTrangThai(1);
        }else {
            message.setTrangThai(0);
        }

        chatMessageRepository.save(message);
        if (message.getUsers().getRole()==RoleEnum.MENBER){
            demChatRepository.save(new DemChat(message.getBientrunggian(),message.getBientrunggian()));
            ThoiGian thoiGian = new ThoiGian();
            thoiGian.setId(Integer.parseInt(message.getUsers().getMa()));
            thoiGian.setUsers(message.getUsers());
            thoiGian.setTimestamp(LocalDateTime.now());
            thoiGianRepository.save(thoiGian);
        }
        // Xử lý tin nhắn ở đây và gửi lại cho phòng riêng tư cụ thể
        messagingTemplate.convertAndSend("/topic/privateRoomName/" + message.getBientrunggian(), message);
        return message;
    }

    @GetMapping("user/chat/{ma}")
    public String chatPage(@PathVariable String ma, Model model) {
        model.addAttribute("check", ma);
        List<MessageChat> messages = chatMessageRepository.findAllByBientrunggian(ma);
        model.addAttribute("messages", messages);
        return "/admin/chat_app1";
    }

    @GetMapping("admin/chat/{ma}")
    public String chatPage1(@PathVariable String ma, Model model, HttpServletRequest request) {

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;
        if (user.getRole() == RoleEnum.STAFF){
            model.addAttribute("adminOrStaff", "1");
        }else if (user.getRole() == RoleEnum.ADMIN){
            model.addAttribute("adminOrStaff", "2");
        }
        model.addAttribute("nameUser", user.getTen());

        model.addAttribute("user",chatMessageRepository.Alluser());
        model.addAttribute("check", ma);
        Users u = userRepository.findByMa(ma);
        model.addAttribute("ten", u.getTen());
        Users u1 = userRepository.findByRole1(RoleEnum.ADMIN);
        model.addAttribute("check1", u1.getMa());
        List<MessageChat> messages = chatMessageRepository.findAllByBientrunggian(ma);
        model.addAttribute("messages", messages);

        String bienTrungGianByUser = chatMessageRepository.bienTrungGianByUser(u.getId());

        List<MessageChat> listMessageChats = chatMessageRepository.listChat(bienTrungGianByUser);

        MessageChat upChat = listMessageChats.get(0);

        MessageChat messageChat = new MessageChat();

        messageChat.setUsers(upChat.getUsers());
        messageChat.setTimestamp(upChat.getTimestamp());
        messageChat.setBientrunggian(upChat.getBientrunggian());
        messageChat.setContent(upChat.getContent());
        messageChat.setTrangThai(0);

        chatSer.update(upChat.getId(), messageChat);
        List<Users> listUsers = chatMessageRepository.Alluser();

        List<ChatDTO> listChatDTOS = new ArrayList<>();

        for (Users users : listUsers){
            String bienTrungGianByUser1 = chatMessageRepository.bienTrungGianByUser(users.getId());

            List<MessageChat> listMessageChats1 = chatMessageRepository.listChat(bienTrungGianByUser1);
            ChatDTO chatDTO = new ChatDTO();
            if(listMessageChats1.get(0).getTrangThai() == 0){
                chatDTO.setSl(0);
            }else {
                chatDTO.setSl(1);
            }
            chatDTO.setUsers(users);
            listChatDTOS.add(chatDTO);
        }

        model.addAttribute("user",chatMessageRepository.Alluser());
        model.addAttribute("listChatDTOS",listChatDTOS);
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());
        return "/admin/chat_app";
    }
    @GetMapping("admin/chat")
    public String chatPage12(Model model, HttpServletRequest request) {

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;
        if (user.getRole() == RoleEnum.STAFF){
            model.addAttribute("adminOrStaff", "1");
        }else if (user.getRole() == RoleEnum.ADMIN){
            model.addAttribute("adminOrStaff", "2");
        }
        model.addAttribute("nameUser", user.getTen());

        List<Users> listUsers = chatMessageRepository.Alluser();

        List<ChatDTO> listChatDTOS = new ArrayList<>();

        for (Users users : listUsers){
            String bienTrungGianByUser = chatMessageRepository.bienTrungGianByUser(users.getId());

            List<MessageChat> listMessageChats = chatMessageRepository.listChat(bienTrungGianByUser);

            ChatDTO chatDTO = new ChatDTO();

            if(listMessageChats.get(0).getTrangThai() == 0){
                chatDTO.setSl(0);
            }else {
                chatDTO.setSl(1);
            }

            chatDTO.setUsers(users);

            listChatDTOS.add(chatDTO);
        }

        model.addAttribute("user",chatMessageRepository.Alluser());
        model.addAttribute("listChatDTOS",listChatDTOS);
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());
        demChatRepository.deleteAll();
        return "/admin/chat_app";
    }
//    @GetMapping("/chat/admin")
//    public String chatadmin(Model model) {
//        List<Message> messages = chatMessageRepository.findAllByBientrunggian("003");
//        model.addAttribute("messages", messages);
//        return "/admin/chat1";
//    }
//
//    @PostMapping("/send")
//    @ResponseBody
//    public String sendMessage(@RequestParam String content) {
//        Message message = new Message();
//        message.setContent(content);
//        Users u = userRepository.findByMa("003");
//        message.setUsers(u);
//        message.setTimestamp(LocalDateTime.now());
//        message.setBientrunggian(u.getMa());
//        chatMessageRepository.save(message);
//        return "Message sent";
//    }
//    @PostMapping("/send1")
//    @ResponseBody
//    public String senadmin(@RequestParam String content) {
//        Message message = new Message();
//        message.setContent(content);
//        Users u = userRepository.findByMa("Admin");
//        message.setUsers(u);
//        message.setTimestamp(LocalDateTime.now());
//        message.setBientrunggian("003");
//        chatMessageRepository.save(message);
//        return "Message sent";
//    }
}
