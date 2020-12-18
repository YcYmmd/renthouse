package com.house.entity;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class News {
    private int newsId;
    private int adminId;
    private String title;
    private String content;
    private String image;
    private String detailImages;
}
