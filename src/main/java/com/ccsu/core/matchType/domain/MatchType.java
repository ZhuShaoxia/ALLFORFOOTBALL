package com.ccsu.core.matchType.domain;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/2
 * @Time: 20:36
 * Description:
 */
public class MatchType {
    private Integer id;

    /**
     * 比赛类型
     * 中超、西甲、英超、意甲、德甲、法甲
     */
    private String type;
    /**
     * 比赛总轮次
     */
    private Integer matchNum;

    /**
     * 俱乐部总数
     */
    private Integer clubNum;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getMatchNum() {
        return matchNum;
    }

    public void setMatchNum(Integer matchNum) {
        this.matchNum = matchNum;
    }

    public Integer getClubNum() {
        return clubNum;
    }

    public void setClubNum(Integer clubNum) {
        this.clubNum = clubNum;
    }
}
