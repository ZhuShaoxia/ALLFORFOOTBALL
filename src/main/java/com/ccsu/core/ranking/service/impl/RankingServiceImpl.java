package com.ccsu.core.ranking.service.impl;

import com.ccsu.common.utils.CommonUtils;
import com.ccsu.core.ranking.dao.RankingMapper;
import com.ccsu.core.ranking.domain.Ranking;
import com.ccsu.core.ranking.service.RankingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/24
 * @Time: 23:12
 * Description:
 */
@Service
public class RankingServiceImpl implements RankingService {

    @Autowired
    private RankingMapper rankingMapper;

    @Override
    public Integer countClubId(Ranking ranking) {
        return rankingMapper.countClubId(ranking);
    }

    @Override
    public List<Ranking> findAllByMatchTypeId(Integer matchTypeId) {
        return rankingMapper.findAllByMatchTypeId(matchTypeId);
    }

    @Override
    public void updateRankingByVictory(Ranking ranking) {
        String currentTime = CommonUtils.getCurrentDateTime();
        ranking.setModifiedTime(currentTime);
        rankingMapper.updateRankingByVictory(ranking);
    }

    @Override
    public void updateRankingByDraw(Ranking ranking) {
        String currentTime = CommonUtils.getCurrentDateTime();
        ranking.setModifiedTime(currentTime);
        rankingMapper.updateRankingByDraw(ranking);
    }

    @Override
    public void updateRankingByNegative(Ranking ranking) {
        String currentTime = CommonUtils.getCurrentDateTime();
        ranking.setModifiedTime(currentTime);
        rankingMapper.updateRankingByNegative(ranking);
    }

    @Override
    public void add(Ranking ranking) throws Exception {
        String currentDateTime = CommonUtils.getCurrentDateTime();
        ranking.setCreateTime(currentDateTime);
        ranking.setModifiedTime(currentDateTime);
        rankingMapper.save(ranking);
    }

    @Override
    public void delete(Integer id) throws Exception {

    }

    @Override
    public void update(Ranking ranking) throws Exception {

    }

    @Override
    public Ranking load(Integer id) throws Exception {
        return null;
    }

    @Override
    public List<Ranking> findAll(String condition) throws Exception {
        return null;
    }
}
