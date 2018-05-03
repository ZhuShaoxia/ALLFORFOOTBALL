package com.ccsu.core.honer.service.impl;

import com.ccsu.common.utils.CommonUtils;
import com.ccsu.core.honer.dao.HonerMapper;
import com.ccsu.core.honer.domain.Honer;
import com.ccsu.core.honer.service.HonerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/27
 * @Time: 14:25
 * Description:
 */
@Service
public class HonerServiceImpl implements HonerService {

    @Autowired
    private HonerMapper honerMapper;

    @Override
    public void add(Honer honer) throws Exception {
        String currentDateTime = CommonUtils.getCurrentDateTime();
        honer.setCreateTime(currentDateTime);
        honer.setModifiedTime(currentDateTime);
        honerMapper.save(honer);
    }

    @Override
    public void delete(Integer id) throws Exception {
        honerMapper.delete(id);
    }

    @Override
    public void update(Honer honer) throws Exception {

    }

    @Override
    public Honer load(Integer id) throws Exception {
        return null;
    }

    @Override
    public List<Honer> findAll(String condition) throws Exception {
        return null;
    }

    @Override
    public List<Honer> findHonerByPlayerId(Integer playerId) {
        return honerMapper.findHonerByPlayerId(playerId);
    }

    @Override
    public List<Honer> findHonerByClubId(Integer clubId) {
        return honerMapper.findHonerByClubId(clubId);
    }

    @Override
    public List<Honer> findAllByTypeId(Integer id) {
        return honerMapper.findAllByTypeId(id);
    }
}
