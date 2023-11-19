package com.example.demo.controller.admin.sanpham;

import com.example.demo.entity.auth.RoleEnum;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.entity.sanpham.Form;
import com.example.demo.repo.sanpham.FormRepo;
import com.example.demo.ser.chat.ChatSer;
import com.example.demo.ser.sanpham.FormSer;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.UUID;

@Controller
public class FormController {

    @Autowired
    FormSer formSer;

    @Autowired
    FormRepo formRepo;

    @Autowired
    ChatSer chatSer;

    @GetMapping("/admin/form/view/*")
    public String view(Model model, HttpServletRequest request) {

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;
        if (user.getRole() == RoleEnum.STAFF){
            model.addAttribute("adminOrStaff", "1");
        }else if (user.getRole() == RoleEnum.ADMIN){
            model.addAttribute("adminOrStaff", "2");
        }
        model.addAttribute("nameUser", user.getTen());

        List<Form> listForms = formSer.getAll();
        model.addAttribute("listForms", listForms);

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/form/view/");
        String id = parts[1];

        try {
            Form form = formSer.findById(UUID.fromString(id));
            model.addAttribute("item", form);
        } catch (Exception e) {

        }
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());
        return "/admin/form";
    }

    @PostMapping("/admin/form/add")
    public String add(Model model, HttpServletRequest request) {

        int slF = formRepo.soF() + 1;
        String ten = request.getParameter("ten");
        String trangthai = request.getParameter("trangthai");

        Form form = new Form();

        form.setMa("AO-"+slF);
        form.setTen(ten);
        form.setTrangthai(Integer.parseInt(trangthai));

        formSer.add(form);
        return "redirect:/admin/form/view/1";
    }

    @PostMapping("/admin/form/update")
    public String update(Model model, HttpServletRequest request) {

        String id = request.getParameter("id");

        String ten = request.getParameter("ten");
        String trangthai = request.getParameter("trangthai");

        Form f = formSer.findById(UUID.fromString(id));

        Form form = new Form();

        form.setMa(f.getMa());
        form.setTen(ten);
        form.setTrangthai(Integer.parseInt(trangthai));

        formSer.update(UUID.fromString(id), form);
        return "redirect:/admin/form/view/1";
    }

    @PostMapping("/admin/form/detail")
    public String detail(Model model, HttpServletRequest request) {

        String id = request.getParameter("detail");
        Form form = formSer.findById(UUID.fromString(id));

        return "redirect:/admin/form/view/"+ form.getId();
    }

    @PostMapping("/admin/form/clear")
    public String clear() {
        return "redirect:/admin/form/view/1";
    }
}
