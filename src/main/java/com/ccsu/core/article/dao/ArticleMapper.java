package com.ccsu.core.article.dao;

import com.ccsu.common.base.BaseDao;
import com.ccsu.core.article.domain.Article;
import com.ccsu.core.common.domain.PageRequestDto;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/15
 * @Time: 01:38
 * Description:
 */
@Repository
public interface ArticleMapper extends BaseDao<Article> {
    List<Article> findAllByUserId(Integer id);

    List<Article> searchAllCarousel();

    void updateCarouselState(Article article);

    List<Article> searchArticleForCarousel();

    List<Article> searchArticleForIndex(Integer articleTypeId);

    List<Article> findAllByRequestDto(PageRequestDto pageRequestDto);
}
