package com.house.service.impl;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.house.service.IHouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.mapper.HouseMapper;
import com.house.entity.House;
import com.house.entity.Page;

@Service
public class HouseServiceImpl implements IHouseService {

    @Autowired
    private HouseMapper dao;

    @Override
    public List<House> findHomeInfo() {
        return dao.findHomeInfo();
    }

    @Override
    public House findHouseDetailsById(int id) {
        return dao.findHouseDetailsById(id);
    }

    @Override
    public int addNewHouse(House house) {

        return dao.addNewHouse(house);
    }

    @Override
    public List<House> findHouseByUser(Page page) {
        return dao.findHouseByUser(page);
    }

    @Override
    public int deleteUserHouse(int houseId) {
        return dao.deleteUserHouse(houseId);
    }

    @Override
    public int updateHouse(House house) {
        return dao.updateHouse(house);
    }

    @Override
    public List<House> findHouseByLike(String keywords) {
        return dao.findHouseByLike(keywords);
    }

    @Override
    public int addHouseImgPath(String imgPath) {
        return dao.addHouseImagePath(imgPath);
    }

    @Override
    public String getBriefImageByHouseId(int houseId) {
        return dao.getBriefImageByHouseId(houseId);
    }

    @Override
    public String getDetailImagesByHouseId(int houseId) {
        return dao.getDetailImagesByHouseId(houseId);
    }

    @Override
    public int updateHousePublisher(String oldUserName, String newUserName) {
        return dao.updateHousePublisher(oldUserName,newUserName);
    }

    @Override
    public int getAllHouseCountByUserNickName(String userNickName) {
        return dao.getAllHouseCountByUserNickName(userNickName);
    }

    @Override
    public PageInfo<House> getPageInfo(String keywords, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<House> list = dao.findHouseByLike(keywords);
        return new PageInfo<>(list);
    }

    @Override
    public int getOrderByUserIdAndHouseId(int userId, int id) {
        return dao.getOrderByUserIdAndHouseId(userId,id);
    }

    @Override
    public PageInfo<House> getPageInfoAsc(String keywords, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<House> list = dao.findHouseByLikeAsc(keywords);
        return new PageInfo<>(list);
    }

    @Override
    public PageInfo<House> getPageInfoDesc(String keywords, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<House> list = dao.findHouseByLikeDesc(keywords);
        return new PageInfo<>(list);
    }

}
