package com.ccsu.core.matchType.service.impl;

import com.ccsu.core.matchType.dao.MatchTypeMapper;
import com.ccsu.core.matchType.domain.MatchType;
import com.ccsu.core.matchType.service.MatchTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/16
 * @Time: 20:16
 * Description:
 */
@Service
public class MatchTypeServiceImpl implements MatchTypeService {

    @Autowired
    private MatchTypeMapper matchTypeMapper;


    @Override
    public void add(MatchType entity) throws Exception {

    }

    @Override
    public void delete(Integer id) throws Exception {

    }

    @Override
    public void update(MatchType entity) throws Exception {

    }

    @Override
    public MatchType load(Integer id) throws Exception {
        return matchTypeMapper.findById(id);
    }

    @Override
    public List<MatchType> findAll(String condition) throws Exception {
        return matchTypeMapper.findAll(null);
    }
}
