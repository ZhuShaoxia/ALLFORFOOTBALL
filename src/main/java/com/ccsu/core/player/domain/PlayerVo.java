package com.ccsu.core.player.domain;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/5/2
 * @Time: 23:34
 * Description:
 */
public class PlayerVo extends Player {
    /**
     * 进球
     */
    private Integer goals;
    /**
     * 助攻
     */
    private Integer assists;
    /**
     * 黄牌
     */
    private Integer yellowCard;
    /**
     * 红牌
     */
    private Integer redCard;
    /**
     * 乌龙球
     */
    private Integer ownGoals;

    public Integer getGoals() {
        return goals;
    }

    public void setGoals(Integer goals) {
        this.goals = goals;
    }

    public Integer getAssists() {
        return assists;
    }

    public void setAssists(Integer assists) {
        this.assists = assists;
    }

    public Integer getYellowCard() {
        return yellowCard;
    }

    public void setYellowCard(Integer yellowCard) {
        this.yellowCard = yellowCard;
    }

    public Integer getRedCard() {
        return redCard;
    }

    public void setRedCard(Integer redCard) {
        this.redCard = redCard;
    }

    public Integer getOwnGoals() {
        return ownGoals;
    }

    public void setOwnGoals(Integer ownGoals) {
        this.ownGoals = ownGoals;
    }
}
