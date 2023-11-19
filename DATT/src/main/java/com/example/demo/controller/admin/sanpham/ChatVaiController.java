package com.example.demo.controller.admin.sanpham;

import com.example.demo.entity.auth.RoleEnum;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.entity.sanpham.ChatVai;
import com.example.demo.entity.sanpham.HuongDanBaoQuan;
import com.example.demo.repo.sanpham.ChatVaiRepo;
import com.example.demo.ser.chat.ChatSer;
import com.example.demo.ser.sanpham.ChatVaiSer;
import com.example.demo.ser.sanpham.HuongDanBaoQuanSer;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.UUID;

@Controller
public class ChatVaiController {

    @Autowired
    ChatVaiSer chatVaiSer;

    @Autowired
    HuongDanBaoQuanSer huongDanBaoQuanSer;

    @Autowired
    ChatVaiRepo chatVaiRepo;

    @Autowired
    ChatSer chatSer;

    @GetMapping("/admin/chat_vai/view/*")
    public String view(Model model, HttpServletRequest request) {

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;
        if (user.getRole() == RoleEnum.STAFF){
            model.addAttribute("adminOrStaff", "1");
        }else if (user.getRole() == RoleEnum.ADMIN){
            model.addAttribute("adminOrStaff", "2");
        }
        model.addAttribute("nameUser", user.getTen());

        List<ChatVai> listChatVais = chatVaiSer.getAll();
        model.addAttribute("listChatVais", listChatVais);

        List<HuongDanBaoQuan> listHuongDanBaoQuans = huongDanBaoQuanSer.findByAllByTrangThai(1);
        model.addAttribute("listHuongDanBaoQuans", listHuongDanBaoQuans);

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/chat_vai/view/");
        String id = parts[1];

        try {
            ChatVai chatVai = chatVaiSer.findById(UUID.fromString(id));
            model.addAttribute("item", chatVai);
        } catch (Exception e) {

        }
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());
        return "/admin/chat_vai";
    }

    @PostMapping("/admin/chat_vai/add")
    public String add(HttpServletRequest request){
        int slCv = chatVaiRepo.soCV() + 1;
        String ten = request.getParameter("ten");
        String thongtin = request.getParameter("thongtin");
        String huongDanBaoQuanId = request.getParameter("huongDanBaoQuanId");
        String trangthai = request.getParameter("trangthai");

        HuongDanBaoQuan huong_dan_bao_quan = huongDanBaoQuanSer.findById(UUID.fromString(huongDanBaoQuanId));

        ChatVai chatVai = new ChatVai();

        chatVai.setMa("CV"+slCv);
        chatVai.setTen(ten);
        chatVai.setThongtin(thongtin);
        chatVai.setHuong_dan_bao_quan(huong_dan_bao_quan);
        chatVai.setTrangthai(Integer.parseInt(trangthai));

        chatVaiSer.add(chatVai);

        return "redirect:/admin/chat_vai/view/1";
    }

    @PostMapping("/admin/chat_vai/update")
    public String update(HttpServletRequest request){
        String id = request.getParameter("id");
        String ten = request.getParameter("ten");
        String thongtin = request.getParameter("thongtin");
        String huongDanBaoQuanId = request.getParameter("huongDanBaoQuanId");
        String trangthai = request.getParameter("trangthai");

        HuongDanBaoQuan huong_dan_bao_quan = huongDanBaoQuanSer.findById(UUID.fromString(huongDanBaoQuanId));

        ChatVai cv = chatVaiSer.findById(UUID.fromString(id));
        ChatVai chatVai = new ChatVai();

        chatVai.setTen(ten);
        chatVai.setMa(cv.getMa());
        chatVai.setThongtin(thongtin);
        chatVai.setHuong_dan_bao_quan(huong_dan_bao_quan);
        chatVai.setTrangthai(Integer.parseInt(trangthai));

        chatVaiSer.update(UUID.fromString(id),chatVai);

        return "redirect:/admin/chat_vai/view/1";
    }


    @PostMapping("/admin/chat_vai/detail")
    public String detail(HttpServletRequest request) {
        String id = request.getParameter("detail");
        ChatVai chatVai = chatVaiSer.findById(UUID.fromString(id));

        return "redirect:/admin/chat_vai/view/" + chatVai.getId();
    }

    @PostMapping("/admin/chat_vai/clear")
    public String clear() {
        return "redirect:/admin/chat_vai/view/1";
    }

}
