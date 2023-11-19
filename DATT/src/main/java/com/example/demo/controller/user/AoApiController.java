package com.example.demo.controller.user;

import com.example.demo.entity.sanpham.AoChiTiet;
import com.example.demo.repo.sanpham.AoChiTietRepo;
import com.example.demo.ser.sanpham.AoChiTietSer;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
public class AoApiController {

    @Autowired
    AoChiTietSer aoChiTietSer;

    @Autowired
    AoChiTietRepo aoChiTietRepo;

    @GetMapping("/find/{idAo}/{idMs}/{idSize}")
    public ResponseEntity<?> find(@PathVariable UUID idAo, @PathVariable UUID idMs, @PathVariable UUID idSize) {
        System.out.println(idAo);
        System.out.println(idMs);
        System.out.println(idSize);

        AoChiTiet aoChiTiet = aoChiTietRepo.findIdByIdAoMsSize(idAo, idMs, idSize);

        return ResponseEntity.ok(aoChiTiet.getSlton());
    }
}
