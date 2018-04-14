package com.ccsu.core.playerPosition.service.impl;

import com.ccsu.core.playerPosition.dao.PlayerPositionMapper;
import com.ccsu.core.playerPosition.domain.PlayerPosition;
import com.ccsu.core.playerPosition.service.PlayerPositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/11
 * @Time: 11:47
 * Description:
 */
@Service
public class PlayerPositionServiceImpl implements PlayerPositionService {

    @Autowired
    private PlayerPositionMapper playerPositionMapper;

    @Override
    public void add(PlayerPosition entity) throws Exception {

    }

    @Override
    public void delete(Integer id) throws Exception {

    }

    @Override
    public void update(PlayerPosition entity) throws Exception {

    }

    @Override
    public PlayerPosition load(Integer id) throws Exception {
        return null;
    }

    @Override
    public List<PlayerPosition> findAll(String condition) throws Exception {
        return playerPositionMapper.findAll(condition);
    }
}
