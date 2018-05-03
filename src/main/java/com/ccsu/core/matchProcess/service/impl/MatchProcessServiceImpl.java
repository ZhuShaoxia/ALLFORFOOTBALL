package com.ccsu.core.matchProcess.service.impl;

import com.ccsu.core.matchInfo.domain.MatchInfo;
import com.ccsu.core.matchProcess.dao.MatchProcessMapper;
import com.ccsu.core.matchProcess.domain.MatchProcess;
import com.ccsu.core.matchProcess.domain.RequestMatchProcessDto;
import com.ccsu.core.matchProcess.service.MatchProcessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/22
 * @Time: 16:37
 * Description:
 */
@Service
public class MatchProcessServiceImpl implements MatchProcessService {

    @Autowired
    private MatchProcessMapper matchProcessMapper;

    @Override
    public void add(MatchProcess entity) throws Exception {

    }

    @Override
    public void delete(Integer id) throws Exception {

    }

    @Override
    public void update(MatchProcess entity) throws Exception {

    }

    @Override
    public MatchProcess load(Integer id) throws Exception {
        return null;
    }

    @Override
    public List<MatchProcess> findAll(String condition) throws Exception {
        return null;
    }

    /**
     * 返回指定比赛比赛过程
     *
     * @param matchInfoId
     * @return
     */
    @Override
    public Map<Integer, List<MatchProcess>> findAllMapByMatchInfoId(Integer matchInfoId) {
        Map<Integer, List<MatchProcess>> map = new TreeMap<>();
        List<Integer> times = matchProcessMapper.findAllTimeByMatchInfoId(matchInfoId);
        MatchProcess matchProcess = null;
        MatchInfo matchInfo = new MatchInfo();
        matchInfo.setId(matchInfoId);
        for (Integer t : times) {
            System.out.println("time=" + t);
            matchProcess = new MatchProcess();
            matchProcess.setMatchInfo(matchInfo);
            matchProcess.setTime(t);
            List<MatchProcess> list = matchProcessMapper.findAllMatchProcessByInfoIdAndTime(matchProcess);
            map.put(t, list);
        }
        return map;
    }

    @Override
    public List<MatchProcess> findAllByMatchInfoId(Integer matchInfoId) {
        return matchProcessMapper.findAllByMatchInfoId(matchInfoId);
    }

    @Override
    public void insertMatchProcess(RequestMatchProcessDto requestMatchProcessDto) throws Exception {
        matchProcessMapper.insertMatchProcess(requestMatchProcessDto.getHomeMatchProcess());
        matchProcessMapper.insertMatchProcess(requestMatchProcessDto.getAwayMatchProcess());
    }

    @Override
    public List<MatchProcess> searchPlayerEvent(Integer matchTypeId, Integer matchEventId) {
        return matchProcessMapper.searchPlayerEvent(matchTypeId,matchEventId);
    }
}
