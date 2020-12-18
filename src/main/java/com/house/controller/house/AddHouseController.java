package com.house.controller.house;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.house.entity.House;
import com.house.service.IHouseService;
import com.house.util.ConstantPropertiesUtil;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.InputStream;
import java.util.*;

/**
 * 添加房源信息控制类
 *
 */
@Controller
@RequestMapping("/house")
public class AddHouseController {

    /**
     * 简介图片地址
     * 注意：虚拟路径映射的关键位置
     */
    private String simplePath = "";
    /**
     * 详细图片地址
     */
    private StringBuilder detailsPath = new StringBuilder();

    @Autowired
    private IHouseService service;

    /**
     * 添加房源界面
     *
     * @return view
     */
    @GetMapping("/addHouse.html")
    public String addHouse() {
        return "addHouse.jsp";
    }

    /**
     * 简介图片上传
     *
     * @param file file
     * @return res
     */
    @RequestMapping("/briefImage")
    @ResponseBody
    public Map<String, Object> briefImage(@RequestParam("brief") MultipartFile file) {
        Map<String, Object> map = new HashMap<>(16);
        // 创建OSSClient实例。
        try {
            simplePath = ConstantPropertiesUtil.uploadFileToOss(file);
            map.put("code", 0);
            map.put("msg", "上传成功");
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            map.put("code", 1);
            map.put("msg", "上传失败");
            return map;
        }
    }


    /**
     * 详情图片上传
     *
     * @param file file
     * @param req  req
     * @return res
     */
    @RequestMapping("/detailsImage")
    @ResponseBody
    public Map<String, Object> detailsImage(@RequestParam("detailsImage") List<MultipartFile> file, HttpServletRequest req) {

        String uploadUrl = null;
        Map<String, Object> map = new HashMap<>(16);
        if (!file.isEmpty()) {
            for (MultipartFile f : file) {
                try {
                    uploadUrl = ConstantPropertiesUtil.uploadFileToOss(f);
                    detailsPath.append(uploadUrl + ":-:");
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

    /**
     * 添加新房源信息
     *
     * @param house 房源数据
     * @return res
     */
    @PostMapping("/addHouseRecord")
    @ResponseBody
    public String addHouse(House house) {
        if (house.getPublisher() == null || "".equals(house.getPublisher())) {
            house.setPublisher("管理员");
        }
        house.setHouseImage(simplePath);
        house.setHouseDetailsImg(detailsPath.toString());
        int n = service.addNewHouse(house);
        if (n > 0) {
            // 置空上一次的添加记录
            simplePath = "";
            detailsPath.delete(0, detailsPath.length());
            return "OK";
        }
        return "FAIL";
    }
}
