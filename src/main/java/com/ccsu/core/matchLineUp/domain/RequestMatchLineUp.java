package com.ccsu.core.matchLineUp.domain;

import com.ccsu.core.club.domain.Club;
import com.ccsu.core.matchInfo.domain.MatchInfo;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/23
 * @Time: 16:05
 * Description:
 */
public class RequestMatchLineUp {
    private MatchInfo matchInfo;
    private Club homeClub;
    private Club awayClub;
    private String homeClubPlayerFirstStart[];
    private String homeClubPlayerSubstitutes[];
    private String awayClubPlayerFirstStart[];
    private String awayClubPlayerSubstitutes[];

    public MatchInfo getMatchInfo() {
        return matchInfo;
    }

    public void setMatchInfo(MatchInfo matchInfo) {
        this.matchInfo = matchInfo;
    }

    public Club getHomeClub() {
        return homeClub;
    }

    public void setHomeClub(Club homeClub) {
        this.homeClub = homeClub;
    }

    public Club getAwayClub() {
        return awayClub;
    }

    public void setAwayClub(Club awayClub) {
        this.awayClub = awayClub;
    }

    public String[] getHomeClubPlayerFirstStart() {
        return homeClubPlayerFirstStart;
    }

    public void setHomeClubPlayerFirstStart(String[] homeClubPlayerFirstStart) {
        this.homeClubPlayerFirstStart = homeClubPlayerFirstStart;
    }

    public String[] getHomeClubPlayerSubstitutes() {
        return homeClubPlayerSubstitutes;
    }

    public void setHomeClubPlayerSubstitutes(String[] homeClubPlayerSubstitutes) {
        this.homeClubPlayerSubstitutes = homeClubPlayerSubstitutes;
    }

    public String[] getAwayClubPlayerFirstStart() {
        return awayClubPlayerFirstStart;
    }

    public void setAwayClubPlayerFirstStart(String[] awayClubPlayerFirstStart) {
        this.awayClubPlayerFirstStart = awayClubPlayerFirstStart;
    }

    public String[] getAwayClubPlayerSubstitutes() {
        return awayClubPlayerSubstitutes;
    }

    public void setAwayClubPlayerSubstitutes(String[] awayClubPlayerSubstitutes) {
        this.awayClubPlayerSubstitutes = awayClubPlayerSubstitutes;
    }
}
