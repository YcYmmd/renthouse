package com.house.service.impl;

import com.house.entity.House;
import com.house.entity.Page;
import com.house.entity.UserCollection;
import com.house.mapper.CollectionMapper;
import com.house.service.ICollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollectionServiceImpl implements ICollectionService {

    @Autowired
    private CollectionMapper collectionMapper;

    @Override
    public int getCollectionByUserIdAndHouseId(int userId, int id) {
        return collectionMapper.getCollectionByUserIdAndHouseId(userId,id);
    }

    @Override
    public int insertCollection(String userId, String houseId) {
        return collectionMapper.insertCollection(userId,houseId);
    }

    @Override
    public int delCollection(String userId, String houseId) {
        return collectionMapper.deleteCollection(userId,houseId);
    }

    @Override
    public List<House> getCollectedHouse(int userId) {
        return collectionMapper.getCollectedHouse(userId);
    }

    @Override
    public List<UserCollection> findAllCollection(Page pageObj) {
        return collectionMapper.findAllCollection(pageObj);
    }

    @Override
    public int getCollectionCount(int userId) {
        return collectionMapper.getCollectionCount(userId);
    }

    @Override
    public int deleteCollection(int collectionId) {
        return collectionMapper.deleteCollectionById(collectionId);
    }
}
