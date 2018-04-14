package com.ccsu.common.base;

import com.ccsu.core.common.domain.PageRequestDto;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/9
 * @Time: 20:28
 * Description:
 */
public class PageDomain {
    private Integer pageNum;
    private Integer pageSize;
    private String condition;

    public PageDomain() {
    }

    public PageDomain(PageRequestDto pageRequestDto) {
        this.pageNum = pageRequestDto.getPage();
        this.pageSize = pageRequestDto.getLimit();
        this.condition = pageRequestDto.getCondition();
    }

    public Integer getPage() {
        return pageNum;
    }

    public void setPage(Integer page) {
        this.pageNum = page;
    }

    public Integer getLimit() {
        return pageSize;
    }

    public void setLimit(Integer limit) {
        this.pageSize = limit;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }
}
