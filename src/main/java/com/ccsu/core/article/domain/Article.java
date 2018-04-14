package com.ccsu.core.article.domain;

import com.ccsu.core.articleType.domain.ArticleType;
import com.ccsu.core.comment.domain.Comment;
import com.ccsu.core.user.domain.User;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/2
 * @Time: 14:26
 * Description: 文章实体类
 */
public class Article {

    private Integer id;

    /**
     * 标题
     */
    private String title;

    /**
     * 副标题
     */
    private String subtitle;

    /**
     * 作者
     */
    private User user;

    /**
     * 文章轮播图片
     */
    private String imgUrl;

    /**
     * 文章类型
     */
    private ArticleType articleType;

    private String createTime;
    private String modifiedTime;

    /**
     * 当前文章评论集合
     */
    private List<Comment> commentList;

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public ArticleType getArticleType() {
        return articleType;
    }

    public void setArticleType(ArticleType articleType) {
        this.articleType = articleType;
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
