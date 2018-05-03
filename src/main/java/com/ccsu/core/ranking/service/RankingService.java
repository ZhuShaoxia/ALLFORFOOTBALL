package com.ccsu.core.ranking.service;

import com.ccsu.common.base.BaseService;
import com.ccsu.core.ranking.domain.Ranking;

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
    Integer countClubId(Ranking ranking);

    List<Ranking> findAllByMatchTypeId(Integer matchTypeId);

    void updateRankingByVictory(Ranking ranking);

    void updateRankingByDraw(Ranking ranking);

    void updateRankingByNegative(Ranking ranking);
}
