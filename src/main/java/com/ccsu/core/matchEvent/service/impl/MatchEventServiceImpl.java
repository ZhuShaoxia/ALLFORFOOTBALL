package com.ccsu.core.matchEvent.service.impl;

import com.ccsu.core.matchEvent.dao.MatchEventMapper;
import com.ccsu.core.matchEvent.domain.MatchEvent;
import com.ccsu.core.matchEvent.service.MatchEventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/29
 * @Time: 16:08
 * Description:
 */
@Service
public class MatchEventServiceImpl implements MatchEventService {

    @Autowired
    private MatchEventMapper matchEventMapper;

    @Override
    public void add(MatchEvent entity) throws Exception {

    }

    @Override
    public void delete(Integer id) throws Exception {

    }

    @Override
    public void update(MatchEvent entity) throws Exception {

    }

    @Override
    public MatchEvent load(Integer id) throws Exception {
        return null;
    }

    @Override
    public List<MatchEvent> findAll(String condition) throws Exception {
        return matchEventMapper.findAll(condition);
    }
}
