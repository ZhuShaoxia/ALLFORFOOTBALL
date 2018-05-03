package com.ccsu.core.matchHighlights.service;

import com.ccsu.common.base.BaseService;
import com.ccsu.core.matchHighlights.domain.MatchHighlights;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/19
 * @Time: 10:16
 * Description:
 */
public interface MatchHighlightsService extends BaseService<MatchHighlights> {
    MatchHighlights findByMatchInfoId(Integer matchInfoId);
}
