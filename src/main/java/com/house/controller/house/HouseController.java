package com.house.controller.house;

import com.house.dto.UserHouseData;
import com.house.entity.House;
import com.house.entity.Page;
import com.house.entity.User;
import com.house.service.IHouseService;
import com.house.util.ConstantPropertiesUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 房屋控制类
 */
@Controller
@RequestMapping("/house")
public class HouseController {

    @Autowired
    private IHouseService service;

    private String updateBriefImage = "";

    private StringBuilder updateDetailImages = new StringBuilder();

    @RequestMapping("/findUserHouse")
    @ResponseBody
    public UserHouseData houseByUser(HttpServletRequest request, int page, int limit) {
        Page p = new Page();
        User u = (User) request.getSession().getAttribute("loginUser");
        String publisher = u.getUserNickName();
        p.setPublisher(publisher);
        p.setLimit(limit);
        p.setPage((page - 1) * limit);
        List<House> list = service.findHouseByUser(p);
        int count = service.getAllHouseCountByUserNickName(u.getUserNickName());
        return new UserHouseData(0, "200", count, list);
    }

    /**
     * 删除用户发布的房源信息
     *
     * @param houseId 房源 ID
     * @return res
     */
    @PostMapping("/deleteUserHouse")
    @ResponseBody
    public String deleteUserHouse(String houseId) {
        int n = service.deleteUserHouse(Integer.parseInt(houseId));
        if (n > 0) {
            return "OK";
        }
        return "FAIL";
    }

    /**
     * 更新房源信息
     *
     * @param house 房源数据
     * @return res
     */
    @PostMapping("/updateHouse")
    @ResponseBody
    public String updateHouse(House house) {
        if (updateBriefImage.equals("")) {
            updateBriefImage = service.getBriefImageByHouseId(house.getHouseId());
            house.setHouseImage(updateBriefImage);
        } else {
            house.setHouseImage(updateBriefImage);
        }
        if (updateDetailImages.toString().equals("") || updateDetailImages == null) {
            house.setHouseDetailsImg(service.getDetailImagesByHouseId(house.getHouseId()));
        } else {
            house.setHouseDetailsImg(updateBriefImage.toString());
        }

        int n = service.updateHouse(house);
        if (n > 0) {
            return "OK";
        }
        return "FAIL";
    }


    /**
     * 修改简介图片
     *
     * @author: ycy666
     * @date: 2020/12/7 9:34
     * @param:
     * @return:
     */
    @PostMapping("/updateBriefImage")
    @ResponseBody
    public Map<String, Object> updateBriefImage(@RequestParam("brief") MultipartFile file) {
        Map<String, Object> map = new HashMap<>();
        updateBriefImage = ConstantPropertiesUtil.uploadFileToOss(file);
        if (updateBriefImage != null && !updateBriefImage.equals("")) {
            map.put("code", 0);
            map.put("msg", "简介图片修改成功！");
        } else {
            map.put("code", 1);
            map.put("msg", "简介图片修改失败！");
        }
        return map;
    }

    @RequestMapping("/updateDetailsImage")
    @ResponseBody
    public Map<String, Object> detailsImage(@RequestParam("detailsImage") List<MultipartFile> file, HttpServletRequest req) {

        String uploadUrl = null;
        Map<String, Object> map = new HashMap<>(16);
        if (!file.isEmpty()) {
            for (MultipartFile f : file) {
                try {
                    uploadUrl = ConstantPropertiesUtil.uploadFileToOss(f);
                    updateDetailImages.append(uploadUrl + ":-:");
                    map.put("code", 0);
                    map.put("msg", "上传成功");

                } catch (Exception e) {
                    map.put("code", 1);
                    map.put("msg", "上传失败");
                    e.printStackTrace();
                    return map;
                }
            }
        }
        return map;
    }
}
