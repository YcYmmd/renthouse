package com.house.dto;

import com.house.entity.News;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;


@NoArgsConstructor
@AllArgsConstructor
@Data
public class NewsData {

    private int code;

    private String msg;

    private int count;

    private List<News> data;

}
