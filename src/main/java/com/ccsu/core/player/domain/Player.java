package com.ccsu.core.player.domain;

import com.ccsu.core.club.domain.Club;
import com.ccsu.core.playerPosition.domain.PlayerPosition;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/2
 * @Time: 20:47
 * Description:运动员实体类
 */
public class Player {
    private Integer id;
    private String name;
    private String otherName;
    private String imgUrl;

    /**
     * 所属俱乐部
     */
    private Club club;
    /**
     * 国家名字 String 类型
     */
    private String country;
    /**
     * 球员位置
     */
    private PlayerPosition playerPosition;
    /**
     * 号码
     */
    private Integer number;
    /**
     * 生日
     */
    private String birthday;
    /**
     * 年龄
     */
    private Integer age;
    /**
     * 身高 cm
     */
    private Integer height;
    /**
     * 体重 kg
     */
    private Integer weight;
    /**
     * 惯用脚 1左脚 2 右脚
     */
    private Integer usualFoot;
    /**
     * 力量 0-100
     */
    private Integer power;

    /**
     * 速度 0-100
     */
    private Integer speed;

    /**
     * 射门 0-100
     */
    private Integer shooting;

    /**
     * 传球 0-100
     */
    private Integer pass;
    /**
     * 盘带 0-100
     */
    private Integer dribbling;
    /**
     * 防守 0-100
     */
    private Integer defensive;

    private String createTime;
    private String modifiedTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOtherName() {
        return otherName;
    }

    public void setOtherName(String otherName) {
        this.otherName = otherName;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public Club getClub() {
        return club;
    }

    public void setClub(Club club) {
        this.club = club;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public PlayerPosition getPlayerPosition() {
        return playerPosition;
    }

    public void setPlayerPosition(PlayerPosition playerPosition) {
        this.playerPosition = playerPosition;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }

    public Integer getUsualFoot() {
        return usualFoot;
    }

    public void setUsualFoot(Integer usualFoot) {
        this.usualFoot = usualFoot;
    }

    public Integer getPower() {
        return power;
    }

    public void setPower(Integer power) {
        this.power = power;
    }

    public Integer getSpeed() {
        return speed;
    }

    public void setSpeed(Integer speed) {
        this.speed = speed;
    }

    public Integer getShooting() {
        return shooting;
    }

    public void setShooting(Integer shooting) {
        this.shooting = shooting;
    }

    public Integer getPass() {
        return pass;
    }

    public void setPass(Integer pass) {
        this.pass = pass;
    }

    public Integer getDribbling() {
        return dribbling;
    }

    public void setDribbling(Integer dribbling) {
        this.dribbling = dribbling;
    }

    public Integer getDefensive() {
        return defensive;
    }

    public void setDefensive(Integer defensive) {
        this.defensive = defensive;
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
}
