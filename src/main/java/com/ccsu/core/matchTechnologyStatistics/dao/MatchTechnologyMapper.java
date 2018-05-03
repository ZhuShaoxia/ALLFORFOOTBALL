package com.ccsu.core.matchTechnologyStatistics.dao;

import com.ccsu.common.base.BaseDao;
import com.ccsu.core.matchTechnologyStatistics.domain.MatchTechnologyStatistics;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/19
 * @Time: 12:53
 * Description:
 */
@Repository
public interface MatchTechnologyMapper extends BaseDao<MatchTechnologyStatistics> {
    void insertMatchTechnology(List<MatchTechnologyStatistics> list);
    MatchTechnologyStatistics findTecByMatchInfoIdAndMatchPlc(Integer matchInfoId,Integer matchPlace);
}
