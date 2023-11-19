package com.example.demo.entity.sanpham;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Table(name = "Ao")
@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Ao implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "Id")
    private UUID id;

    @Column(name = "Ma")
    private String ma;

    @Column(name = "Ten")
    private String ten;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdChatVai",referencedColumnName = "Id")
    private ChatVai chatVai;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdLoaiAo",referencedColumnName = "Id")
    private LoaiAo loaiAo;

    @Column(name = "CoAo")
    private String coAo;

    @Column(name = "Tui")
    private String tui;

    @Column(name = "TayAo")
    private String tayAo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdFormAo",referencedColumnName = "Id")
    private Form form;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdHang",referencedColumnName = "Id")
    private Hang hang;

    @JsonIgnore
    @OneToMany(mappedBy = "ao", fetch = FetchType.EAGER)
    List<Anh> anhs;

    @Column(name = "MoTa")
    private String moTa;

    @Column(name = "NgayNhap")
    Date ngayNhap;

    @Column(name = "GiaNhap")
    private BigDecimal giaNhap;

    @Column(name = "GiaBan")
    private BigDecimal giaBan;

    @Column(name = "TrangThai")
    private Integer trangThai;

    public String getAnhDau(List<Anh> anhs1) {
        return anhs1.get(0).getTen_url();
    }

    ;
}
