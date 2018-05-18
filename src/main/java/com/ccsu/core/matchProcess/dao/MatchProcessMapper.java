package com.ccsu.core.matchProcess.dao;

import com.ccsu.common.base.BaseDao;
import com.ccsu.core.matchProcess.domain.MatchProcess;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/21
 * @Time: 08:40
 * Description:
 */
@Repository
public interface MatchProcessMapper extends BaseDao<MatchProcess> {
    List<MatchProcess> findAllByMatchInfoIdAndTime();

    List<Integer> findAllTimeByMatchInfoId(Integer matchInfoId);

    List<MatchProcess> findAllMatchProcessByInfoIdAndTime(MatchProcess matchProcess);

    List<MatchProcess> findAllByMatchInfoId(Integer matchInfoId);

    List<MatchProcess> searchPlayerEvent(Integer matchTypeId, Integer matchEventId);

    void insertMatchProcess(List<MatchProcess> matchProcesses);

    Integer searchCountEventByPlayer(Integer matchEventId, Integer playerId);
}
