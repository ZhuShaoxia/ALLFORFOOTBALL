package com.ccsu.core.matchInfo.dao;

import com.ccsu.common.base.BaseDao;
import com.ccsu.core.common.domain.RequestDto;
import com.ccsu.core.matchInfo.domain.MatchInfo;
import com.ccsu.core.matchInfo.domain.RequestMatchInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/16
 * @Time: 10:18
 * Description:
 */
@Repository
public interface MatchInfoMapper extends BaseDao<MatchInfo> {


    List<MatchInfo> searchMatchInfosByMatchTime(Integer id);

    List<MatchInfo> searchMatchInfoByTypeAndTime(MatchInfo matchInfo);

    List<MatchInfo> searchMatchInfo(MatchInfo matchInfo);

    List<MatchInfo> findAllByRequestDto(RequestDto requestDto);

    List<MatchInfo> searchMatchInfoByMatchDateForLineUp(MatchInfo matchInfo);

    List<MatchInfo> searchMatchInfoByMatchDateForProcess(MatchInfo matchInfo);

    List<MatchInfo> searchMatchInfoByMatchDateForTec(MatchInfo matchInfo);

    List<MatchInfo> searchMatchInfoByMatchDateForHighlignts(MatchInfo matchInfo);

    List<MatchInfo> searchMatchInfoByMatchDateAndMatchState(MatchInfo matchInfo);
    List<MatchInfo> searchMatchInfoByMatchTypeAndMatchTimes(Integer matchTypeId,Integer matchTimes);

    List<MatchInfo> searchMatchInfoForIndex();

    void updateMatchInfoFocus(MatchInfo matchInfo);

    void updateMatchResult(@Param("requestMatchInfo") RequestMatchInfo requestMatchInfo);

    void updateMatchState(Integer matchInfoId, Integer matchState);

    List<MatchInfo> searchMatchInfoForIndexSelect();

    List<MatchInfo> searchMatchInfoForClub(Integer id);

    List<MatchInfo> searchRecentMatchInfo();

    List<MatchInfo> searchMatchForList(String matchDate, Integer matchTypeId);

    /**
     * 根据比赛轮次 俱乐部编号 判断比赛信息是否存在
     */
    Integer searchMatchInfoByClubIdAndMatchTimes(MatchInfo matchInfo);


}
