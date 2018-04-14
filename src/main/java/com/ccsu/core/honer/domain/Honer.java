package com.ccsu.core.honer.domain;

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
     * 荣誉名称
     */
    private String honerName;
    /**
     * 荣誉类型
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

    public void setCreateTime(String gcreateTime) {
        this.createTime = createTime;
    }

    public String getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(String gmodifiedTime) {
        this.modifiedTime = modifiedTime;
    }

    public String getHonerTime() {
        return honerTime;
    }

    public void setHonerTime(String honerTime) {
        this.honerTime = honerTime;
    }
}
