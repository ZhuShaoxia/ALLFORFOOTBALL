package com.ccsu.core.article.service;

import com.ccsu.common.base.BaseService;
import com.ccsu.core.article.domain.Article;
import com.ccsu.core.common.domain.PageRequestDto;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/15
 * @Time: 01:41
 * Description:
 */
public interface ArticleService extends BaseService<Article> {
    List<Article> findAllByUserId(Integer id);
    List<Article> searchAllCarousel();
    void updateCarouselState(Article article);
    List<Article> searchArticleForCarousel();
    List<Article> searchArticleForIndex(Integer articleTypeId);

    List<Article> findAllByRequestDto(PageRequestDto pageRequestDto);
}
