package com.ccsu.core.matchHighlights.dao;

import com.ccsu.common.base.BaseDao;
import com.ccsu.core.matchHighlights.domain.MatchHighlights;
import org.springframework.stereotype.Repository;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/19
 * @Time: 10:20
 * Description:
 */
@Repository
public interface MatchHighlightsMapper extends BaseDao<MatchHighlights>{
    MatchHighlights findByMatchInfoId(Integer matchInfoId);
}
