package com.ccsu.core.ranking.dao;

import com.ccsu.common.base.BaseDao;
import com.ccsu.core.ranking.domain.Ranking;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/24
 * @Time: 23:12
 * Description:
 */
@Repository
public interface RankingMapper extends BaseDao<Ranking> {
    //void save1(Ranking ranking) throws Exception;

    Integer countClubId(Ranking ranking);

    List<Ranking> findAllByMatchTypeId(Integer matchTypeId);

    void updateRankingByVictory(Ranking ranking);

    void updateRankingByDraw(Ranking ranking);

    void updateRankingByNegative(Ranking ranking);
}
