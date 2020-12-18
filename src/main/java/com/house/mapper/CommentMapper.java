package com.house.mapper;

import com.house.dto.UserCommentData;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Component
public interface CommentMapper {


    /**
    * 插入新的评论
    *@author: ycy666
    *@date: 2020/12/14 8:55
    *@param:
    *@return:
    */
    public int insertComment(@Param("userId") int userId, @Param("houseId") int houseId, @Param("commentContent") String commentContent);


    /**
    * 根据houseId得到当前房屋的评论
    *@author: ycy666
    *@date: 2020/12/14 11:10
    */
    List<UserCommentData> getCommentList(@Param("houseId") int houseId);

    int delComment(@Param("commentId") String commentId);
}
