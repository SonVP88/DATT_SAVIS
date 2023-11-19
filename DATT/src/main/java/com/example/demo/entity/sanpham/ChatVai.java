package com.example.demo.entity.sanpham;

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

import java.io.Serializable;
import java.util.UUID;

@Table(name = "ChatVai")
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ChatVai implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "Id")
    private UUID id;

    @Column(name = "Ma")
    private String ma;

    @Column(name = "Ten")
    private String ten;

    @Column(name = "ThongTin")
    private String thongtin;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdHuongDanBaoQuan",referencedColumnName = "Id")
    private HuongDanBaoQuan huong_dan_bao_quan;

    @Column(name = "TrangThai")
    private Integer trangthai;
}
