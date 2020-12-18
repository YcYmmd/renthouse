package com.house.dto;

import com.house.entity.UserOrder;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserOrderData {
    private int code;
    private String msg;
    private int count;
    private List<UserOrder> data;
}
