package com.house.dto;

import com.house.entity.UserCollection;
import com.house.entity.UserOrder;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserCollectionData {
    private int code;
    private String msg;
    private int count;
    private List<UserCollection> data;
}
