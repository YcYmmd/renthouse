package com.house.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class UserCommentData {
    private String userId;
    private String commentId;
    private String userName;
    private String userAvatar;
    private String commentContent;
}
