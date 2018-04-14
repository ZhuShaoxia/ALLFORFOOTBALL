package com.ccsu.core.ranking.domain;

import com.ccsu.core.club.domain.Club;

import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/2
 * @Time: 20:58
 * Description: 比赛积分榜
 */
public class Ranking {
    private Integer id;
    private Club club;

    /**
     * 比赛轮次
     */
    private Integer matchTimes;

    /**
     * 胜
     */
    private Integer victory;

    /**
     * 平
     */
    private Integer draw;

    /**
     * 负
     */
    private Integer negative;

    /**
     * 进球
     */
    private Integer goals;

    /**
     * 失球
     */
    private Integer conceded;

    /**
     * 净胜球
     */
    private Integer goalDifference;

    /**
     * 积分
     */
    private Integer score;

    /**
     * 赛季
     */
    private Integer season;

    private String createTime;
    private String modifiedTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Club getClub() {
        return club;
    }

    public void setClub(Club club) {
        this.club = club;
    }

    public Integer getMatchTimes() {
        return matchTimes;
    }

    public void setMatchTimes(Integer matchTimes) {
        this.matchTimes = matchTimes;
    }

    public Integer getVictory() {
        return victory;
    }

    public void setVictory(Integer victory) {
        this.victory = victory;
    }

    public Integer getDraw() {
        return draw;
    }

    public void setDraw(Integer draw) {
        this.draw = draw;
    }

    public Integer getNegative() {
        return negative;
    }

    public void setNegative(Integer negative) {
        this.negative = negative;
    }

    public Integer getGoals() {
        return goals;
    }

    public void setGoals(Integer goals) {
        this.goals = goals;
    }

    public Integer getConceded() {
        return conceded;
    }

    public void setConceded(Integer conceded) {
        this.conceded = conceded;
    }

    public Integer getGoalDifference() {
        return goalDifference;
    }

    public void setGoalDifference(Integer goalDifference) {
        this.goalDifference = goalDifference;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getSeason() {
        return season;
    }

    public void setSeason(Integer season) {
        this.season = season;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getmodifiedTime() {
        return modifiedTime;
    }

    public void setmodifiedTime(String modifiedTime) {
        this.modifiedTime = modifiedTime;
    }
}
