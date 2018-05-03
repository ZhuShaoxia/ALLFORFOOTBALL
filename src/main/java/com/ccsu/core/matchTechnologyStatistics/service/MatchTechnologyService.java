package com.ccsu.core.matchTechnologyStatistics.service;

import com.ccsu.common.base.BaseService;
import com.ccsu.core.matchTechnologyStatistics.domain.MatchTechnologyStatistics;
import com.ccsu.core.matchTechnologyStatistics.domain.RequestMatchTechnologyStatistics;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/19
 * @Time: 12:48
 * Description:
 */
public interface MatchTechnologyService extends BaseService<MatchTechnologyStatistics> {
    void insertMatchTechnology(RequestMatchTechnologyStatistics requestMatchTechnologyStatistics) throws Exception;

    MatchTechnologyStatistics findTecByMatchInfoIdAndMatchPlc(Integer matchInfoId, Integer matchPlace);

}
