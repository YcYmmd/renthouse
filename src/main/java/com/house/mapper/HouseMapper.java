package com.house.mapper;

import com.github.pagehelper.PageInfo;
import com.house.dto.CommentHouse;
import com.house.dto.CommentHouseData;
import com.house.entity.House;
import com.house.entity.Page;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface HouseMapper {
    /**
     * 首页信息展示
     *
     * @return List
     */
    List<House> findHomeInfo();

    /**
     * 通过id查询房屋详情
     *
     * @param id id
     * @return House
     */
    House findHouseDetailsById(int id);

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
     * @param page page分页
     * @return List
     */
    List<House> findHouseByUser(Page page);

    /**
     * 删除用户发布的房源信息
     *
     * @param houseId id
     * @return int
     */
    int deleteUserHouse(int houseId);

    /**
     * 修改用户发布的房源信息
     *
     * @param house house对象
     * @return int
     */
    int updateHouse(House house);

    /**
     * 条件查询
     *
     * @param keywords 关键字
     * @return list
     */
    List<House> findHouseByLike(String keywords);

    int addHouseImagePath(@Param("imgPath") String imgPath);

    String getBriefImageByHouseId(@Param("houseId") int houseId);

    String getDetailImagesByHouseId(@Param("houseId") int houseId);


    /**
    * 在更新昵称和用户名的时候批量更新房屋表的发布人名字
    *@author: ycy666
    *@date: 2020/12/8 8:13
    */
    int updateHousePublisher(@Param("oldUserName") String oldUserName, @Param("newUserName") String newUserName);


    /**
    *
    *@author: ycy666
    *@date: 2020/12/8 9:41
    *@param:
    *@return:
    */
    int getAllHouseCountByUserNickName(@Param("userNickName") String userNickName);

    int getOrderByUserIdAndHouseId(@Param("userId") int userId, @Param("houseId") int id);

    List<House> findHouseByLikeAsc(@Param("keywords") String keywords);

    List<House> findHouseByLikeDesc(@Param("keywords") String keywords);

    List<CommentHouse> findMyComment(@Param("page") Page pageObj);

    int getMyCommentCount(@Param("userId") int userId);
}
