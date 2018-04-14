package com.ccsu.core.common.domain;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/9
 * @Time: 20:16
 * Description:请求实体:用户分页
 */
public class PageRequestDto {
    /**
     * 当期页
     */
    private Integer page;
    /**
     * 每页显示数量
     */
    private Integer limit;
    /**
     * 查询条件
     */
    private String condition;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }
}
