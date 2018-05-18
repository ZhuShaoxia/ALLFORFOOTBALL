package com.ccsu.core.matchProcess.service;

import com.ccsu.common.base.BaseService;
import com.ccsu.core.matchProcess.domain.MatchProcess;
import com.ccsu.core.matchProcess.domain.RequestMatchProcessDto;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/22
 * @Time: 16:36
 * Description:
 */
public interface MatchProcessService extends BaseService<MatchProcess> {
    Map<Integer, List<MatchProcess>> findAllMapByMatchInfoId(Integer matchInfoId);

    List<MatchProcess> findAllByMatchInfoId(Integer matchInfoId);

    void insertMatchProcess(RequestMatchProcessDto requestMatchProcessDto) throws Exception;

    List<MatchProcess> searchPlayerEvent(Integer matchTypeId, Integer matchEventId);

    Integer searchCountEventByPlayer(Integer matchEventId, Integer playerId);
}
