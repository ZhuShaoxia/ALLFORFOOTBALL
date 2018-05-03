package com.ccsu.core.comment.dao;

import com.ccsu.common.base.BaseDao;
import com.ccsu.core.comment.domain.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/15
 * @Time: 01:38
 * Description:
 */
@Repository
public interface CommentMapper extends BaseDao<Comment> {
    List<Comment> findAllByUserId(Integer id, String condition);

    List<Comment> findAllByReplyUserId(Integer id, String condition);

    List<Comment> findAllByArticleId(Integer id);
    List<Comment> searchHotComment();

}
