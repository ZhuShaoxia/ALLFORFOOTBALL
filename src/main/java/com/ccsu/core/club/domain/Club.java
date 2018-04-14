package com.ccsu.core.club.domain;

import com.ccsu.core.country.domain.Country;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/2
 * @Time: 14:31
 * Description: 俱乐部实体类
 */
public class Club {

    private Integer id;
    /**
     * 俱乐部名字
     */
    private String name;
    /**
     * 俱乐部外文名
     */
    private String otherName;
    /**
     * 队徽url
     */
    private String imgUrl;
    /**
     * 成立时间  格式:2018-04
     */
    private String established;

    /**
     * 国家
     */
    private Country country;
    /**
     * 所处城市
     */
    private String city;
    /**
     * 联系电话
     */
    private String phone;
    /**
     * 联系邮箱
     */
    private String email;
    /**
     * 主场名字
     */
    private String homeField;
    /**
     * 地址
     */
    private String address;
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

    public String getEstablished() {
        return established;
    }

    public void setEstablished(String established) {
        this.established = established;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHomeField() {
        return homeField;
    }

    public void setHomeField(String homeField) {
        this.homeField = homeField;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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
