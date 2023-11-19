package com.example.demo.entity.sanpham;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
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

import java.io.Serializable;
import java.util.UUID;

@Table(name = "AoChiTiet")
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class AoChiTiet implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "Id")
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "IdSize")
    private Size size;

    @ManyToOne
    @JoinColumn(name = "IdMauSac")
    private MauSac mau_sac;

    @ManyToOne
    @JoinColumn(name = "IdAo")
    private Ao ao;

    @Column(name = "SoLuongTon")
    private Integer slton;

    @Column(name = "SoLuongBan")
    private Integer slban;

    @Column(name = "TrangThai")
    private Integer trangthai;
}
