package com.ccsu.core.matchTechnologyStatistics.service.impl;

import com.ccsu.common.utils.CommonUtils;
import com.ccsu.core.matchTechnologyStatistics.dao.MatchTechnologyMapper;
import com.ccsu.core.matchTechnologyStatistics.domain.MatchTechnologyStatistics;
import com.ccsu.core.matchTechnologyStatistics.domain.RequestMatchTechnologyStatistics;
import com.ccsu.core.matchTechnologyStatistics.service.MatchTechnologyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/19
 * @Time: 12:49
 * Description:
 */
@Service
public class MatchTechnologyServiceImpl implements MatchTechnologyService {

    @Autowired
    private MatchTechnologyMapper matchTechnologyMapper;

    @Override
    public void add(MatchTechnologyStatistics entity) throws Exception {

    }

    @Override
    public void delete(Integer id) throws Exception {

    }

    @Override
    public void update(MatchTechnologyStatistics entity) throws Exception {

    }

    @Override
    public MatchTechnologyStatistics load(Integer id) throws Exception {
        return matchTechnologyMapper.findById(id);
    }

    @Override
    public List<MatchTechnologyStatistics> findAll(String condition) throws Exception {
        return null;
    }

    @Override
    public void insertMatchTechnology(RequestMatchTechnologyStatistics requestMatchTechnologyStatistics) throws Exception {
        List<MatchTechnologyStatistics> list = requestMatchTechnologyStatistics.getTecStaList();
        String currentDateTime = CommonUtils.getCurrentDateTime();
        for (MatchTechnologyStatistics m : list) {
            m.setMatchInfo(requestMatchTechnologyStatistics.getMatchInfo());
            m.setCreateTime(currentDateTime);
            m.setModifiedTime(currentDateTime);
        }
        matchTechnologyMapper.insertMatchTechnology(list);
    }

    @Override
    public MatchTechnologyStatistics findTecByMatchInfoIdAndMatchPlc(Integer matchInfoId, Integer matchPlace) {
        return matchTechnologyMapper.findTecByMatchInfoIdAndMatchPlc(matchInfoId, matchPlace);
    }
}
