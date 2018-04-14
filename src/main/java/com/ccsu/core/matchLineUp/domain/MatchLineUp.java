package com.ccsu.core.matchLineUp.domain;

import com.ccsu.core.club.domain.Club;
import com.ccsu.core.matchInfo.domain.MatchInfo;
import com.ccsu.core.player.domain.Player;

import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/2
 * @Time: 20:45
 * Description:比赛阵容信息
 */
public class MatchLineUp {
    private Integer id;
    /**
     * 比赛信息
     */
    private MatchInfo matchInfo;
    /**
     * 俱乐部信息
     */
    private Club club;
    /**
     * 球员类型
     * 1 首发
     * 2 替补
     */
    private Integer playerType;

    private Player p1;
    private Player p2;
    private Player p3;
    private Player p4;
    private Player p5;
    private Player p6;
    private Player p7;
    private Player p8;
    private Player p9;
    private Player p10;
    private Player p11;
    private Player p12;


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

    public Integer getPlayerType() {
        return playerType;
    }

    public void setPlayerType(Integer playerType) {
        this.playerType = playerType;
    }

    public Player getP1() {
        return p1;
    }

    public void setP1(Player p1) {
        this.p1 = p1;
    }

    public Player getP2() {
        return p2;
    }

    public void setP2(Player p2) {
        this.p2 = p2;
    }

    public Player getP3() {
        return p3;
    }

    public void setP3(Player p3) {
        this.p3 = p3;
    }

    public Player getP4() {
        return p4;
    }

    public void setP4(Player p4) {
        this.p4 = p4;
    }

    public Player getP5() {
        return p5;
    }

    public void setP5(Player p5) {
        this.p5 = p5;
    }

    public Player getP6() {
        return p6;
    }

    public void setP6(Player p6) {
        this.p6 = p6;
    }

    public Player getP7() {
        return p7;
    }

    public void setP7(Player p7) {
        this.p7 = p7;
    }

    public Player getP8() {
        return p8;
    }

    public void setP8(Player p8) {
        this.p8 = p8;
    }

    public Player getP9() {
        return p9;
    }

    public void setP9(Player p9) {
        this.p9 = p9;
    }

    public Player getP10() {
        return p10;
    }

    public void setP10(Player p10) {
        this.p10 = p10;
    }

    public Player getP11() {
        return p11;
    }

    public void setP11(Player p11) {
        this.p11 = p11;
    }

    public Player getP12() {
        return p12;
    }

    public void setP12(Player p12) {
        this.p12 = p12;
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
