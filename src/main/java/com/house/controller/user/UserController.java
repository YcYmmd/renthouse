package com.house.controller.user;

import com.house.entity.House;
import com.house.entity.User;
import com.house.service.IHouseService;
import com.house.service.IUserService;
import com.house.util.ConstantPropertiesUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * 用户控制类
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService service;
    @Autowired
    private IHouseService dao;

    private String avatarPath = "";

    /**
     * 用户管理页
     *
     * @return view
     */
    @GetMapping("/home.html")
    public String toUserSystemPage() {
        return "/user/home.jsp";
    }

    /**
     * 用户修改密码界面
     *
     * @return view
     */
    @GetMapping("/updatePassword.html")
    public String updatePassword() {
        return "/user/updatePassword.jsp";
    }

    /**
     * 后台第一个欢迎界面
     *
     * @return view
     */
    @GetMapping("/welcome.html")
    public String toWelcomePage() {
        return "welcome.jsp";
    }

    /**
     * 用户发布的租房信息
     * @return view
     */
    @GetMapping("/userRental.html")
    public String toUserRentalPage() {
        return "/user/myRental.jsp";
    }



    /**
    * 我的收藏页面
    *@author: ycy666
    *@date: 2020/12/14 22:45
    *@param:
    *@return:
    */
    @GetMapping("/userCollection.html")
    public String userCollection(HttpServletRequest request) {
        return "user/userCollection.jsp";
    }

    /**
     * 我的评论页面
     * @param request
     * @return
     */
    @GetMapping("/userComment.html")
    public String userComment(HttpServletRequest request) {
        return "/user/myComment.jsp";
    }
    /**
     * 用户更新房源信息
     * 使用的也是管理员的界面
     *
     * @param houseId 房源ID
     * @param request req
     * @return view
     */
    @GetMapping("/updateHouse.html")
    public String toUpdatePage(int houseId, HttpServletRequest request) {
        House house = dao.findHouseDetailsById(houseId);
        request.getSession().setAttribute("House", house);
        return "/admin/updateHouse.jsp";
    }

    /**
     * 更新用户密码
     *
     * @param id     id
     * @param newPwd new password
     * @param oldPwd old password
     * @return res
     */
    @PostMapping("/updateUserPwd")
    @ResponseBody
    public String updateUserPwd(String id, String newPwd, String oldPwd,HttpServletRequest request) {
        User oldUser = new User();
        oldUser.setUserId(Integer.parseInt(id));
        oldUser.setUserPassword(oldPwd);
        User checkUser = service.checkOldPwd(oldUser);
        if (checkUser != null) {
            User newUser = new User();
            newUser.setUserId(Integer.parseInt(id));
            newUser.setUserPassword(newPwd);
            int n = service.updateUserPwd(newUser);
            if (n > 0) {
                request.getSession().setAttribute("loginUser",null);
                return "OK";
            }
        }
        return "FAIL";
    }

    @GetMapping("/updateInfo")
    public String updateInfo() {
        return "/user/updateInfo.jsp";
    }

    @PostMapping("/updateAvatar")
    @ResponseBody
    public Map<String,Object> updateAvatar(@RequestParam("avatar") MultipartFile file) {
        Map<String,Object> map = new HashMap<>();
        try {
            avatarPath = ConstantPropertiesUtil.uploadFileToOss(file);
            map.put("code",0);
            map.put("msg","上传成功！");
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            map.put("code",1);
            map.put("msg","上传失败！");
        }
        return map;
    }

    /**
     * 更新用户信息的方法 在数据库中更新用户的信息
     *@author: ycy666
     *@date: 2020/12/6 9:41
     *@param: [user]
     *@return: java.lang.String
     */
    @PostMapping("/updateUserInfo")
    @ResponseBody
    public String updateUserInfo(User user,HttpServletRequest request) {
        if (avatarPath != null && !avatarPath.equals("")) {
            user.setUserAvatar(avatarPath);
            avatarPath = "";
        } else {
            String avatar = service.getAvatarByUserId(user.getUserId());
            user.setUserAvatar(avatar);
        }
        int result = service.updateUserInfo(user);
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        dao.updateHousePublisher(loginUser.getUserName(),user.getUserName());
        if (result > 0) {
            request.getSession().setAttribute("loginUser",user);
            return "OK";
        }
        return "error";
    }
}
