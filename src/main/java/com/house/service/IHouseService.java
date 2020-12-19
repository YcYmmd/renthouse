package com.house.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.house.entity.House;
import com.house.entity.Page;


public interface IHouseService {
    /**
     * 首页信息展示
     *
     * @return house list
     */
    List<House> findHomeInfo();

    /**
     * 通过id查询房屋详情
     *
     * @param houseId houseId
     * @return house
     */
    House findHouseDetailsById(int houseId);

    /**
     * 添加房源信息
     *
     * @param house house
     * @return int
     */
    int addNewHouse(House house);

    /**
     * 查询用户发布的房源信息
     *
     * @param page 分页
     * @return house list
     */
    List<House> findHouseByUser(Page page);

    /**
     * 删除用户发布的房源信息
     *
     * @param houseId houseId
     * @return ibt
     */
    int deleteUserHouse(int houseId);

    /**
     * 修改用户发布的房源信息
     *
     * @param house house
     * @return int
     */
    int updateHouse(House house);

    /**
     * 条件查询
     *
     * @param keywords 关键字
     * @return house list
     */
    List<House> findHouseByLike(String keywords);

    int addHouseImgPath(String imgPath);

    String getBriefImageByHouseId(int houseId);

    String getDetailImagesByHouseId(int houseId);

    int updateHousePublisher(String oldUserName, String newUserName);

    int getAllHouseCountByUserNickName(String userNickName);

    PageInfo<House> getPageInfo(String keywords, Integer pageNum, Integer pageSize);

    int getOrderByUserIdAndHouseId(int userId, int id);

    PageInfo<House> getPageInfoAsc(String keywords, Integer pageNum, Integer pageSize);

    PageInfo<House> getPageInfoDesc(String keywords, Integer pageNum, Integer pageSize);
}
