package com.ccsu.core.common.domain;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/18
 * @Time: 20:02
 * Description:
 */
public class RequestDto {
    private Integer matchTypeId;
    private Integer articleTypeId;
    private String condition;
    private String startTime;
    private String endTime;
    private Integer page;
    private Integer limit;

    public Integer getArticleTypeId() {
        return articleTypeId;
    }

    public void setArticleTypeId(Integer articleTypeId) {
        this.articleTypeId = articleTypeId;
    }

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

    public Integer getMatchTypeId() {
        return matchTypeId;
    }

    public void setMatchTypeId(Integer matchTypeId) {
        this.matchTypeId = matchTypeId;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
}
