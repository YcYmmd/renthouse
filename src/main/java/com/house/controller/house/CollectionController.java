package com.house.controller.house;

import com.house.dto.UserCollectionData;
import com.house.dto.UserHouseData;
import com.house.entity.Collection;
import com.house.entity.Page;
import com.house.entity.User;
import com.house.entity.UserCollection;
import com.house.service.ICollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/collection")
public class CollectionController {

    @Autowired
    private ICollectionService collectionService;

    @PostMapping("/myCollectionInfo")
    @ResponseBody
    public UserCollectionData collectedHouse(int page, int limit, HttpServletRequest request) {
        Page pageObj = new Page();
        pageObj.setPage((page - 1) * limit);
        pageObj.setLimit(limit);
        User user = (User) request.getSession().getAttribute("loginUser");
        pageObj.setUserId(user.getUserId());
        UserCollectionData ucd = new UserCollectionData();
        List<UserCollection> collections = collectionService.findAllCollection(pageObj);
        ucd.setCode(0);
        ucd.setCount(collectionService.getCollectionCount(user.getUserId()));
        ucd.setData(collections);
        ucd.setMsg("200");
        return ucd;
    }

    @PostMapping("/cancelCollection")
    @ResponseBody
    public String cancelCollection(int collectionId) {
        int n = collectionService.deleteCollection(collectionId);
        if (n > 0) {
            return "OK";
        }
        return "FAIL";
    }


}
