package com.house.service;

import com.house.entity.House;
import com.house.entity.Page;
import com.house.entity.UserCollection;

import java.util.List;

public interface ICollectionService {

    int getCollectionByUserIdAndHouseId(int userId, int id);

    int insertCollection(String userId, String houseId);

    int delCollection(String userId, String houseId);

    List<House> getCollectedHouse(int userId);

    List<UserCollection> findAllCollection(Page pageObj);

    int getCollectionCount(int userId);

    int deleteCollection(int collectionId);
}
