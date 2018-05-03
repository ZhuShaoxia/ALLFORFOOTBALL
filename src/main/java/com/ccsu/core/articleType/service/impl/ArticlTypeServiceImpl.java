package com.ccsu.core.articleType.service.impl;

import com.ccsu.core.articleType.dao.ArticleTypeMapper;
import com.ccsu.core.articleType.domain.ArticleType;
import com.ccsu.core.articleType.service.ArticleTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/15
 * @Time: 01:51
 * Description:
 */
@Service
public class ArticlTypeServiceImpl implements ArticleTypeService {

    @Autowired
    private ArticleTypeMapper articleTypeMapper;

    @Override
    public void add(ArticleType entity) throws Exception {

    }

    @Override
    public void delete(Integer id) throws Exception {

    }

    @Override
    public void update(ArticleType entity) throws Exception {

    }

    @Override
    public ArticleType load(Integer id) throws Exception {
        return null;
    }

    @Override
    public List<ArticleType> findAll(String condition) throws Exception {
        return articleTypeMapper.findAll(null);
    }
}
