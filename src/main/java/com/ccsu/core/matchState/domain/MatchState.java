package com.ccsu.core.matchState.domain;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/2
 * @Time: 20:44
 * Description:比赛状态
 * <p>
 * 1未开始
 * 2上半场
 * 3中场
 * 4下半场
 * 5结束
 * 6延期
 */
public class MatchState {
    private Integer id;
    private String state;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
