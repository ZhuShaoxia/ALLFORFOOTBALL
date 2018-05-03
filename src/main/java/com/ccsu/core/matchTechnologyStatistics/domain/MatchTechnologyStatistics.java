package com.ccsu.core.matchTechnologyStatistics.domain;

import com.ccsu.core.matchInfo.domain.MatchInfo;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/2
 * @Time: 21:03
 * Description:比赛技术统计
 */
public class MatchTechnologyStatistics {
    private Integer id;
    private MatchInfo matchInfo;
    /**
     * 控球率
     */
    private Integer ballControlRate;

    /**
     * 射门
     */
    private Integer shooting;

    /**
     * 射正
     */
    private Integer shootZ;

    /**
     * 封堵
     */
    private Integer plugging;

    /**
     * 任意球
     */
    private Integer freeKick;

    /**
     * 角球
     */
    private Integer cornerKick;

    /**
     * 越位
     */
    private Integer offside;

    /**
     * 换人
     */
    private Integer substitution;

    /**
     * 犯规
     */
    private Integer foul;

    /**
     * 比赛地点 1 主场 2客场
     */
    private Integer matchPlace;

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

    public Integer getBallControlRate() {
        return ballControlRate;
    }

    public void setBallControlRate(Integer ballControlRate) {
        this.ballControlRate = ballControlRate;
    }

    public Integer getShooting() {
        return shooting;
    }

    public void setShooting(Integer shooting) {
        this.shooting = shooting;
    }

    public Integer getShootZ() {
        return shootZ;
    }

    public void setShootZ(Integer shootZ) {
        this.shootZ = shootZ;
    }

    public Integer getPlugging() {
        return plugging;
    }

    public void setPlugging(Integer plugging) {
        this.plugging = plugging;
    }

    public Integer getFreeKick() {
        return freeKick;
    }

    public void setFreeKick(Integer freeKick) {
        this.freeKick = freeKick;
    }

    public Integer getCornerKick() {
        return cornerKick;
    }

    public void setCornerKick(Integer cornerKick) {
        this.cornerKick = cornerKick;
    }

    public Integer getOffside() {
        return offside;
    }

    public void setOffside(Integer offside) {
        this.offside = offside;
    }

    public Integer getSubstitution() {
        return substitution;
    }

    public void setSubstitution(Integer substitution) {
        this.substitution = substitution;
    }

    public Integer getFoul() {
        return foul;
    }

    public void setFoul(Integer foul) {
        this.foul = foul;
    }

    public Integer getMatchPlace() {
        return matchPlace;
    }

    public void setMatchPlace(Integer matchPlace) {
        this.matchPlace = matchPlace;
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
