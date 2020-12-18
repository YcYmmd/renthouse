package com.house.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * layui的分页类
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Page {

    private int page;

    private int limit;

    private int userId;

    private String publisher;
}
