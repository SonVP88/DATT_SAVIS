package com.example.demo.entity.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Province {
    private int ProvinceID;
    private String ProvinceName;
    private int CountryID;
    private String Code;
    private List<String> NameExtension;
    private int IsEnable;
    private int RegionID;
    private int RegionCPN;
    private int UpdatedBy;
    private String CreatedAt;
    private String UpdatedAt;
    private boolean CanUpdateCOD;
    private int Status;
    private String UpdatedIP;
    private int UpdatedEmployee;
    private String UpdatedSource;
    private String UpdatedDate;
}
