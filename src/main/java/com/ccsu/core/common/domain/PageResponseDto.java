package com.ccsu.core.common.domain;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/9
 * @Time: 20:20
 * Description: 分页返回实体
 */
public class PageResponseDto<T> {

    /**
     * 数据状态 默认成功 200
     */
    private String code;
    /**
     * 状态信息
     */
    private String msg;
    /**
     * 分页返回当前页数据
     */
    private List<T> data;
    /**
     * 数据总长度
     */
    private Long count;


    public PageResponseDto(List<T> data, Long count) {
        this.code = "200";
        this.msg = "";
        this.data = data;
        this.count = count;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }
}
