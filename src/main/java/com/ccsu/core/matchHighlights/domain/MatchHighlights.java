package com.ccsu.core.matchHighlights.domain;

import com.ccsu.core.matchInfo.domain.MatchInfo;

import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/2
 * @Time: 21:12
 * Description:比赛集锦
 */
public class MatchHighlights {
    private Integer id;
    private MatchInfo matchInfo;

    /**
     * 集锦内容
     */
    private String content;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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
