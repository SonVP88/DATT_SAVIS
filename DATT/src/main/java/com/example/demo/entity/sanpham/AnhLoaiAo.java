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

@Table(name = "AnhLoaiAo")
@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AnhLoaiAo implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "Id")
    private UUID id;

    @Column(name = "TenURL")
    private String ten_url;

    @ManyToOne
    @JoinColumn(name = "IdLoaiAo")
    private LoaiAo loaiAo;

    @Column(name = "TrangThai")
    private Integer trangthai;
}
