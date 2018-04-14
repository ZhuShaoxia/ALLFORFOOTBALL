package com.ccsu.core.matchProcess.domain;

import com.ccsu.core.club.domain.Club;
import com.ccsu.core.matchEvent.domain.MatchEvent;
import com.ccsu.core.matchInfo.domain.MatchInfo;

import java.util.Date;

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
    private MatchEvent matchEvent;
    /**
     * 时刻
     */
    private String time;
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

    public MatchEvent getMatchEvent() {
        return matchEvent;
    }

    public void setMatchEvent(MatchEvent matchEvent) {
        this.matchEvent = matchEvent;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
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
