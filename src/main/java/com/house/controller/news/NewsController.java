package com.house.controller.news;

import com.github.pagehelper.PageInfo;
import com.house.dto.NewsData;
import com.house.entity.Admin;
import com.house.entity.News;
import com.house.entity.Page;
import com.house.service.INewsService;
import com.house.util.ConstantPropertiesUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/news")
public class NewsController {

    private String simplePath = "";
    private StringBuilder detailsPath = new StringBuilder();

    private String updateBriefImage = "";
    private StringBuilder updateDetailImages = new StringBuilder();

    @Autowired
    private INewsService newsService;

    /**
     * 设置新闻的简介图片
     *
     * @param file
     * @return
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
     * 设置新闻的详情图片
     *
     * @param file
     * @param req
     * @return
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

    @PostMapping("/addNewsRecord")
    @ResponseBody
    public String addNewsRecord(News news) {
        news.setImage(simplePath);
        news.setDetailImages(detailsPath.toString());
        int n = newsService.addNews(news);
        if (n > 0) {
            // 置空上一次的添加记录
            simplePath = "";
            detailsPath.delete(0, detailsPath.length());
            return "OK";
        }
        return "FAIL";
    }

    @RequestMapping("/newsList")
    @ResponseBody
    public NewsData findAllNews(int page, int limit, HttpServletRequest request) {
        Page p = new Page();
        p.setLimit(limit);
        p.setPage((page - 1) * limit);
        Admin admin = (Admin) request.getSession().getAttribute("Admin");
        int adminId = admin.getId();
        List<News> findAllNews = newsService.findAllNews(p);
        int count = newsService.getNewsCountByAdminId(adminId);
        NewsData newsData = new NewsData();
        newsData.setCode(0);
        newsData.setCount(count);
        newsData.setData(findAllNews);
        newsData.setMsg("OK");
        return newsData;
    }

    @PostMapping("/deleteNews")
    @ResponseBody
    public String deleteHouse(String newsId) {
        int n = newsService.deleteNewsById(newsId);
        if (n > 0) {
            return "OK";
        }
        return "FAIL";
    }

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
    public Map<String, Object> updateDetailsImage(@RequestParam("detailsImage") List<MultipartFile> file, HttpServletRequest req) {

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

    @PostMapping("/updateNewsRecord")
    @ResponseBody
    public String updateHouse(News news) {
        // 如果在页面上没有重新选图片，则用以前的图片
        if (updateBriefImage.equals("")) {
            updateBriefImage = newsService.getBriefImageByNewsId(news.getNewsId());
            news.setImage(updateBriefImage);
        } else {
            news.setImage(updateBriefImage);
        }
        if (updateDetailImages.toString().equals("") || updateDetailImages == null) {
            news.setDetailImages(newsService.getDetailImagesByNewsId(news.getNewsId()));
        } else {
            news.setDetailImages(updateBriefImage.toString());
        }

        int n = newsService.updateNews(news);
        if (n > 0) {
            // 置空本次的修改路径
            updateBriefImage = "";
            updateDetailImages.delete(0, updateDetailImages.length());
            return "OK";
        }
        return "FAIL";
    }

    @GetMapping("/newsDetail")
    public String detail(int id, HttpServletRequest request) {
        News details = newsService.findNewsDetailsById(id);
        List<String> list = new ArrayList<>();
        String[] split = details.getDetailImages().split(":-:");
        for (int i = 0; i < split.length; i++) {
            list.add(split[i]);
        }
        request.getSession().setAttribute("news",details);
        request.getSession().setAttribute("DetailsImg",list);
        return "user/newsDetails.jsp";
    }

}
