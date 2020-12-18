package com.house.service.impl;

import com.house.dto.UserCommentData;
import com.house.mapper.CommentMapper;
import com.house.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements ICommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public int insertComment(int userId, int houseId, String commentContent) {
        return commentMapper.insertComment(userId,houseId,commentContent);
    }

    @Override
    public List<UserCommentData> getCommentList(int houseId) {
        return commentMapper.getCommentList(houseId);
    }

    @Override
    public int delComment(String commentId) {
        return commentMapper.delComment(commentId);
    }
}
