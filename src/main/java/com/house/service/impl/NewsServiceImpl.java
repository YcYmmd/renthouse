package com.house.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.house.entity.News;
import com.house.entity.Page;
import com.house.mapper.NewsMapper;
import com.house.service.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsServiceImpl implements INewsService {

    @Autowired
    private NewsMapper newsMapper;

    @Override
    public int addNews(News news) {
        return newsMapper.addNews(news);
    }

    @Override
    public int deleteNewsById(String newsId) {
        return newsMapper.deleteNewsById(newsId);
    }

    @Override
    public News findNewsDetailsById(int newsId) {
        return newsMapper.findNewsDetailsById(newsId);
    }

    @Override
    public String getBriefImageByNewsId(int newsId) {
        return newsMapper.getBriefImageByNewsId(newsId);
    }

    @Override
    public String getDetailImagesByNewsId(int newsId) {
        return newsMapper.getDetailImagesByNewsId(newsId);
    }

    @Override
    public int updateNews(News news) {
        return newsMapper.updateNews(news);
    }

    @Override
    public List<News> findAllNews(Page p) {
        return newsMapper.findAllNews(p);
    }

    @Override
    public int getNewsCountByAdminId(int adminId) {
        return newsMapper.getNewsCountByAdminId(adminId);
    }

    @Override
    public PageInfo<News> getPageInfo(String keywords, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<News> list = newsMapper.findNewsByLike(keywords);
        return new PageInfo<>(list);
    }
}
