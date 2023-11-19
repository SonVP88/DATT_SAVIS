package com.example.demo.controller.admin.sanpham;

import com.example.demo.entity.auth.RoleEnum;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.entity.sanpham.HuongDanBaoQuan;
import com.example.demo.repo.sanpham.HuongDanBaoQuanRepo;
import com.example.demo.ser.chat.ChatSer;
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
public class HuongDanBaoQuanController {

    @Autowired
    HuongDanBaoQuanSer huongDanBaoQuanSer;

    @Autowired
    HuongDanBaoQuanRepo huongDanBaoQuanRepo;

    @Autowired
    ChatSer chatSer;

    @GetMapping("/admin/huong_dan_bao_quan/view/*")
    public String view(Model model, HttpServletRequest request) {

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;
        if (user.getRole() == RoleEnum.STAFF){
            model.addAttribute("adminOrStaff", "1");
        }else if (user.getRole() == RoleEnum.ADMIN){
            model.addAttribute("adminOrStaff", "2");
        }
        model.addAttribute("nameUser", user.getTen());

        List<HuongDanBaoQuan> listHuongDanBaoQuans = huongDanBaoQuanSer.getAll();
        model.addAttribute("listHuongDanBaoQuans", listHuongDanBaoQuans);

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/huong_dan_bao_quan/view/");
        String id = parts[1];

        try {
            HuongDanBaoQuan huong_dan_bao_quan = huongDanBaoQuanSer.findById(UUID.fromString(id));
            model.addAttribute("item", huong_dan_bao_quan);
        } catch (Exception e) {

        }
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());
        return "/admin/huong_dan_bao_quan";
    }

    @PostMapping("/admin/huong_dan_bao_quan/add")
    public String add(HttpServletRequest request) {
        int slHDBQ = huongDanBaoQuanRepo.soHDBQ() + 1;
        String ten = request.getParameter("ten");
        String chitiet = request.getParameter("chitiet");
        String trangthai = request.getParameter("trangthai");

        HuongDanBaoQuan huongDanBaoQuan = new HuongDanBaoQuan();

        huongDanBaoQuan.setMa("HDBQ"+ slHDBQ);
        huongDanBaoQuan.setTen(ten);
        huongDanBaoQuan.setChitiet(chitiet);
        huongDanBaoQuan.setTrangthai(Integer.parseInt(trangthai));

        huongDanBaoQuanSer.add(huongDanBaoQuan);
        return "redirect:/admin/huong_dan_bao_quan/view/1";
    }

    @PostMapping("/admin/huong_dan_bao_quan/update")
    public String update(HttpServletRequest request) {
        String id = request.getParameter("id");
        String ten = request.getParameter("ten");
        String chitiet = request.getParameter("chitiet");
        String trangthai = request.getParameter("trangthai");

        HuongDanBaoQuan hdbq = huongDanBaoQuanSer.findById(UUID.fromString(id));

        HuongDanBaoQuan huongDanBaoQuan = new HuongDanBaoQuan();

        huongDanBaoQuan.setMa(hdbq.getMa());
        huongDanBaoQuan.setTen(ten);
        huongDanBaoQuan.setChitiet(chitiet);
        huongDanBaoQuan.setTrangthai(Integer.parseInt(trangthai));

        huongDanBaoQuanSer.update(UUID.fromString(id), huongDanBaoQuan);

        return "redirect:/admin/huong_dan_bao_quan/view/1";
    }

    @PostMapping("/admin/huong_dan_bao_quan/detail")
    public String detail(HttpServletRequest request) {
        String id = request.getParameter("detail");
        HuongDanBaoQuan huong_dan_bao_quan = huongDanBaoQuanSer.findById(UUID.fromString(id));

        return "redirect:/admin/huong_dan_bao_quan/view/" + huong_dan_bao_quan.getId();
    }

    @PostMapping("/admin/huong_dan_bao_quan/clear")
    public String clear() {
        return "redirect:/admin/huong_dan_bao_quan/view/1";
    }
}
