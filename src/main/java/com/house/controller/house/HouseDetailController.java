package com.house.controller.house;

import com.house.dto.CommentHouse;
import com.house.dto.CommentHouseData;
import com.house.dto.UserCommentData;
import com.house.entity.House;
import com.house.entity.NetResponse;
import com.house.entity.Page;
import com.house.entity.User;
import com.house.service.ICollectionService;
import com.house.service.ICommentService;
import com.house.service.IHouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.annotation.RequestScope;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * 房屋详情控制类
 *
 */
@Controller
public class HouseDetailController {

    @Autowired
    private IHouseService service;

    @Autowired
    private ICommentService commentService;

    @Autowired
    private ICollectionService collectionService;

    /**
     * 房源详情
     *
     * @param id      id
     * @param request req
     * @return view
     */
    @GetMapping("/detail.html")
    public String detail(int id, HttpServletRequest request) {
        House details = service.findHouseDetailsById(id);
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        // 看当前的用户有没有预定当前正在看的房子，如果看了就显示已经预约
        if (loginUser != null) {
            int userId = loginUser.getUserId();
            int count = service.getOrderByUserIdAndHouseId(userId, id);
            if (count > 0) {
                request.getSession().setAttribute("isOrdered", "1");
            } else {
                request.getSession().setAttribute("isOrdered", "0");
            }
        } else {
            request.getSession().setAttribute("isOrdered","0");
        }
        // 查看当前的房子有没有被当前系统中的用户收藏
        if (loginUser != null) {
            int userId = loginUser.getUserId();
            int count = collectionService.getCollectionByUserIdAndHouseId(userId, id);
            if (count > 0) {
                request.getSession().setAttribute("isCollected", "1");
            } else {
                request.getSession().setAttribute("isCollected", "0");
            }
        } else {
            request.getSession().setAttribute("isCollected", "0");
        }
        List<UserCommentData> commentList = commentService.getCommentList(id);
        List<String> list = new ArrayList<String>();
        String[] split = details.getHouseDetailsImg().split(":-:");
        for (int i = 0; i < split.length; i++) {
            list.add(split[i]);
        }
        request.getSession().setAttribute("Details", details);
        request.getSession().setAttribute("DetailsImg", list);
        request.getSession().setAttribute("commentList",commentList);
        return "/user/houseDetails.jsp";
    }

    @GetMapping("/comment")
    @ResponseBody
    public NetResponse comment(@RequestParam("commentContent") String comment,@RequestParam("houseId") int houseId, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("loginUser");
        int userId = user.getUserId();
        int result = commentService.insertComment(userId, houseId, comment);
        if (result > 0) {
            return new NetResponse("OK");
        }
        return new NetResponse("FAIL");
    }

    @RequestMapping("/delComment")
    @ResponseBody
    public NetResponse delComment(@RequestParam("commentId") String commentId) {
        int result = commentService.delComment(commentId);
        if (result > 0) {
            return new NetResponse("OK");
        }
        return new NetResponse("FAIL");
    }

    @PostMapping("/comment/myComment")
    @ResponseBody
    public CommentHouseData findMyComment(int page, int limit, HttpServletRequest request) {
        Page pageObj = new Page();
        pageObj.setPage((page - 1) * limit);
        pageObj.setLimit(limit);
        User user = (User) request.getSession().getAttribute("loginUser");
        pageObj.setUserId(user.getUserId());
        CommentHouseData chd = new CommentHouseData();
        List<CommentHouse> commentHouses = service.findMyComment(pageObj);
        int count = service.getMyCommentCount(user.getUserId());
        chd.setCode(0);
        chd.setCount(count);
        chd.setData(commentHouses);
        chd.setMsg("200");
        return chd;
    }

    @PostMapping("/comment/deleteComment")
    @ResponseBody
    public String deleteCommentPost(@RequestParam("commentId") String commentId) {
        int result = commentService.delComment(commentId);
        if (result > 0) {
            return "OK";
        }
        return "FAIL";
    }


    @GetMapping("/collect")
    @ResponseBody
    public NetResponse collect(@RequestParam("userId") String userId,@RequestParam("houseId") String houseId) {
        int result = collectionService.insertCollection(userId,houseId);
        if (result > 0) {
            return new NetResponse("OK");
        }
        return new NetResponse("FAIL");
    }

    @GetMapping("/cancelCollect")
    @ResponseBody
    public NetResponse cancelCollect(@RequestParam("userId") String userId,@RequestParam("houseId") String houseId) {
        int result = collectionService.delCollection(userId,houseId);
        if (result > 0) {
            return new NetResponse("OK");
        }
        return new NetResponse("FAIL");
    }

}
