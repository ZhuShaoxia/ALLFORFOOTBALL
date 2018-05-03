package com.ccsu.core.matchInfo.service;

import com.ccsu.common.base.BaseService;
import com.ccsu.core.common.domain.RequestDto;
import com.ccsu.core.matchInfo.domain.MatchInfo;
import com.ccsu.core.matchInfo.domain.RequestMatchInfo;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/16
 * @Time: 10:17
 * Description:
 */
public interface MatchInfoService extends BaseService<MatchInfo> {

    List<MatchInfo> searchMatchInfo(MatchInfo matchInfo) throws Exception;

    List<MatchInfo> searchMatchInfosByMatchTime(Integer id);

    List<MatchInfo> searchMatchInfoByTypeAndTime(Integer matchType, Integer matchTime) throws Exception;


    List<MatchInfo> findAll(RequestDto requestDto);

    List<MatchInfo> searchMatchInfoByMatchDateForHighlignts(MatchInfo matchInfo);

    List<MatchInfo> searchMatchInfoByMatchDateForTec(MatchInfo matchInfo);

    List<MatchInfo> searchMatchInfoByMatchDateAndMatchState(MatchInfo matchInfo);

    List<MatchInfo> searchMatchInfoByMatchDateForLineUp(MatchInfo matchInfo);

    List<MatchInfo> searchMatchInfoByMatchDateForProcess(MatchInfo matchInfo);

    List<MatchInfo> searchMatchInfoForClub(Integer id);


    List<MatchInfo> searchMatchInfoForIndex();

    void updateMatchInfoFocus(MatchInfo matchInfo);

    void updateMatchResult(RequestMatchInfo requestMatchInfo) throws Exception;

    void updateMatchState(Integer matchInfoId, Integer matchState) throws Exception;

    List<MatchInfo> searchRecentMatchInfo();

    List<MatchInfo> searchMatchForList(String matchDate, Integer matchTypeId);

    List<MatchInfo> searchMatchInfoForIndexSelect();
    List<MatchInfo> searchMatchInfoByMatchTypeAndMatchTimes(Integer matchTypeId,Integer matchTimes);

    Boolean isExistMatchInfoByClubIdAndTimes(MatchInfo matchInfo);

    Map<String, List<MatchInfo>> searchMatchForList(Integer matchTypeId);

}
