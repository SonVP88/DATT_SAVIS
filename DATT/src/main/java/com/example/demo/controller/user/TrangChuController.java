package com.example.demo.controller.user;

import com.example.demo.entity.auth.RoleEnum;
import com.example.demo.entity.chat.MessageChat;
import com.example.demo.entity.giamgia.GiamGiaSanPham;
import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;
import com.example.demo.entity.khachhang.DanhGia;
import com.example.demo.entity.khachhang.GioHang;
import com.example.demo.entity.khachhang.HoaDon;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.dto.AoDTO;
import com.example.demo.entity.sanpham.AoChiTiet;
import com.example.demo.entity.sanpham.LoaiAo;
import com.example.demo.repo.chat.ChatMessageRepository;
import com.example.demo.repo.giamgia.GiamGiaSanPhamChiTietRepo;
import com.example.demo.repo.sanpham.AoRepo;
import com.example.demo.repo.users.UsersRepo;
import com.example.demo.ser.giamgia.GiamGiaSanPhamChiTietSer;
import com.example.demo.ser.giamgia.GiamGiaSanPhamSer;
import com.example.demo.ser.sanpham.ChatVaiSer;
import com.example.demo.ser.sanpham.FormSer;
import com.example.demo.ser.sanpham.HangSer;
import com.example.demo.ser.sanpham.MauSacSer;
import com.example.demo.ser.users.DanhGiaSer;
import com.example.demo.ser.users.GioHangChiTietSer;
import com.example.demo.ser.users.GioHangSer;
import com.example.demo.ser.users.HoaDonSer;
import com.example.demo.ser.users.UsersSer;
import com.example.demo.ser.sanpham.AnhSer;
import com.example.demo.ser.sanpham.AoChiTietSer;
import com.example.demo.ser.sanpham.AoSer;
import com.example.demo.ser.sanpham.LoaiAoSer;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class TrangChuController {

    @Autowired
    AoSer aoSer;

    @Autowired
    LoaiAoSer loaiAoSer;

    @Autowired
    AoChiTietSer aoChiTietSer;

    @Autowired
    GiamGiaSanPhamSer giamGiaSanPhamSer;

    @Autowired
    GiamGiaSanPhamChiTietSer giamGiaSanPhamChiTietSer;

    @Autowired
    UsersSer usersSer;

    @Autowired
    AnhSer anhSer;

    @Autowired
    GioHangSer gioHangSer;

    @Autowired
    GioHangChiTietSer gioHangChiTietSer;

    @Autowired
    ChatVaiSer chatVaiSer;

    @Autowired
    FormSer formSer;

    @Autowired
    HangSer hangSer;

    @Autowired
    MauSacSer mauSacSer;

    @Autowired
    AoRepo aoRepo;

    @Autowired
    GiamGiaSanPhamChiTietRepo giamGiaSanPhamChiTietRepo;

    @Autowired
    DanhGiaSer danhGiaSer;

    @Autowired
    private SimpMessagingTemplate messagingTemplate;

    @Autowired
    private ChatMessageRepository chatMessageRepository;

    @Autowired
    private UsersRepo userRepository;

    @Autowired
    HoaDonSer hoaDonSer;

    @GetMapping("/user/trang_chu/*")
    public String trangChu(Model model, HttpServletRequest request, HttpSession session) {

        List<LoaiAo> listLoaiAos = loaiAoSer.findAllByTrangThai(1);
        List<AoDTO> listTop8Aos = aoSer.findTop8AoBanChay();
        List<GiamGiaSanPham> listTop2GiamGiaSanPhams = giamGiaSanPhamSer.findTop2GiamGiaSanPham();
        List<GiamGiaSanPhamChiTiet> listGiamGiaSanPhamChiTiets = giamGiaSanPhamChiTietSer.findAllByTrangThai(0);
        List<Ao> listAo = aoSer.findAllByTrangThai(2);
        List<AoDTO> listAos = aoSer.findByAo(listAo);
        List<Ao> listAoMoiTrongThang = aoSer.findAoNhapTrongThangHienTai();
        List<AoDTO> listAoDTOMoi = aoSer.findByAo(listAoMoiTrongThang);

        model.addAttribute("listLoaiAos", listLoaiAos);
        model.addAttribute("listTop8Aos", listTop8Aos);
        model.addAttribute("listTop2GiamGiaSanPhams", listTop2GiamGiaSanPhams);
        model.addAttribute("listGiamGiaSanPhamChiTiets", listGiamGiaSanPhamChiTiets);
        model.addAttribute("listAos", listAos);
        model.addAttribute("listAoDTOMoi", listAoDTOMoi);

        String url = request.getRequestURI();
        String[] parts = url.split("/user/trang_chu/");
        String ma = parts[1];

        try {
            Users users = usersSer.findByMa(ma);
            GioHang gioHang = gioHangSer.findByIdKH(users.getId());
            Long soLuongSanPham = gioHangChiTietSer.soLuongSanPhamGioHang(gioHang.getId());

            model.addAttribute("idKh", users.getMa());
            model.addAttribute("soLuongSanPham", soLuongSanPham);

            model.addAttribute("check", ma);
            List<MessageChat> messages = chatMessageRepository.findAllByBientrunggian(ma);
            model.addAttribute("messages", messages);
        } catch (Exception e) {
            model.addAttribute("idKh", "2");
        }

        String idAo = (String) session.getAttribute("idAo");

        System.out.println(idAo);

        if (idAo == null) {
            model.addAttribute("noneOrBlock", "none");
        } else {
            model.addAttribute("ao", aoSer.findById(UUID.fromString(idAo)));
            model.addAttribute("slAoDaBan", aoSer.soLuongBanByUUID(UUID.fromString(idAo)));
            model.addAttribute("anhs", anhSer.findAllByAoId(UUID.fromString(idAo)));
            model.addAttribute("mauSacs", aoChiTietSer.findMauSacByIdAo(UUID.fromString(idAo)));
            model.addAttribute("sizes", aoChiTietSer.findSizeByIdAo(UUID.fromString(idAo)));

            try {
                GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietSer.findByIdAoAndTrangThai(UUID.fromString(idAo));
                model.addAttribute("giamgia", giamGiaSanPhamChiTiet.getGiamGiaSanPham().getPhanTramGiam());
                model.addAttribute("time", giamGiaSanPhamChiTiet.getGiamGiaSanPham().getNgayKetThuc());
            } catch (Exception e) {
                model.addAttribute("giamgia", "2");
            }

            model.addAttribute("noneOrBlock", "block");
        }
        session.removeAttribute("idAo");

        return "/user/index";
    }

    @GetMapping("/user/contact/*")
    public String contact( HttpServletRequest request, Model model){
        String url = request.getRequestURI();
        String[] parts = url.split("/user/contact/");
        String ma = parts[1];

        try {
            Users users = usersSer.findByMa(ma);
            GioHang gioHang = gioHangSer.findByIdKH(users.getId());
            Long soLuongSanPham = gioHangChiTietSer.soLuongSanPhamGioHang(gioHang.getId());

            model.addAttribute("idKh", users.getMa());
            model.addAttribute("soLuongSanPham", soLuongSanPham);

            model.addAttribute("check", ma);
            List<MessageChat> messages = chatMessageRepository.findAllByBientrunggian(ma);
            model.addAttribute("messages", messages);
        } catch (Exception e) {
            model.addAttribute("idKh", "2");
        }
        List<LoaiAo> listLoaiAos = loaiAoSer.findAllByTrangThai(1);
        model.addAttribute("listLoaiAos", listLoaiAos);
        return "/user/contact";
    }

    @GetMapping("/user/blog/*")
    public String blog( HttpServletRequest request, Model model){
        String url = request.getRequestURI();
        String[] parts = url.split("/user/blog/");
        String ma = parts[1];

        try {
            Users users = usersSer.findByMa(ma);
            GioHang gioHang = gioHangSer.findByIdKH(users.getId());
            Long soLuongSanPham = gioHangChiTietSer.soLuongSanPhamGioHang(gioHang.getId());

            model.addAttribute("idKh", users.getMa());
            model.addAttribute("soLuongSanPham", soLuongSanPham);

            model.addAttribute("check", ma);
            List<MessageChat> messages = chatMessageRepository.findAllByBientrunggian(ma);
            model.addAttribute("messages", messages);
        } catch (Exception e) {
            model.addAttribute("idKh", "2");
        }
        List<LoaiAo> listLoaiAos = loaiAoSer.findAllByTrangThai(1);
        model.addAttribute("listLoaiAos", listLoaiAos);
        return "/user/blog";
    }

    @GetMapping("/user/san_pham_detail/*/*")
    public String sanPhamDetail(HttpServletRequest request, Model model) {

        String url = request.getRequestURI();
        String[] p = url.split("/user/san_pham_detail/");
        String idStr = p[1];
        String[] idSt = idStr.split("/");
        String id = idSt[1];
        try {
            Users users = usersSer.findByMa(idSt[0]);
            GioHang gioHang = gioHangSer.findByIdKH(users.getId());
            Long soLuongSanPham = gioHangChiTietSer.soLuongSanPhamGioHang(gioHang.getId());

            model.addAttribute("idKh", users.getMa());
            model.addAttribute("soLuongSanPham", soLuongSanPham);
        } catch (Exception e) {
            model.addAttribute("idKh", "2");
        }

        Integer tongDanhGiaSao = danhGiaSer.tongDanhGiaSao(UUID.fromString(id));
        int tongNguoiDanhGia = danhGiaSer.tongNguoiDanhGia(UUID.fromString(id));
        int danhGiaSao ;
        int danhGiaDu ;
        if(tongNguoiDanhGia == 0){
            danhGiaSao = 5;
            danhGiaDu = 0;
        }else {
            float danhGiaSaoFloat = (float) tongDanhGiaSao / tongNguoiDanhGia;
            danhGiaSao = (int) danhGiaSaoFloat;
            danhGiaDu = Math.round((danhGiaSaoFloat - danhGiaSao) * 10);
        }

        List<Ao> listAos = aoSer.findAllByTrangThai(2);

        model.addAttribute("listAos", listAos);
        model.addAttribute("ao", aoSer.findById(UUID.fromString(id)));
        model.addAttribute("listDanhGias", danhGiaSer.findAllByAo(UUID.fromString(id)));
        model.addAttribute("slAoDaBan", aoSer.soLuongBanByUUID(UUID.fromString(id)));
        model.addAttribute("anhs", anhSer.findAllByAoId(UUID.fromString(id)));
        model.addAttribute("mauSacs", aoChiTietSer.findMauSacByIdAo(UUID.fromString(id)));
        model.addAttribute("sizes", aoChiTietSer.findSizeByIdAo(UUID.fromString(id)));
        model.addAttribute("danhGiaSao", danhGiaSao);
        model.addAttribute("danhGiaDu", danhGiaDu);


        try {
            GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietSer.findByIdAoAndTrangThai(UUID.fromString(id));
            model.addAttribute("giamgia", giamGiaSanPhamChiTiet.getGiamGiaSanPham().getPhanTramGiam());
            model.addAttribute("time", giamGiaSanPhamChiTiet.getGiamGiaSanPham().getNgayKetThuc());
        } catch (Exception e) {
            model.addAttribute("giamgia", "2");
        }
        return "/user/san_pham_detail";
    }

    @GetMapping("/user/show_gio_hang_index/*/*")
    public String showGioHangIndex(HttpServletRequest request, HttpSession session) {

        String url = request.getRequestURI();
        String[] parts = url.split("/user/show_gio_hang_index/");
        String pStr = parts[1];
        String[] p = pStr.split("/");
        String maKh = p[0];
        String idAo = p[1];
        session.setAttribute("idAo", idAo);
        return "redirect:/user/trang_chu/" + maKh;
    }

    @GetMapping("/user/loc_theo_loai_ao/*/*")
    public String locTheoLoaiAo(HttpServletRequest request, Model model) {

        String url = request.getRequestURI();
        String[] parts = url.split("/user/loc_theo_loai_ao/");
        String pStr = parts[1];
        String[] p = pStr.split("/");
        String maKh = p[0];
        String maLoaiAo = p[1];

        try {
            Users users = usersSer.findByMa(maKh);
            GioHang gioHang = gioHangSer.findByIdKH(users.getId());
            Long soLuongSanPham = gioHangChiTietSer.soLuongSanPhamGioHang(gioHang.getId());

            model.addAttribute("idKh", users.getMa());
            model.addAttribute("soLuongSanPham", soLuongSanPham);
        } catch (Exception e) {
            model.addAttribute("idKh", "2");
        }

        LoaiAo loaiAo = loaiAoSer.findByMa(maLoaiAo);
        List<Ao> listAos = aoSer.listAoFindByLoaiAo(maLoaiAo);
        List<AoDTO> listAoDTOS = aoSer.findByAo(listAos);

        model.addAttribute("listChatVai", chatVaiSer.findAllByTrangThai(1));
        model.addAttribute("listForm", formSer.findAllByTrangThai(1));
        model.addAttribute("listHang", hangSer.findAllByTrangThai(1));
        model.addAttribute("listLoaiAo", loaiAoSer.findAllByTrangThai(1));
        model.addAttribute("listMauSac", mauSacSer.findAllByTrangThai(1));
        model.addAttribute("items", listAoDTOS);
        model.addAttribute("loaiAo", loaiAo);

        List<LoaiAo> listLoaiAos = loaiAoSer.findAllByTrangThai(1);
        model.addAttribute("listLoaiAos", listLoaiAos);

        return "/user/tim_kiem";
    }

    @GetMapping("/user/view_tim_kiem/*")
    public String viewTimKiem(HttpServletRequest request, Model model, HttpSession session) {

        String url = request.getRequestURI();
        String[] p = url.split("/user/view_tim_kiem/");
        String maKh = p[1];

        try {
            Users users = usersSer.findByMa(maKh);
            GioHang gioHang = gioHangSer.findByIdKH(users.getId());
            Long soLuongSanPham = gioHangChiTietSer.soLuongSanPhamGioHang(gioHang.getId());

            model.addAttribute("idKh", users.getMa());
            model.addAttribute("soLuongSanPham", soLuongSanPham);
        } catch (Exception e) {
            model.addAttribute("idKh", "2");
        }

        List<AoDTO> listAoDTOS = (List<AoDTO>) session.getAttribute("items");

        if(listAoDTOS != null){
            model.addAttribute("items", listAoDTOS);
        }else {
            model.addAttribute("items", aoSer.findAllAoDTO());
        }

        model.addAttribute("listChatVai", chatVaiSer.findAllByTrangThai(1));
        model.addAttribute("listForm", formSer.findAllByTrangThai(1));
        model.addAttribute("listHang", hangSer.findAllByTrangThai(1));
        model.addAttribute("listLoaiAo", loaiAoSer.findAllByTrangThai(1));
        model.addAttribute("listMauSac", mauSacSer.findAllByTrangThai(1));


        List<LoaiAo> listLoaiAos = loaiAoSer.findAllByTrangThai(1);
        model.addAttribute("listLoaiAos", listLoaiAos);
        session.removeAttribute("items");
        return "/user/tim_kiem";
    }

    @GetMapping("/user/shop/*")
    public String userShop(HttpServletRequest request, Model model) {
        String url = request.getRequestURI();
        String[] parts = url.split("/user/shop/");
        String ma = parts[1];

        model.addAttribute("listChatVai", chatVaiSer.findAllByTrangThai(1));
        model.addAttribute("listForm", formSer.findAllByTrangThai(1));
        model.addAttribute("listHang", hangSer.findAllByTrangThai(1));
        model.addAttribute("listLoaiAo", loaiAoSer.findAllByTrangThai(1));
        model.addAttribute("listMauSac", mauSacSer.findAllByTrangThai(1));
        model.addAttribute("items", aoSer.findAllAoDTO());

        List<LoaiAo> listLoaiAos = loaiAoSer.findAllByTrangThai(1);
        model.addAttribute("listLoaiAos", listLoaiAos);

        try {
            Users users = usersSer.findByMa(ma);
            GioHang gioHang = gioHangSer.findByIdKH(users.getId());
            Long soLuongSanPham = gioHangChiTietSer.soLuongSanPhamGioHang(gioHang.getId());

            model.addAttribute("idKh", users.getMa());
            model.addAttribute("soLuongSanPham", soLuongSanPham);
        } catch (Exception e) {
            model.addAttribute("idKh", "2");
        }
        return "/user/tim_kiem";
    }

    @GetMapping("/user/danh_gia_view/*")
    public String danhGiaView(HttpServletRequest request, HttpSession session){

        String url = request.getRequestURI();
        String[] parts = url.split("/user/danh_gia_view/");
        String id = parts[1];

        HoaDon hoaDon = hoaDonSer.findId(UUID.fromString(id));
        session.setAttribute("hoaDonDanhGia",hoaDon);

        return "redirect:/user/don_hang/"+hoaDon.getKhachHang().getMa();
    }

    @GetMapping("/logout")
    public String logOut(HttpSession session){
        session.removeAttribute("userLogged1");
        return "redirect:/login";
    }

    @PostMapping("/user/tim_kiem/*")
    public String timKiem(HttpServletRequest request, Model model, HttpSession session) {
        String url = request.getRequestURI();
        String[] parts = url.split("/user/tim_kiem/");
        String ma = parts[1];

        String timKiem = request.getParameter("timKiem");

        if (timKiem.length() == 0) {
            session.setAttribute("items", aoSer.findAllAoDTO());
        } else {
            session.setAttribute("items", aoSer.findAllByTen(timKiem));
        }
        return "redirect:/user/view_tim_kiem/"+ma;
    }

    @PostMapping("/user/tim_kiem_nang_cao/*")
    public String timKiemNangCao(
            @RequestParam(name = "idChatVai", required = false) UUID idChatVai,
            @RequestParam(name = "idLoaiAo", required = false) UUID idLoaiAo,
            @RequestParam(name = "idForm", required = false) UUID idForm,
            @RequestParam(name = "idHang", required = false) UUID idHang,
            @RequestParam(name = "minPrice", required = false) BigDecimal minPrice,
            @RequestParam(name = "maxPrice", required = false) BigDecimal maxPrice,
            @RequestParam(name = "mauSacIds", required = false) List<UUID> mauSacIds,
            Model model, HttpServletRequest request, HttpSession session) {

        String url = request.getRequestURI();
        String[] parts = url.split("/user/tim_kiem_nang_cao/");
        String ma = parts[1];

        List<Ao> ketQuaTimKiem = aoSer.timKiemNangCao(idChatVai, idLoaiAo, idForm, idHang, minPrice, maxPrice, mauSacIds);

        List<AoDTO> list = aoSer.findByAo(ketQuaTimKiem);

        session.setAttribute("items", list);

        return "redirect:/user/view_tim_kiem/"+ma;
    }

    /* Minh Công code*/

    @GetMapping("/user/thong_tin/*")
    public String thongTin(Model model, HttpServletRequest request) {

        String url = request.getRequestURI();
        String[] parts = url.split("/user/thong_tin/");
        String maOrEmail = parts[1];

        System.out.println(maOrEmail);

        if (usersSer.findByMa(maOrEmail) != null) {
            model.addAttribute("kh", usersSer.findByMa(maOrEmail));
            model.addAttribute("idKh", usersSer.findByMa(maOrEmail).getMa());

            Users users =  usersSer.findByMa(maOrEmail);
            GioHang gioHang = gioHangSer.findByIdKH(users.getId());
            Long soLuongSanPham = gioHangChiTietSer.soLuongSanPhamGioHang(gioHang.getId());

            model.addAttribute("idKh", users.getMa());
            model.addAttribute("soLuongSanPham", soLuongSanPham);
        } else if (usersSer.findByMa(maOrEmail) == null) {

            int test = usersSer.demLoginGG(maOrEmail);
            model.addAttribute("check", "0");

            if (test > 0) {
                model.addAttribute("kh", usersSer.findByEmail(maOrEmail));
                model.addAttribute("idKh", usersSer.findByEmail(maOrEmail).getMa());

                Users users = usersSer.findByEmail(maOrEmail);
                GioHang gioHang = gioHangSer.findByIdKH(users.getId());
                Long soLuongSanPham = gioHangChiTietSer.soLuongSanPhamGioHang(gioHang.getId());

                model.addAttribute("idKh", users.getMa());
                model.addAttribute("soLuongSanPham", soLuongSanPham);

            } else if (test == 0) {
                Users users = new Users();

                int slKH = usersSer.soLuongUser() + 3;
                String ma = "00" + slKH;

                users.setMa(ma);
                users.setEmail(maOrEmail);
                users.setRole(RoleEnum.MENBER);
                users.setTrangThai(1);

                usersSer.add(users);

                int slGH = gioHangSer.soLuongGioHang() + 1;

                String gh = "GH00" + slGH;

                GioHang g = new GioHang();
                g.setMa(gh);
                g.setKhachHang(users);
                g.setNgayTao(new Date());
                g.setTrangThai(1);
                gioHangSer.add(g);

                model.addAttribute("kh", users);
                model.addAttribute("idKh", users.getMa());

                GioHang gioHang = gioHangSer.findByIdKH(users.getId());
                Long soLuongSanPham = gioHangChiTietSer.soLuongSanPhamGioHang(gioHang.getId());

                model.addAttribute("idKh", users.getMa());
                model.addAttribute("soLuongSanPham", soLuongSanPham);
            }
        }

        List<LoaiAo> listLoaiAos = loaiAoSer.findAllByTrangThai(1);
        model.addAttribute("listLoaiAos", listLoaiAos);

        return "/user/thong_tin";
    }

    @GetMapping("/user/repass/{ma}")
    public String repass(Model model, @PathVariable String ma) {
        Users users = usersSer.findByMa(ma);
        model.addAttribute("kh", users);
        return "/user/password-change";
    }

    @PostMapping("/user/repass-done/{ma}")
    public String repassdone(HttpServletRequest request, @PathVariable String ma) {
        Users users = usersSer.findByMa(ma);
        String pas = request.getParameter("password");
        users.setMatKhau(pas);
        usersSer.update(users.getId(), users);
        return "redirect:/user/trang_chu/" + users.getMa();
    }

    @PostMapping("/user/contact-done/{maOrEmail}")
    public String contactdone(HttpServletRequest request, @PathVariable String maOrEmail) {

        Users users = null;

        if (usersSer.findByMa(maOrEmail) != null) {
            users = usersSer.findByMa(maOrEmail);
        }
        if (usersSer.findByEmail(maOrEmail) != null){
            users = usersSer.findByEmail(maOrEmail);
        }

        String ten = request.getParameter("ten");
        String ns = request.getParameter("ngaySinh");
        String gt = request.getParameter("gioiTinh");
        String dt = request.getParameter("diaChi1");
        String tp = request.getParameter("thanhPho1");
        String qg = request.getParameter("quocGia1");
        String sdt = request.getParameter("soDienThoai");
        String matKhau = request.getParameter("matKhau");

        users.setTen(ten);
        users.setNgay_sinh(ns);
        users.setGioiTinh(gt);
        users.setDia_chi(dt);
        users.setThanh_pho(tp);
        users.setQuoc_gia(qg);
        users.setSdt(sdt);
        users.setMatKhau(matKhau);

        usersSer.update(users.getId(), users);
        return "redirect:/user/trang_chu/" + users.getMa();
    }

    @PostMapping("/user/danh_gia")
    public String addDanhGia(HttpServletRequest request){

        String idKh = request.getParameter("idKh");
        String aoChiTietId = request.getParameter("aoChiTietId");
        String rating = request.getParameter("rating");
        String binhLuan = request.getParameter("binhLuan");

        AoChiTiet aoChiTiet = aoChiTietSer.findById(UUID.fromString(aoChiTietId));
        Users khachHang = usersSer.findByMa(idKh);

        DanhGia danhGia = new DanhGia();
        danhGia.setKhachHang(khachHang);
        danhGia.setAoChiTiet(aoChiTiet);
        danhGia.setDanhGiaSao(Integer.parseInt(rating));
        danhGia.setDanhGiaBinhLuan(binhLuan);
        danhGia.setNgayDanhGia(LocalDateTime.now());

        danhGiaSer.add(danhGia);

        return "redirect:/user/don_hang/"+ idKh;
    }
}
