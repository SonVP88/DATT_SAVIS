package com.example.demo.entity.giamgia;

import com.example.demo.entity.sanpham.Ao;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "ChuongTrinhGiamGiaChiTietSanPham")
public class GiamGiaSanPhamChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdPggSp",referencedColumnName = "ID")
    GiamGiaSanPham giamGiaSanPham;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdSanPham",referencedColumnName = "ID")
    Ao ao;

    @Column(name = "SoTienDaGIam")
    BigDecimal soTienDaGiam;

    @Column(name = "TrangThai")
    int trangThai;
}
