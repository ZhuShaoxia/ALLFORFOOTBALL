package com.ccsu.core.country.domain;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/10
 * @Time: 18:01
 * Description:国家队实体类
 */

/**
 * create table tb_country
 * (
 * id int auto_increment
 * primary key,
 * name varchar(255) null,
 * otherName varchar(255) null,
 * imgUrl varchar(255) null,
 * established varchar(255) null,
 * phone varchar(11) null,
 * email varchar(255) null,
 * homeField varchar(255) null,
 * address varchar(255) null,
 * gmt_create varchar(255) null,
 * gmt_modified varchar(255) null
 * )
 * ;
 */
public class Country {
    private Integer id;
    private String name;
    private String otherName;
    private String imgUrl;
    /**
     * 成立时间
     */
    private String established;
    private String phone;
    private String email;
    /**
     * 主场名字
     */
    private String homeField;
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
