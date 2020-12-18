package com.house.service.impl;

import java.util.List;

import com.house.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.mapper.AdminMapper;
import com.house.entity.Admin;
import com.house.entity.House;
import com.house.entity.Page;
import com.house.service.IAdminService;

@Service
public class AdminServiceImpl implements IAdminService {

    @Autowired
    private AdminMapper service;

    @Override
    public Admin adminAccess(Admin admin) {
        return service.adminAccess(admin);
    }

    @Override
    public List<User> findAllUser(Page page) {
        return service.findAllUser(page);
    }

    @Override
    public List<House> findAllHouse(Page page) {
        return service.findAllHouse(page);
    }

    @Override
    public int deleteHouse(int houseId) {
        return service.deleteHouse(houseId);
    }

    @Override
    public User findUserById(int userId) {
        return service.findUserById(userId);
    }

    @Override
    public int updateUser(User user) {
        return service.updateUser(user);
    }

    @Override
    public int deleteUser(int userId) {
        return service.deleteUser(userId);
    }

    @Override
    public Admin checkAdminPwd(Admin admin) {
        return service.checkAdminPwd(admin);
    }

    @Override
    public int changePassword(Admin admin) {
        return service.updateAdminPwd(admin);
    }

    @Override
    public int getHouseCount() {
        return service.getHouseCount();
    }

    @Override
    public int getUserCount() {
        return service.getUserCount();
    }

    @Override
    public int banUser(Integer userId) {
        return service.banUser(userId);
    }

    @Override
    public int unBanUser(Integer userId) {
        return service.unBanUser(userId);
    }

    @Override
    public int examineHouse(Integer houseId) {
        return service.examineHouse(houseId);
    }

    @Override
    public int cancelExamineHouse(Integer houseId) {
        return service.cancelExamineHouse(houseId);
    }
}
