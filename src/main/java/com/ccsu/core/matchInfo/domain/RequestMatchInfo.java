package com.ccsu.core.matchInfo.domain;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/24
 * @Time: 21:42
 * Description:
 */
public class RequestMatchInfo {

    private MatchInfo matchInfo;
    private Integer homeClubId;
    private Integer awayClubId;
    private Integer homeClubScore;
    private Integer awayClubScore;
    private Integer matchTypeId;

    public Integer getMatchTypeId() {
        return matchTypeId;
    }

    public void setMatchTypeId(Integer matchTypeId) {
        this.matchTypeId = matchTypeId;
    }

    public MatchInfo getMatchInfo() {
        return matchInfo;
    }

    public void setMatchInfo(MatchInfo matchInfo) {
        this.matchInfo = matchInfo;
    }

    public Integer getHomeClubId() {
        return homeClubId;
    }

    public void setHomeClubId(Integer homeClubId) {
        this.homeClubId = homeClubId;
    }

    public Integer getAwayClubId() {
        return awayClubId;
    }

    public void setAwayClubId(Integer awayClubId) {
        this.awayClubId = awayClubId;
    }

    public Integer getHomeClubScore() {
        return homeClubScore;
    }

    public void setHomeClubScore(Integer homeClubScore) {
        this.homeClubScore = homeClubScore;
    }

    public Integer getAwayClubScore() {
        return awayClubScore;
    }

    public void setAwayClubScore(Integer awayClubScore) {
        this.awayClubScore = awayClubScore;
    }
}
