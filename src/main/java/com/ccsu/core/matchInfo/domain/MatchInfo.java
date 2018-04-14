package com.ccsu.core.matchInfo.domain;

import com.ccsu.core.club.domain.Club;
import com.ccsu.core.matchState.domain.MatchState;
import com.ccsu.core.matchType.domain.MatchType;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/2
 * @Time: 20:33
 * Description:比赛基本信息实体类
 */
public class MatchInfo {
    private Integer id;

    /**
     * 主队
     */
    private Club homeClub;

    /**
     * 客队
     */
    private Club awayClub;

    /**
     * 比赛日期
     */
    private String matchDate;

    /**
     * 比赛时间
     */
    private String matchTime;

    /**
     * 比赛类型
     */
    private MatchType matchType;

    /**
     * 比赛轮次
     */
    private Integer matchTimes;

    /**
     * 比赛状态
     * 1未开始
     * 2上半场
     * 3中场
     * 4下半场
     * 5结束
     * 6延期
     */
    private MatchState matchState;

    /**
     * 比赛结果
     */
    private Integer matchResult;

    /**
     * 比赛比分(格式:   3:2)
     */
    private String matchScore;
    private String createTime;
    private String modifiedTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Club getHomeClub() {
        return homeClub;
    }

    public void setHomeClub(Club homeClub) {
        this.homeClub = homeClub;
    }

    public Club getAwayClub() {
        return awayClub;
    }

    public void setAwayClub(Club awayClub) {
        this.awayClub = awayClub;
    }

    public String getMatchDate() {
        return matchDate;
    }

    public void setMatchDate(String matchDate) {
        this.matchDate = matchDate;
    }

    public String getMatchTime() {
        return matchTime;
    }

    public void setMatchTime(String matchTime) {
        this.matchTime = matchTime;
    }

    public MatchType getMatchType() {
        return matchType;
    }

    public void setMatchType(MatchType matchType) {
        this.matchType = matchType;
    }

    public Integer getMatchTimes() {
        return matchTimes;
    }

    public void setMatchTimes(Integer matchTimes) {
        this.matchTimes = matchTimes;
    }

    public MatchState getMatchState() {
        return matchState;
    }

    public void setMatchState(MatchState matchState) {
        this.matchState = matchState;
    }

    public Integer getMatchResult() {
        return matchResult;
    }

    public void setMatchResult(Integer matchResult) {
        this.matchResult = matchResult;
    }

    public String getMatchScore() {
        return matchScore;
    }

    public void setMatchScore(String matchScore) {
        this.matchScore = matchScore;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String gcreateTime) {
        this.createTime = createTime;
    }

    public String getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(String gmodifiedTime) {
        this.modifiedTime = modifiedTime;
    }
}
