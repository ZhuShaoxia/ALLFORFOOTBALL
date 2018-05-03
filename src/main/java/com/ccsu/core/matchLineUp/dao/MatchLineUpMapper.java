package com.ccsu.core.matchLineUp.dao;

import com.ccsu.common.base.BaseDao;
import com.ccsu.core.matchLineUp.domain.MatchLineUp;
import org.springframework.stereotype.Repository;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/23
 * @Time: 16:26
 * Description:
 */
@Repository
public interface MatchLineUpMapper extends BaseDao<MatchLineUp> {
    String searchMatchLineUpPlayers(Integer matchInfoId, Integer clubId, Integer playerType);
}
