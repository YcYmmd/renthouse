package com.house.mapper;

import com.house.dto.UserRegister;
import com.house.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Component
public interface UserMapper {
    /**
     * 用户登录
     *
     * @param user user
     * @return user
     */
    User login(User user);

    /**
     * 用户注册
     *
     * @param userRegister userRegister 页面上的注册类
     * @return int
     */
    int register(UserRegister userRegister);

    /**
     * 修改密码
     *
     * @param user user
     * @return int
     */
    int updateUserPwd(User user);

    /**
     * 检查旧密码
     * @param user user
     * @return user
     */
    User checkOldPwd(User user);


    /**
    * 更新用户相关信息
    *@author: ycy666
    *@date: 2020/12/6 9:47
    */
    int updateUserInfo(@Param("user") User user);


    /**
    *根据用户id获取用户的头像，用于显示在页面上
    *@author: ycy666
    *@date: 2020/12/6 15:34
    *@param:
    *@return:
    */
    String getAvatarByUserId(@Param("userId") int userId);

    User getUserByName(@Param("userName") String userName);
}
