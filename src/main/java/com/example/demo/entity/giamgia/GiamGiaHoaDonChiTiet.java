package com.example.demo.entity.giamgia;

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
@Table(name = "ChuongTrinhGiamGiaChiTietHoaDon")
public class GiamGiaHoaDonChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Id")
    UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdPggHd",referencedColumnName = "Id")
    GiamGiaHoaDon giamGiaHoaDon;

//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "id_hd",referencedColumnName = "id")
//    HoaDon hoaDon;

    @Column(name = "SoTienDaGIam")
    BigDecimal soTienDaGiam;

    @Column(name = "TrangThai")
    int trangThai;
}
