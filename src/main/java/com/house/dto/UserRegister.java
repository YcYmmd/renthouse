package com.house.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserRegister {
    private int userId;
    private String userNameRegister;
    private String userPasswordRegister;
    private String userPhoneNumber;
    private String userNickName;
    private String userAvatar;
    private int userStatus;
    private int isAdmin;
}
