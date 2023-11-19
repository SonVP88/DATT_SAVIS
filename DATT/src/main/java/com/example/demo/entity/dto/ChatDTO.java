package com.example.demo.entity.dto;

import com.example.demo.entity.khachhang.Users;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ChatDTO {
    Users users;

    int sl;
}
