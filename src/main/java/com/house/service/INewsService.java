package com.house.service;

import com.github.pagehelper.PageInfo;
import com.house.entity.News;
import com.house.entity.Page;

import java.util.List;

public interface INewsService {

    int addNews(News news);

    int deleteNewsById(String newsId);

    News findNewsDetailsById(int newsId);

    String getBriefImageByNewsId(int newsId);

    String getDetailImagesByNewsId(int newsId);

    int updateNews(News news);

    List<News> findAllNews(Page p);

    int getNewsCountByAdminId(int adminId);

    PageInfo<News> getPageInfo(String keywords, Integer pageNum, Integer pageSize);
}
