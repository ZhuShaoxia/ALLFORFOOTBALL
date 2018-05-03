package com.ccsu.core.matchProcess.domain;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/29
 * @Time: 18:12
 * Description:
 */
public class RequestMatchProcessDto {
    /**
     * 主队比赛事件
     */
    private List<MatchProcess> homeMatchProcess;
    /**
     * 客队比赛事件
     */
    private List<MatchProcess> awayMatchProcess;

    public List<MatchProcess> getHomeMatchProcess() {
        return homeMatchProcess;
    }

    public void setHomeMatchProcess(List<MatchProcess> homeMatchProcess) {
        this.homeMatchProcess = homeMatchProcess;
    }

    public List<MatchProcess> getAwayMatchProcess() {
        return awayMatchProcess;
    }

    public void setAwayMatchProcess(List<MatchProcess> awayMatchProcess) {
        this.awayMatchProcess = awayMatchProcess;
    }
}
