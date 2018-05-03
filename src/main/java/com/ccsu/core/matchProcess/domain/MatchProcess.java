package com.ccsu.core.matchProcess.domain;

import com.ccsu.core.club.domain.Club;
import com.ccsu.core.matchEvent.domain.MatchEvent;
import com.ccsu.core.matchInfo.domain.MatchInfo;
import com.ccsu.core.player.domain.Player;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/2
 * @Time: 21:17
 * Description:比赛过程
 */
public class MatchProcess {
    private Integer id;
    private MatchInfo matchInfo;
    private Club club;
    private Player player;
    private MatchEvent matchEvent;
    /**
     * 时刻
     */
    private Integer time;
    private String createTime;
    private String modifiedTime;

    /**
     * 数量：如进球数 助攻数
     */
    private Integer count;

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

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

    public MatchEvent getMatchEvent() {
        return matchEvent;
    }

    public void setMatchEvent(MatchEvent matchEvent) {
        this.matchEvent = matchEvent;
    }

    public Integer getTime() {
        return time;
    }

    public void setTime(Integer time) {
        this.time = time;
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

    public Player getPlayer() {
        return player;
    }

    public void setPlayer(Player player) {
        this.player = player;
    }


}
