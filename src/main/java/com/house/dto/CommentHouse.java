package com.house.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CommentHouse {
    private int commentId;
    private String commentContent;
    private int commentHouseId;
    private String commentHouse;
}
