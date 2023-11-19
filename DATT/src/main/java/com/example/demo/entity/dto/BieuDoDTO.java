package com.example.demo.entity.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BieuDoDTO {
    String thang;

    BigDecimal tongTienHoanThanh;

    BigDecimal tongTienHuy;

    int soDonHoanThanh;

    int soDonHuy;
}
