package com.ccsu.core.matchLineUp.domain;

import com.ccsu.core.club.domain.Club;
import com.ccsu.core.matchInfo.domain.MatchInfo;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/2
 * @Time: 20:45
 * Description:比赛阵容信息
 */
public class MatchLineUp {
    private Integer id;
    /**
     * 比赛信息
     */
    private MatchInfo matchInfo;
    /**
     * 俱乐部信息
     */
    private Club club;
    /**
     * 球员类型
     * 1 首发
     * 2 替补
     */
    private Integer playerType;

    /**
     * 数据库中以字符串的形式存入
     */
    private String players;

    public MatchLineUp() {
    }

    public MatchLineUp(MatchInfo matchInfo, Club club, Integer playerType, String players) {
        this.matchInfo = matchInfo;
        this.club = club;
        this.playerType = playerType;
        this.players = players;
    }

    public MatchLineUp(MatchInfo matchInfo, Club club, Integer playerType, String players, String createTime, String modifiedTime) {
        this.matchInfo = matchInfo;
        this.club = club;
        this.playerType = playerType;
        this.players = players;
        this.createTime = createTime;
        this.modifiedTime = modifiedTime;
    }

    private String createTime;
    private String modifiedTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public MatchInfo getMatchInfo() {
        return matchInfo;
    }

    public void setMatchInfo(MatchInfo matchInfo) {
        this.matchInfo = matchInfo;
    }

    public Club getClub() {
        return club;
    }

    public void setClub(Club club) {
        this.club = club;
    }

    public Integer getPlayerType() {
        return playerType;
    }

    public void setPlayerType(Integer playerType) {
        this.playerType = playerType;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(String modifiedTime) {
        this.modifiedTime = modifiedTime;
    }

    public String getPlayers() {
        return players;
    }

    public void setPlayers(String players) {
        this.players = players;
    }
}
