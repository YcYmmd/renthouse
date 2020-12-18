package com.house.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 订单类
 */
@AllArgsConstructor
@Data
@NoArgsConstructor
public class Order {
    private int orderId;
    private int houseId;
    private int userId;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date orderTime;
    private String orderUser;
}
