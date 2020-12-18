package com.house.mapper;

import com.house.entity.News;
import com.house.entity.Page;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface NewsMapper {

    int addNews(@Param("news") News news);

    int deleteNewsById(@Param("newsId") String newsId);

    News findNewsDetailsById(@Param("newsId") int newsId);

    String getBriefImageByNewsId(@Param("newsId") int newsId);

    String getDetailImagesByNewsId(@Param("newsId") int newsId);

    int updateNews(@Param("news") News news);

    List<News> findAllNews(@Param("page") Page p);

    int getNewsCountByAdminId(@Param("adminId") int adminId);

    List<News> findNewsByLike(@Param("keywords") String keywords);
}
