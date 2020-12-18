package com.house.service.impl;

import com.house.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.mapper.UserMapper;
import com.house.service.IUserService;


@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper mapper;

    @Override
    public User login(User user) {
        return mapper.login(user);
    }

    @Override
    public int register(User user) {
        return mapper.register(user);
    }

    @Override
    public int updateUserPwd(User user) {
        return mapper.updateUserPwd(user);
    }

    @Override
    public User checkOldPwd(User user) {
        return mapper.checkOldPwd(user);
    }

    @Override
    public int updateUserInfo(User user) {
        return mapper.updateUserInfo(user);
    }

    @Override
    public String getAvatarByUserId(int userId) {
        return mapper.getAvatarByUserId(userId);
    }
}
