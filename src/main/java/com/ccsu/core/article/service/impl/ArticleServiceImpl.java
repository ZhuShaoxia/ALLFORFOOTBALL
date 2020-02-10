package com.ccsu.core.article.service.impl;

import com.ccsu.common.utils.CommonUtils;
import com.ccsu.common.utils.ListUtils;
import com.ccsu.core.article.dao.ArticleMapper;
import com.ccsu.core.article.domain.Article;
import com.ccsu.core.article.service.ArticleService;
import com.ccsu.core.common.domain.PageRequestDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/15
 * @Time: 01:42
 * Description:
 */
@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public void add(Article article) throws Exception {
        String currentTime = CommonUtils.getCurrentDateTime();
        article.setCreateTime(currentTime);
        article.setModifiedTime(currentTime);
        articleMapper.save(article);
    }

    @Override
    public void delete(Integer id) throws Exception {
        if (id == null) {
            throw new NullPointerException("文章删除编号为空");
        }
        articleMapper.delete(id);
    }

    @Override
    public void update(Article article) throws Exception {
        String modifiedTime = CommonUtils.getCurrentDateTime();
        article.setModifiedTime(modifiedTime);
        articleMapper.update(article);
    }

    @Override
    public Article load(Integer id) throws Exception {
        if (id == null) {
            throw new NullPointerException("文章删除编号为空");
        }
        return articleMapper.findById(id);
    }

    @Override
    public List<Article> findAll(String condition) throws Exception {
        List<Article> all = articleMapper.findAll(condition);
        if (ListUtils.isEmpty(all)) {
            return Collections.emptyList();
        }
        return all;
    }

    @Override
    public List<Article> findAllByUserId(Integer id) {
        return articleMapper.findAllByUserId(id);
    }

    @Override
    public List<Article> searchAllCarousel() {
        return articleMapper.searchAllCarousel();
    }

    @Override
    public void updateCarouselState(Article article) {
        articleMapper.updateCarouselState(article);
    }

    @Override
    public List<Article> searchArticleForCarousel() {
        return articleMapper.searchArticleForCarousel();
    }

    @Override
    public List<Article> searchArticleForIndex(Integer articleTypeId) {
        return articleMapper.searchArticleForIndex(articleTypeId);
    }

    @Override
    public List<Article> findAllByRequestDto(PageRequestDto pageRequestDto) {
        if ("".equals(pageRequestDto.getCondition())) {
            pageRequestDto.setCondition(null);
        }
        if ("".equals(pageRequestDto.getStartTime())) {
            pageRequestDto.setStartTime(null);
        }
        if ("".equals(pageRequestDto.getEndTime())) {
            pageRequestDto.setEndTime(null);
        }
        if ("".equals(pageRequestDto.getArticleTypeId())) {
            pageRequestDto.setArticleTypeId(null);
        }
        return articleMapper.findAllByRequestDto(pageRequestDto);
    }
}
