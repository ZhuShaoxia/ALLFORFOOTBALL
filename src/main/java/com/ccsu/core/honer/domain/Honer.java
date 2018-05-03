package com.ccsu.core.honer.domain;

import com.ccsu.core.club.domain.Club;
import com.ccsu.core.country.domain.Country;
import com.ccsu.core.player.domain.Player;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/2
 * @Time: 20:30
 * Description:球员及俱乐部获得荣誉
 */
public class Honer {
    private Integer id;

    /**
     * 国家
     */
    private Country country;
    /**
     * 俱乐部
     */
    private Club club;
    /**
     * 球员
     */
    private Player player;

    /**
     * 荣誉名称
     */
    private String honerName;
    /**
     * 荣誉类型
     * 1 俱乐部
     * 2 球员
     */
    private String honerType;

    /**
     * 获得时间
     */
    private String honerTime;
    private String createTime;
    private String modifiedTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHonerName() {
        return honerName;
    }

    public void setHonerName(String honerName) {
        this.honerName = honerName;
    }

    public String getHonerType() {
        return honerType;
    }

    public void setHonerType(String honerType) {
        this.honerType = honerType;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(String modifiedTime) {
        this.modifiedTime = modifiedTime;
    }

    public String getHonerTime() {
        return honerTime;
    }

    public void setHonerTime(String honerTime) {
        this.honerTime = honerTime;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public Club getClub() {
        return club;
    }

    public void setClub(Club club) {
        this.club = club;
    }

    public Player getPlayer() {
        return player;
    }

    public void setPlayer(Player player) {
        this.player = player;
    }
}
