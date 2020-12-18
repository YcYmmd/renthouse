package com.house.controller.house;

import com.github.pagehelper.PageInfo;
import com.house.entity.House;
import com.house.entity.News;
import com.house.service.ICollectionService;
import com.house.service.IHouseService;
import com.house.service.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 首页控制类
 *
 */
@Controller
public class HomeController {

    @Autowired
    private IHouseService service;

    @Autowired
    private ICollectionService collectionService;

    @Autowired
    private INewsService newsService;

    /**
     * 首页
     *
     * @param request request
     * @return view
     */
    @GetMapping({"/index.html", "/"})
    public String index(HttpServletRequest request) {
        List<House> findHomeInfo = service.findHomeInfo();
        request.getSession().setAttribute("House", findHomeInfo);
        return "index/index.jsp";
    }

    /**
     * 模糊查询
     *
     * @param request  request
     * @param keywords keywords
     * @return res
     */
    @RequestMapping("/page2")
    public String findHouseByLike(HttpServletRequest request,
                                  @RequestParam(value = "keyword", defaultValue = "") String keywords,
                                  @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                  @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                                  ModelMap modelMap
    ) {
        PageInfo<House> pageInfo = service.getPageInfo(keywords, pageNum, pageSize);
        modelMap.addAttribute("pageInfo", pageInfo);
        return "index/index_house.jsp";
    }

    /**
     * 价格升序查询
     *
     * @param request request
     * @return res
     */
    @GetMapping("/priceAsc")
    public String findPriceAsc(HttpServletRequest request) {
        List<House> findHomeInfo = service.findHouseOrderByAsc();
        request.getSession().removeAttribute("House");
        request.getSession().setAttribute("House", findHomeInfo);
        return "index/index.jsp";
    }

    /**
     * 价格降序查询
     *
     * @param request request
     * @return res
     */
    @GetMapping("/priceDesc")
    public String findPriceDesc(HttpServletRequest request) {
        List<House> findHomeInfo = service.findHouseOrderByDesc();
        request.getSession().removeAttribute("House");
        request.getSession().setAttribute("House", findHomeInfo);
        return "index/index.jsp";
    }
    @RequestMapping("/page1")
    public String findNewsByLike(HttpServletRequest request,
                                 @RequestParam(value = "keyword",defaultValue = "") String keywords,
                                 @RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum,
                                 @RequestParam(value = "pageSize",defaultValue = "5") Integer pageSize,
                                 ModelMap modelMap
    ) {
        PageInfo<News> pageInfo = newsService.getPageInfo(keywords,pageNum,pageSize);
        modelMap.addAttribute("pageInfo",pageInfo);
        return "index/index_news.jsp";
    }

}
