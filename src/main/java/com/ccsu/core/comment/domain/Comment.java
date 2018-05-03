package com.ccsu.core.comment.domain;

import com.ccsu.core.article.domain.Article;
import com.ccsu.core.user.domain.User;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/2
 * @Time: 14:35
 * Description: 评论实体类
 */
public class Comment {
    private Integer id;

    /**
     * 文章
     */
    private Article article;

    /**
     * 用户
     */
    private User user;

    /**
     * 被回复用户
     */
    private User replyUser;

    /**
     * 评论楼层
     */
    private Integer floor;

    /**
     * 评论内容
     */
    private String content;

    /**
     * 回复楼层
     */
    private Integer replyFloor;

    /**
     * 回复楼层内容
     */
    private String replyContent;

    private String createTime;
    private String modifiedTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getFloor() {
        return floor;
    }

    public void setFloor(Integer floor) {
        this.floor = floor;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getReplyFloor() {
        return replyFloor;
    }

    public void setReplyFloor(Integer replyFloor) {
        this.replyFloor = replyFloor;
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

    public User getReplyUser() {
        return replyUser;
    }

    public void setReplyUser(User replyUser) {
        this.replyUser = replyUser;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

}
