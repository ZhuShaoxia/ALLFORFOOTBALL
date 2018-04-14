package com.ccsu.core.player.service.impl;

import com.ccsu.common.utils.CommonUtils;
import com.ccsu.core.player.dao.PlayerMapper;
import com.ccsu.core.player.domain.Player;
import com.ccsu.core.player.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/11
 * @Time: 11:58
 * Description:
 */
@Service
public class PlayerServiceImpl implements PlayerService {

    @Autowired
    private PlayerMapper playerMapper;

    @Override
    public void add(Player player) throws Exception {
        String currentTime = CommonUtils.getCurrentDateTime();
        player.setCreateTime(currentTime);
        player.setModifiedTime(currentTime);
        int age = CommonUtils.calculateAge(player.getBirthday());
        player.setAge(age);
        playerMapper.save(player);
    }

    @Override
    public void delete(Integer id) throws Exception {
        playerMapper.delete(id);
    }

    @Override
    public void update(Player player) throws Exception {
        String modifiedTime = CommonUtils.getCurrentDateTime();
        player.setModifiedTime(modifiedTime);
        int age = CommonUtils.calculateAge(player.getBirthday());
        player.setAge(age);
        playerMapper.update(player);
    }

    @Override
    public Player load(Integer id) throws Exception {
        return playerMapper.findById(id);
    }

    @Override
    public List<Player> findAll(String condition) throws Exception {
        return playerMapper.findAll(condition);
    }
}
