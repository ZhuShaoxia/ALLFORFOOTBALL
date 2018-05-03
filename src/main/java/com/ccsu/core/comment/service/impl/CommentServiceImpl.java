package com.ccsu.core.comment.service.impl;

import com.ccsu.common.utils.CommonUtils;
import com.ccsu.core.article.domain.Article;
import com.ccsu.core.comment.dao.CommentMapper;
import com.ccsu.core.comment.domain.Comment;
import com.ccsu.core.comment.service.CommentService;
import com.ccsu.core.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/15
 * @Time: 13:43
 * Description:
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<Comment> findAllByUserId(User user, String condition) {
        return commentMapper.findAllByUserId(user.getId(),condition);
    }

    @Override
    public List<Comment> findAllByReplyUserId(User user, String condition) {
        return commentMapper.findAllByReplyUserId(user.getId(),condition);
    }

    @Override
    public List<Comment> findAllByArticleId(Article article) {
        return commentMapper.findAllByArticleId(article.getId());
    }

    @Override
    public List<Comment> searchHotComment() {
        return commentMapper.searchHotComment();
    }

    @Override
    public void add(Comment comment) throws Exception {
        String currentDateTime = CommonUtils.getCurrentDateTime();
        comment.setCreateTime(currentDateTime);
        comment.setModifiedTime(currentDateTime);
        commentMapper.save(comment);
    }

    @Override
    public void delete(Integer id) throws Exception {
        commentMapper.delete(id);
    }

    @Override
    public void update(Comment comment) throws Exception {
        String currentTime = CommonUtils.getCurrentDateTime();
        comment.setModifiedTime(currentTime);
        commentMapper.update(comment);
    }

    @Override
    public Comment load(Integer id) throws Exception {
        return commentMapper.findById(id);
    }

    @Override
    public List<Comment> findAll(String condition) throws Exception {
        return commentMapper.findAll(condition);
    }
}
