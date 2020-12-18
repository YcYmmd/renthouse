package com.house.service;

import com.house.dto.UserCommentData;

import java.util.List;

public interface ICommentService {
    public int insertComment(int userId,int houseId,String commentContent);

    public List<UserCommentData> getCommentList(int houseId);

    int delComment(String commentId);
}
