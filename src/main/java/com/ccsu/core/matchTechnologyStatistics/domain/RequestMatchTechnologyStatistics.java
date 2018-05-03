package com.ccsu.core.matchTechnologyStatistics.domain;

import com.ccsu.core.matchInfo.domain.MatchInfo;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/19
 * @Time: 11:28
 * Description:
 */
public class RequestMatchTechnologyStatistics {
    private MatchInfo matchInfo;
    private List<MatchTechnologyStatistics> tecStaList = new ArrayList<>();

    public List<MatchTechnologyStatistics> getTecStaList() {
        return tecStaList;
    }

    public MatchInfo getMatchInfo() {
        return matchInfo;
    }

    public void setMatchInfo(MatchInfo matchInfo) {
        this.matchInfo = matchInfo;
    }

    public void setTecStaList(List<MatchTechnologyStatistics> tecStaList) {
        this.tecStaList = tecStaList;
    }
}
