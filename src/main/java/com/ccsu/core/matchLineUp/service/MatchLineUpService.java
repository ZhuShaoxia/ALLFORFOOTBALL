package com.ccsu.core.matchLineUp.service;

import com.ccsu.common.base.BaseService;
import com.ccsu.core.matchLineUp.domain.MatchLineUp;
import com.ccsu.core.matchLineUp.domain.RequestMatchLineUp;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/23
 * @Time: 16:43
 * Description:
 */
public interface MatchLineUpService extends BaseService<MatchLineUp> {
    void addMatchLineUp(RequestMatchLineUp requestMatchLineUp) throws Exception;
    String searchMatchLineUpPlayers(Integer matchInfoId, Integer clubId, Integer playerType);

}
