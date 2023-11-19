package com.example.demo.controller.admin.sanpham;

import com.example.demo.entity.auth.RoleEnum;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.entity.sanpham.LoaiAo;
import com.example.demo.repo.sanpham.LoaiAoRepo;
import com.example.demo.ser.chat.ChatSer;
import com.example.demo.ser.sanpham.LoaiAoSer;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

@Controller
public class LoaiAoController {

    @Autowired
    LoaiAoSer loaiAoSer;

    @Autowired
    LoaiAoRepo loaiAoRepo;

    @Autowired
    ChatSer chatSer;

    @GetMapping("/admin/loai_ao/view/*")
    public String view(Model model, HttpServletRequest request) {

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;
        if (user.getRole() == RoleEnum.STAFF){
            model.addAttribute("adminOrStaff", "1");
        }else if (user.getRole() == RoleEnum.ADMIN){
            model.addAttribute("adminOrStaff", "2");
        }
        model.addAttribute("nameUser", user.getTen());

        List<LoaiAo> listLoaiAos = loaiAoSer.getAll();
        model.addAttribute("listLoaiAos", listLoaiAos);

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/loai_ao/view/");
        String id = parts[1];

        try {
            LoaiAo loaiAo = loaiAoSer.findById(UUID.fromString(id));
            model.addAttribute("item", loaiAo);
        } catch (Exception e) {
        }
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());
        return "/admin/loai_ao";
    }

    @PostMapping("/admin/loai_ao/add")
    public String add(@RequestPart("tenURL") MultipartFile file, Model model, HttpServletRequest request) {

        int slLA = loaiAoRepo.soLA() + 1;
        String ten = request.getParameter("ten");
        String trangthai = request.getParameter("trangthai");

        Path path = Paths.get("src/main/webapp/images/");

        try {
            InputStream inputStream = file.getInputStream();
            Files.copy(inputStream, path.resolve(file.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);

        } catch (IOException e) {
            e.printStackTrace();
        }

        LoaiAo loaiAo = new LoaiAo();

        loaiAo.setMa("LA" + slLA);
        loaiAo.setTen(ten);
        loaiAo.setTenURL(file.getOriginalFilename());
        loaiAo.setTrangthai(Integer.parseInt(trangthai));

        loaiAoSer.add(loaiAo);
        return "redirect:/admin/loai_ao/view/1";
    }

    @PostMapping("/admin/loai_ao/update")
    public String update(@RequestPart("tenURL") MultipartFile file, Model model, HttpServletRequest request) {

        String id = request.getParameter("id");
        String ten = request.getParameter("ten");
        String trangthai = request.getParameter("trangthai");

        Path path = Paths.get("src/main/webapp/images/");

        try {
            InputStream inputStream = file.getInputStream();
            Files.copy(inputStream, path.resolve(file.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);

        } catch (IOException e) {
            e.printStackTrace();
        }

        LoaiAo la = loaiAoSer.findById(UUID.fromString(id));
        LoaiAo loaiAo = new LoaiAo();

        loaiAo.setMa(la.getMa());
        loaiAo.setTen(ten);
        loaiAo.setTenURL(file.getOriginalFilename());
        loaiAo.setTrangthai(Integer.parseInt(trangthai));

        loaiAoSer.update(UUID.fromString(id), loaiAo);
        return "redirect:/admin/loai_ao/view/1";
    }

    @PostMapping("/admin/loai_ao/detail")
    public String detail(Model model, HttpServletRequest request) {

        String id = request.getParameter("detail");
        LoaiAo loaiAo = loaiAoSer.findById(UUID.fromString(id));

        return "redirect:/admin/loai_ao/view/" + loaiAo.getId();
    }

    @PostMapping("/admin/loai_ao/clear")
    public String clear() {
        return "redirect:/admin/loai_ao/view/1";
    }
}
