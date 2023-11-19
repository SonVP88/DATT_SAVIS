package com.example.demo.controller.admin.quanli;

import com.example.demo.entity.auth.RoleEnum;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.repo.users.UsersRepo;
import com.example.demo.ser.chat.ChatSer;
import com.example.demo.ser.users.UsersSer;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.UUID;

@Controller
public class TaiKhoanController {
    @Autowired
    UsersRepo usersRepo;

    @Autowired
    UsersSer usersSer;

    @Autowired
    ChatSer chatSer;

    @GetMapping("/admin/khachhang/*")
    public String view(Model model, HttpServletRequest request) {

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;
        if (user.getRole() == RoleEnum.STAFF){
            model.addAttribute("adminOrStaff", "1");
        }else if (user.getRole() == RoleEnum.ADMIN){
            model.addAttribute("adminOrStaff", "2");
        }
        model.addAttribute("nameUser", user.getTen());

        List<Users> listKhachHang = usersRepo.findAllKhachHang();
        model.addAttribute("listKhachHang", listKhachHang);
        String url = request.getRequestURI();
        String[] parts = url.split("/admin/khachhang/");
        String id = parts[1];
        try {
            Users u = usersRepo.findUsersById(UUID.fromString(id));
            model.addAttribute("item", u);
        } catch (Exception e) {

        }
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());
        return "/admin/khachhang";
    }

    @PostMapping("/admin/khachhang/add")
    public String add(Model model, HttpServletRequest request) {

        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        String diaChi = request.getParameter("diaChi");
        String gioiTinh = request.getParameter("gioiTinh");
        String ngaySinh = request.getParameter("ngay_sinh");
        String thanhPho = request.getParameter("thanh_pho");
        String quocGia = request.getParameter("quoc_gia");
        String sdt = request.getParameter("sdt");
        String email = request.getParameter("email");
        String matKhau = request.getParameter("matKhau");
        Integer trangthai = Integer.parseInt(request.getParameter("trangthai"));

        Users users = new Users(null, ma, ten, gioiTinh, ngaySinh, diaChi, thanhPho, quocGia, sdt, email, matKhau, RoleEnum.MENBER, trangthai);

        usersRepo.save(users);

        return "redirect:/admin/khachhang/1";
    }
    @PostMapping("/admin/nhanvien/add")
    public String add1(Model model, HttpServletRequest request) {

        int slKH = usersSer.soLuongUser() + 3;
        String ma = "00" + slKH;

        String ten = request.getParameter("ten");
        String diaChi = request.getParameter("diaChi");
        String gioiTinh = request.getParameter("gioiTinh");
        String ngaySinh = request.getParameter("ngay_sinh");
        String thanhPho = request.getParameter("thanh_pho");
        String quocGia = request.getParameter("quoc_gia");
        String sdt = request.getParameter("sdt");
        String email = request.getParameter("email");
        String matKhau = request.getParameter("matKhau");
        Integer trangthai = Integer.parseInt(request.getParameter("trangthai"));

        Users users = new Users(null, ma, ten, gioiTinh, ngaySinh, diaChi, thanhPho, quocGia, sdt, email, matKhau, RoleEnum.STAFF, trangthai);

        usersRepo.save(users);

        return "redirect:/admin/nhanvien/1";
    }

    @PostMapping("/admin/khachhang/update")
    public String update(Model model, HttpServletRequest request) {
        String id = request.getParameter("id");
        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        String diaChi = request.getParameter("dia_chi");
        String gioiTinh = request.getParameter("gioiTinh");
        String ngaySinh = request.getParameter("ngay_sinh");
        String thanhPho = request.getParameter("thanh_pho");
        String quocGia = request.getParameter("quoc_gia");
        String sdt = request.getParameter("sdt");
        String email = request.getParameter("email");
        String matKhau = request.getParameter("matKhau");
        Integer trangthai = Integer.parseInt(request.getParameter("trangthai"));

        Users users = new Users(UUID.fromString(id), ma, ten, gioiTinh, ngaySinh, diaChi, thanhPho, quocGia, sdt, email, matKhau, RoleEnum.MENBER, trangthai);

        usersRepo.save(users);

        return "redirect:/admin/khachhang/1";
    }

    @GetMapping("/admin/nhanvien/*")
    public String view1(Model model, HttpServletRequest request) {

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;
        if (user.getRole() == RoleEnum.STAFF){
            model.addAttribute("adminOrStaff", "1");
        }else if (user.getRole() == RoleEnum.ADMIN){
            model.addAttribute("adminOrStaff", "2");
        }
        model.addAttribute("nameUser", user.getTen());

        List<Users> listNhanVien = usersRepo.findAllNhanVien();
        model.addAttribute("listNhanVien", listNhanVien);
        String url = request.getRequestURI();
        String[] parts = url.split("/admin/nhanvien/");
        String id = parts[1];
        try {
            Users u = usersRepo.findUsersById(UUID.fromString(id));
            model.addAttribute("item", u);
        } catch (Exception e) {

        }
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());
        return "/admin/nhanvien";
    }

    @PostMapping("/admin/nhanvien/update")
    public String update1(Model model, HttpServletRequest request) {
        String id = request.getParameter("id");
        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        String diaChi = request.getParameter("diaChi");
        String gioiTinh = request.getParameter("gioiTinh");
        String ngaySinh = request.getParameter("ngay_sinh");
        String thanhPho = request.getParameter("thanh_pho");
        String quocGia = request.getParameter("quoc_gia");
        String sdt = request.getParameter("sdt");
        String email = request.getParameter("email");
        String matKhau = request.getParameter("matKhau");
        Integer trangthai = Integer.parseInt(request.getParameter("trangthai"));

        Users users = new Users(UUID.fromString(id), ma, ten, gioiTinh, ngaySinh, diaChi, thanhPho, quocGia, sdt, email, matKhau, RoleEnum.STAFF, trangthai);
        Users user = usersSer.findById(UUID.fromString(id));
        users.setMa(user.getMa());
        usersRepo.save(users);
        System.out.println(diaChi);
        System.out.println(thanhPho);
        System.out.println(quocGia);
        return "redirect:/admin/nhanvien/1";
    }

    @PostMapping("/admin/khachhang/detail")
    public String detail(Model model, HttpServletRequest request) {

        String id = request.getParameter("detail");
        Users u = usersRepo.findUsersById(UUID.fromString(id));

        return "redirect:/admin/khachhang/" + u.getId();
    }
    @PostMapping("/admin/nhanvien/detail")
    public String detail1(Model model, HttpServletRequest request) {

        String id = request.getParameter("detail");
        Users u = usersRepo.findUsersById(UUID.fromString(id));

        return "redirect:/admin/nhanvien/" + u.getId();
    }

//    @PostMapping("/admin/khachhang/delete")
//    public String delete(Model model, HttpServletRequest request) {
//
//        String id = request.getParameter("delete");
//        Users u = usersRepo.findUsersById(UUID.fromString(id));
//        usersRepo.delete(u);
//
//        return "redirect:/admin/khachhang/" + u.getId();
//    }

    @PostMapping("/admin/khachhang/clear")
    public String clear() {
        return "redirect:/admin/khachhang/1";
    }
    @PostMapping("/admin/nhanvien/clear")
    public String clear1() {
        return "redirect:/admin/nhanvien/1";
    }
}
