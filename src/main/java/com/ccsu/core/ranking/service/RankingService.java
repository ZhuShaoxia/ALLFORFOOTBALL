package com.ccsu.core.ranking.service;

import com.ccsu.common.base.BaseService;
import com.ccsu.core.ranking.domain.Ranking;
import com.ccsu.core.ranking.domain.RankingDo;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/24
 * @Time: 23:12
 * Description:
 */
public interface RankingService extends BaseService<Ranking> {
    Boolean isExist(RankingDo ranking);

    void add(RankingDo rankingDo);

    List<Ranking> findAllByMatchTypeId(Integer matchTypeId);

    void updateRankingByVictory(RankingDo ranking);

    void updateRankingByDraw(RankingDo ranking);

    void updateRankingByNegative(RankingDo ranking);
}
