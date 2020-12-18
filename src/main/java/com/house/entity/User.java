package com.house.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 租房用户类
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class User {
	private int userId;
	private String userName;
	private String userPassword;
	private String userPhoneNumber;
	private String userNickName;
	private String userAvatar;
	private int userStatus;
	private int isAdmin;
}
