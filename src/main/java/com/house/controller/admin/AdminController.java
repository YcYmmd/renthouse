package com.house.controller.admin;

import com.house.dto.UserData;
import com.house.dto.UserHouseData;
import com.house.entity.Admin;
import com.house.entity.House;
import com.house.entity.Page;
import com.house.entity.User;
import com.house.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 管理员控制器
 *
 */
@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private IAdminService service;

    /**
     * 登录请求
     *
     * @param userName     用户名
     * @param userPassword 密码
     * @param req          req
     * @return res
     */
    @PostMapping("/adminAccess")
    public String adminAccess(String userName, String userPassword, HttpServletRequest req) {
        Admin admin = new Admin(0, userName, userPassword);
        Admin adminAccess = service.adminAccess(admin);
        req.getSession().setAttribute("Admin", adminAccess);
        if (adminAccess != null) {
            return "OK";
        }
        return "FAIL";
    }

    /**
     * 查询所有用户
     *
     * @return res
     */
    @RequestMapping("/allUser")
    public UserData findAllUser(int page,int limit) {
        Page p = new Page();
        p.setLimit(limit);
        p.setPage((page - 1) * limit);
        List<User> findAllUser = service.findAllUser(p);
        int count = service.getUserCount();
        UserData userData = new UserData();
        userData.setCode(0);
        userData.setCount(count);
        userData.setData(findAllUser);
        userData.setMsg("OK");
        return userData;
    }

    /**
     * 更新用户信息
     *
     * @param user user
     * @return res
     */
    @PostMapping("/editUser")
    public String editUser(User user) {
        int n = service.updateUser(user);
        if (n > 0) {
            return "OK";
        }
        return "FAIL";
    }

    /**
     * 查询所有房源，在后天会自动分页，有layui-table 组件
     *
     * @param page  page
     * @param limit limit
     * @return res
     */
    @RequestMapping("/houseList")
    public UserHouseData findAllHouse(int page, int limit) {
        Page p = new Page();
        p.setLimit(limit);
        p.setPage((page - 1) * limit);
        List<House> findAllHouse = service.findAllHouse(p);
        int count = service.getHouseCount();
        UserHouseData data = new UserHouseData();
        data.setCode(0);
        data.setCount(count);
        data.setData(findAllHouse);
        data.setMsg("OK");
        return data;
    }

    /**
     * 删除房源
     *
     * @param houseId 房源id
     * @return res
     */
    @RequestMapping("/deleteHouse")
    public String deleteHouse(int houseId) {
        int deleteHouse = service.deleteHouse(houseId);
        if (deleteHouse > 0) {
            return "OK";
        }
        return "FAIL";
    }


    /**
     * 封号
     * @param userId
     * @return
     */
    @RequestMapping("/banUser")
    public String banUser(Integer userId) {
        int banUser = service.banUser(userId);
        if (banUser > 0) {
            return "OK";
        }
        return "FAIL";
    }

    /**
     * 解封
     * @param userId
     * @return
     */
    @RequestMapping("/unBanUser")
    public String unBanUser(Integer userId) {
        int unBanUser = service.unBanUser(userId);
        if (unBanUser > 0) {
            return "OK";
        }
        return "FAIL";
    }

    @RequestMapping("/examineHouse")
    public String examineHouse(Integer houseId) {
        int examine = service.examineHouse(houseId);
        if (examine > 0) {
            return "OK";
        }
        return "FAIL";
    }

    @RequestMapping("/cancelExamineHouse")
    public String cancelExamineHouse(Integer houseId) {
        int count = service.cancelExamineHouse(houseId);
        if (count > 0) {
            return "OK";
        }
        return "FAIL";
    }

    /**
     * 管理员删除用户
     */
    @PostMapping("/deleteUser")
    public String deleteUser(Integer userId) {
        int n = service.deleteUser(userId);
        if (n > 0) {
            return "OK";
        }
        return "FAIL";
    }

    /**
     * 修改管理员登录密码
     *
     * @param request     req
     * @param oldPwd      旧密码
     * @param newPwd      新密码
     * @param confirmPwd 确认密码
     * @return res
     */
    @PostMapping("/changePassword")
    public String changePassword(HttpServletRequest request, String oldPwd, String newPwd, String confirmPwd) {
        Admin checkAdmin = new Admin();
        Admin adminSession = (Admin) request.getSession().getAttribute("Admin");
        checkAdmin.setId(adminSession.getId());
        checkAdmin.setUserPassword(oldPwd);
        // 拿到当前登录的账户密码
        Admin checkAdminPwd = service.checkAdminPwd(checkAdmin);
        if (checkAdminPwd == null) {
            return "ERROR";
        }
        if (!newPwd.equals(confirmPwd)) {
            return "FAIL";
        }
        Admin admin = new Admin();
        admin.setId(adminSession.getId());
        admin.setUserPassword(newPwd);
        int n = service.changePassword(admin);
        if (n > 0) {
            return "OK";
        }
        return "FAIL";
    }
}
