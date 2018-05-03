package com.ccsu.core.comment.service;

import com.ccsu.common.base.BaseService;
import com.ccsu.core.article.domain.Article;
import com.ccsu.core.comment.domain.Comment;
import com.ccsu.core.user.domain.User;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/15
 * @Time: 13:43
 * Description:
 */
public interface CommentService extends BaseService<Comment> {
    List<Comment> findAllByUserId(User user, String condition);

    List<Comment> findAllByReplyUserId(User user, String condition);

    List<Comment> findAllByArticleId(Article article);

    List<Comment> searchHotComment();

}
