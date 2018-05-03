package com.ccsu.core.matchInfo.service.impl;

import com.ccsu.common.utils.CommonUtils;
import com.ccsu.core.club.domain.Club;
import com.ccsu.core.common.domain.RequestDto;
import com.ccsu.core.matchInfo.dao.MatchInfoMapper;
import com.ccsu.core.matchInfo.domain.MatchInfo;
import com.ccsu.core.matchInfo.domain.RequestMatchInfo;
import com.ccsu.core.matchInfo.service.MatchInfoService;
import com.ccsu.core.matchState.domain.MatchState;
import com.ccsu.core.matchType.domain.MatchType;
import com.ccsu.core.ranking.domain.Ranking;
import com.ccsu.core.ranking.service.RankingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/16
 * @Time: 10:17
 * Description:
 */
@Service
public class MatchInfoServiceImpl implements MatchInfoService {

    @Autowired
    private MatchInfoMapper matchInfoMapper;

    @Autowired
    private RankingService rankingService;


    @Override
    public void add(MatchInfo matchInfo) throws Exception {
        String currentTime = CommonUtils.getCurrentDateTime();
        matchInfo.setCreateTime(currentTime);
        matchInfo.setModifiedTime(currentTime);
        MatchState matchState = new MatchState();
        matchState.setId(1);
        matchInfo.setMatchState(matchState);
        matchInfoMapper.save(matchInfo);
    }

    @Override
    public void delete(Integer id) throws Exception {
        matchInfoMapper.delete(id);
    }

    @Override
    public void update(MatchInfo matchInfo) throws Exception {
        String currentTime = CommonUtils.getCurrentDateTime();
        matchInfo.setModifiedTime(currentTime);
        matchInfoMapper.update(matchInfo);
    }

    @Override
    public MatchInfo load(Integer id) throws Exception {
        return matchInfoMapper.findById(id);
    }

    @Override
    public List<MatchInfo> findAll(String condition) throws Exception {
        return matchInfoMapper.findAll(condition);
    }


    @Override
    public List<MatchInfo> searchMatchInfo(MatchInfo matchInfo) throws Exception {
        return matchInfoMapper.searchMatchInfo(matchInfo);
    }

    @Override
    public List<MatchInfo> searchMatchInfosByMatchTime(Integer id) {
        return matchInfoMapper.searchMatchInfosByMatchTime(id);
    }

    @Override
    public List<MatchInfo> searchMatchInfoByTypeAndTime(Integer matchTypeId, Integer matchTime) throws Exception {
        if (matchTypeId == null || matchTime == null) {
            throw new NullPointerException("输入值为空");
        }
        MatchInfo matchInfo = new MatchInfo();
        MatchType matchType = new MatchType();
        matchType.setId(matchTypeId);
        matchInfo.setMatchType(matchType);
        matchInfo.setMatchTimes(matchTime);
        return matchInfoMapper.searchMatchInfoByTypeAndTime(matchInfo);
    }

    @Override
    public List<MatchInfo> findAll(RequestDto requestDto) {
        if ("".equals(requestDto.getCondition())) {
            requestDto.setCondition(null);
        }
        if ("".equals(requestDto.getStartTime())) {
            requestDto.setStartTime(null);
            requestDto.setEndTime(null);
        }
        if ("".equals(requestDto.getMatchTypeId())) {
            requestDto.setMatchTypeId(null);
        }
        return matchInfoMapper.findAllByRequestDto(requestDto);
    }

    @Override
    public List<MatchInfo> searchMatchInfoByMatchDateForHighlignts(MatchInfo matchInfo) {
        MatchState matchState = new MatchState();
        matchState.setId(5);
        matchInfo.setMatchState(matchState);
        return matchInfoMapper.searchMatchInfoByMatchDateForHighlignts(matchInfo);
    }

    @Override
    public List<MatchInfo> searchMatchInfoByMatchDateForTec(MatchInfo matchInfo) {
        MatchState matchState = new MatchState();
        matchState.setId(5);
        matchInfo.setMatchState(matchState);
        return matchInfoMapper.searchMatchInfoByMatchDateForTec(matchInfo);
    }

    @Override
    public List<MatchInfo> searchMatchInfoByMatchDateAndMatchState(MatchInfo matchInfo) {

        return matchInfoMapper.searchMatchInfoByMatchDateAndMatchState(matchInfo);
    }

    @Override
    public List<MatchInfo> searchMatchInfoByMatchDateForLineUp(MatchInfo matchInfo) {
//        MatchState matchState = new MatchState();
//        matchState.setId(5);
//        matchInfo.setMatchState(matchState);
        return matchInfoMapper.searchMatchInfoByMatchDateForLineUp(matchInfo);
    }

    @Override
    public List<MatchInfo> searchMatchInfoByMatchDateForProcess(MatchInfo matchInfo) {
        return matchInfoMapper.searchMatchInfoByMatchDateForProcess(matchInfo);
    }

    @Override
    public List<MatchInfo> searchMatchInfoForClub(Integer id) {
        return matchInfoMapper.searchMatchInfoForClub(id);
    }

    @Override
    public List<MatchInfo> searchMatchInfoForIndex() {
        return matchInfoMapper.searchMatchInfoForIndex();
    }

    @Override
    public void updateMatchInfoFocus(MatchInfo matchInfo) {
        matchInfoMapper.updateMatchInfoFocus(matchInfo);
    }

    @Override
    public List<MatchInfo> searchMatchInfoForIndexSelect() {
        return matchInfoMapper.searchMatchInfoForIndexSelect();
    }

    @Override
    public List<MatchInfo> searchMatchInfoByMatchTypeAndMatchTimes(Integer matchTypeId, Integer matchTimes) {
        return matchInfoMapper.searchMatchInfoByMatchTypeAndMatchTimes(matchTypeId, matchTimes);
    }

    /**
     * 用于比赛信息录入的时候 判读上一轮是否比赛录入
     *
     * @param matchInfo
     * @return
     */
    @Override
    public Boolean isExistMatchInfoByClubIdAndTimes(MatchInfo matchInfo) {
        Integer count = matchInfoMapper.searchMatchInfoByClubIdAndMatchTimes(matchInfo);
        if (count == null || count == 0) {
            return false;
        }
        return true;
    }

    /**
     * 查询未来两周比赛
     *
     * @param matchTypeId
     * @return
     */
    @Override
    public Map<String, List<MatchInfo>> searchMatchForList(Integer matchTypeId) {
        String matchDate;
        Map<String, List<MatchInfo>> map = new TreeMap<>();
        List<MatchInfo> matchInfos = null;
        for (int i = 0; i < 14; i++) {
            Long day = Long.valueOf(i);
            matchDate = CommonUtils.getCurrentDatePlusDay(day);
            matchInfos = matchInfoMapper.searchMatchForList(matchDate, matchTypeId);
            map.put(matchDate, matchInfos);
        }
        return map;
    }

    @Override
    public List<MatchInfo> searchMatchForList(String matchDate, Integer matchTypeId) {
        List<MatchInfo> matchInfos = matchInfoMapper.searchMatchForList(matchDate, matchTypeId);
        return matchInfos;
    }


    /**
     * 比赛结果录入 更新比赛信息
     *
     * @param requestMatchInfo
     */
    @Override
    public void updateMatchResult(RequestMatchInfo requestMatchInfo) throws Exception {
        //1、更新比赛信息表中 比赛结果 比赛得分
        MatchInfo matchInfo = requestMatchInfo.getMatchInfo();
        Integer homeClubScore = requestMatchInfo.getHomeClubScore();
        Integer awayClubScore = requestMatchInfo.getAwayClubScore();
        String matchScore = homeClubScore + ":" + awayClubScore;
        Integer matchResult = compareScore(homeClubScore, awayClubScore);
        matchInfo.setMatchScore(matchScore);
        matchInfo.setMatchResult(matchResult);
        requestMatchInfo.setMatchInfo(matchInfo);
        matchInfoMapper.updateMatchResult(requestMatchInfo);
        //2、更新比赛积分表 查询俱乐部
        // 存在   则添加
        // 若存在 则更新
        //     根据比赛结果更新数据  1 平 2 主胜 3 客胜

        //主队
        Integer homeClubId = requestMatchInfo.getHomeClubId();
        Ranking homeRanking = new Ranking();
        Club homeClub = new Club();
        homeClub.setId(homeClubId);
        homeRanking.setClub(homeClub);
        Integer homeCountClub = rankingService.countClubId(homeRanking);
        if (homeCountClub == 0 || homeCountClub == null) {
            if (matchResult == 1) {
                homeRanking.setDraw(1);
            } else if (matchResult == 2) {
                homeRanking.setVictory(1);
            } else if (matchResult == 3) {
                homeRanking.setNegative(1);
            }
            homeRanking.setMatchTimes(1);
            homeRanking.setGoals(homeClubScore);
            homeRanking.setConceded(awayClubScore);
            homeRanking.setGoalDifference(Math.abs(homeClubScore - awayClubScore));
            rankingService.add(homeRanking);
        } else {
            if (matchResult == 1) {
                rankingService.updateRankingByDraw(homeRanking);
            } else if (matchResult == 2) {
                rankingService.updateRankingByVictory(homeRanking);
            } else if (matchResult == 3) {
                rankingService.updateRankingByNegative(homeRanking);
            }
        }
        //客队:
        Integer awayClubId = requestMatchInfo.getAwayClubId();
        Ranking awayRanking = new Ranking();
        Club awayClub = new Club();
        awayClub.setId(homeClubId);
        awayRanking.setClub(homeClub);
        Integer awayCountClub = rankingService.countClubId(awayRanking);
        if (awayCountClub == 0 || awayCountClub == null) {
            if (matchResult == 1) {
                awayRanking.setDraw(1);
            } else if (matchResult == 2) {
                awayRanking.setVictory(1);
            } else if (matchResult == 3) {
                awayRanking.setNegative(1);
            }
            awayRanking.setMatchTimes(1);
            awayRanking.setGoals(homeClubScore);
            awayRanking.setConceded(awayClubScore);
            awayRanking.setGoalDifference(Math.abs(homeClubScore - awayClubScore));
            rankingService.add(awayRanking);
        } else {
            if (matchResult == 1) {
                rankingService.updateRankingByDraw(awayRanking);
            } else if (matchResult == 2) {
                rankingService.updateRankingByVictory(awayRanking);
            } else if (matchResult == 3) {
                rankingService.updateRankingByNegative(awayRanking);
            }
        }
    }

    @Override
    public void updateMatchState(Integer matchInfoId, Integer matchState) throws Exception {
        matchInfoMapper.updateMatchState(matchInfoId, matchState);
    }

    @Override
    public List<MatchInfo> searchRecentMatchInfo() {
        return matchInfoMapper.searchRecentMatchInfo();
    }

    private Integer compareScore(Integer homeClubScore, Integer awayClubScore) {

        if (homeClubScore == null || awayClubScore == null) {
            return null;
        }
        Integer matchResult = null;
        if (homeClubScore == awayClubScore) {
            matchResult = 1;
        } else if (homeClubScore > awayClubScore) {
            matchResult = 2;
        } else {
            matchResult = 3;
        }
        return matchResult;
    }
}
