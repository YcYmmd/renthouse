package com.house.mapper;

import com.house.entity.House;
import com.house.entity.Page;
import com.house.entity.UserCollection;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface CollectionMapper {

    int getCollectionByUserIdAndHouseId(@Param("userId") int userId, @Param("houseId") int id);

    int insertCollection(@Param("userId") String userId, @Param("houseId") String houseId);

    int deleteCollection(@Param("userId") String userId, @Param("houseId") String houseId);

    List<House> getCollectedHouse(@Param("userId") int userId);

    List<UserCollection> findAllCollection(@Param("pageObj") Page pageObj);

    int getCollectionCount(@Param("userId") int userId);

    int deleteCollectionById(@Param("collectionId") int collectionId);
}
