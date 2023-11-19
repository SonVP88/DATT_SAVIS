package com.example.demo.controller.admin.sanpham;

import com.example.demo.entity.auth.RoleEnum;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.entity.sanpham.MauSac;
import com.example.demo.repo.sanpham.MauSacRepo;
import com.example.demo.ser.chat.ChatSer;
import com.example.demo.ser.sanpham.MauSacSer;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.UUID;

@Controller
public class MauSacController {

    @Autowired
    MauSacSer mauSacSer;

    @Autowired
    MauSacRepo mauSacRepo;

    @Autowired
    ChatSer chatSer;

    @GetMapping("/admin/mau_sac/view/*")
    public String view(Model model, HttpServletRequest request) {

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;
        if (user.getRole() == RoleEnum.STAFF){
            model.addAttribute("adminOrStaff", "1");
        }else if (user.getRole() == RoleEnum.ADMIN){
            model.addAttribute("adminOrStaff", "2");
        }
        model.addAttribute("nameUser", user.getTen());

        List<MauSac> listMauSacs = mauSacSer.getAll();
        model.addAttribute("listMauSacs", listMauSacs);

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/mau_sac/view/");
        String id = parts[1];

        try {
            MauSac mauSac = mauSacSer.findById(UUID.fromString(id));
            model.addAttribute("item", mauSac);
        } catch (Exception e) {

        }
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());
        return "/admin/mau_sac";
    }

    @PostMapping("/admin/mau_sac/add")
    public String add(Model model, HttpServletRequest request) {

        int slCv = mauSacRepo.soMS() + 1;
        String ten = request.getParameter("ten");
        String trangthai = request.getParameter("trangthai");

        MauSac mauSac = new MauSac();

        mauSac.setMa("MauSac"+slCv);
        mauSac.setTen(ten);
        mauSac.setTrangthai(Integer.parseInt(trangthai));

        mauSacSer.add(mauSac);
        return "redirect:/admin/mau_sac/view/1";
    }

    @PostMapping("/admin/mau_sac/update")
    public String update(Model model, HttpServletRequest request) {

        String id = request.getParameter("id");
        String ten = request.getParameter("ten");
        String trangthai = request.getParameter("trangthai");

        MauSac ms = mauSacSer.findById(UUID.fromString(id));
        MauSac mauSac = new MauSac();

        mauSac.setMa(ms.getMa());
        mauSac.setTen(ten);
        mauSac.setTrangthai(Integer.parseInt(trangthai));

        mauSacSer.update(UUID.fromString(id), mauSac);
        return "redirect:/admin/mau_sac/view/1";
    }

    @PostMapping("/admin/mau_sac/detail")
    public String detail(Model model, HttpServletRequest request) {

        String id = request.getParameter("detail");
        MauSac mauSac = mauSacSer.findById(UUID.fromString(id));

        return "redirect:/admin/mau_sac/view/"+ mauSac.getId();
    }

    @PostMapping("/admin/mau_sac/clear")
    public String clear() {
        return "redirect:/admin/mau_sac/view/1";
    }
}
