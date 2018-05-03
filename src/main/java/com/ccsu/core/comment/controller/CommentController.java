package com.ccsu.core.comment.controller;

import com.ccsu.common.utils.MessageCode;
import com.ccsu.core.comment.domain.Comment;
import com.ccsu.core.comment.service.CommentService;
import com.ccsu.core.common.domain.ResponseDto;
import com.ccsu.core.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/26
 * @Time: 17:23
 * Description:
 */
@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;
    private ResponseDto responseDto;

    /**
     * 评论添加
     *
     * @param comment
     * @return
     */
    @RequestMapping("/comment/add")
    public @ResponseBody
    ResponseDto commentAdd(Comment comment) {
        responseDto = new ResponseDto();
        try {
            commentService.add(comment);
        } catch (Exception e) {
            responseDto.setCode(MessageCode.ERROR);
            e.printStackTrace();
            return responseDto;
        }
        return responseDto;
    }

    /**
     * 查找用户评论内容及被回复评论
     *
     * @param typeId
     * @param session
     * @return
     */
    @RequestMapping("/comment/findByUserId")
    public @ResponseBody
    List<Comment>
    searchCommentByUserId(Integer typeId, String condition, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<Comment> comments = null;
        if (typeId == 1) {
            comments = commentService.findAllByUserId(user,condition);
        } else if (typeId == 2) {
            comments = commentService.findAllByReplyUserId(user,condition);
        }
        return comments;
    }

}
