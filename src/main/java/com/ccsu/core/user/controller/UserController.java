package com.ccsu.core.user.controller;

import com.ccsu.common.utils.MessageCode;
import com.ccsu.core.article.domain.Article;
import com.ccsu.core.article.service.ArticleService;
import com.ccsu.core.articleType.domain.ArticleType;
import com.ccsu.core.articleType.service.ArticleTypeService;
import com.ccsu.core.club.service.ClubService;
import com.ccsu.core.comment.domain.Comment;
import com.ccsu.core.comment.service.CommentService;
import com.ccsu.core.common.domain.ResponseDto;
import com.ccsu.core.country.service.CountryService;
import com.ccsu.core.user.domain.User;
import com.ccsu.core.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/25
 * @Time: 13:10
 * Description:
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private CountryService countryService;
    @Autowired
    private ClubService clubService;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private ArticleTypeService articleTypeService;
    @Autowired
    private CommentService commentService;

    private ResponseDto responseDto;

    /**
     * 页面:注册
     *
     * @return
     */
    @RequestMapping("/register")
    public String userLogin() {
        return "register";
    }

    /**
     * 忘记密码
     *
     * @return
     */
    @RequestMapping("/forgetPwd")
    public String userForgetPwd() {
        return "forgetPwd";
    }


    /**
     * 页面:用户中心
     *
     * @param userId
     * @param model
     * @return
     */
    @RequestMapping("/user/center")
    public String userCenter(Integer userId, Model model) {

        return "user-center";
    }

    /**
     * 页面:用户中心 评论
     *
     * @param model
     * @return
     */
    @RequestMapping("/user/comment")
    public String userComment(HttpSession session, String condition, Model model) {
        User user = (User) session.getAttribute("user");
        List<Comment> userComments = commentService.findAllByUserId(user, condition);
        model.addAttribute("userComments", userComments);
        return "user-comment";
    }

    /**
     * 页面:用户中心 文章
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/user/article")
    public String userArticle(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        List<Article> articles = articleService.findAllByUserId(user.getId());
        List<ArticleType> articleTypes = null;
        try {
            articleTypes = articleTypeService.findAll(null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("articles", articles);
        model.addAttribute("articleTypes", articleTypes);
        return "user-article";
    }

    @RequestMapping("/user/articleAdd")
    public String userArticleAdd(Model model) {
        List<ArticleType> articleTypes = null;
        try {
            articleTypes = articleTypeService.findAll(null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("articleTypes", articleTypes);
        return "user-article-add";
    }

    /**
     * 页面:用户设置
     *
     * @param userId
     * @param model
     * @return
     */
    @RequestMapping("/user/setting/info")
    public String userSettingInfo(Integer userId, Model model) {

        return "setting-profile";
    }

    /**
     * 页面:账号绑定
     *
     * @param session
     * @return
     */
    @RequestMapping("/user/setting/bind")
    public String userSettingBind(HttpSession session) {
        User user = (User) session.getAttribute("user");
        try {
            user = userService.load(user.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.setAttribute("user", user);
        return "setting-bind";
    }

    /**
     * 账号绑定之修改绑定手机号
     *
     * @param user
     * @return
     */
    @RequestMapping("/user/changePhone")
    public @ResponseBody
    ResponseDto userUpdatePhone(User user) {
        responseDto = new ResponseDto();
        try {
            userService.updateUserPhone(user);
        } catch (Exception e) {
            responseDto.setCode(MessageCode.ERROR);
            e.printStackTrace();
            return responseDto;
        }
        return responseDto;
    }

    /**
     * 账号绑定之修改绑定邮箱账号
     * @param user
     * @return
     */
    @RequestMapping("/user/changeEmail")
    public @ResponseBody
    ResponseDto userUpdateEmail(User user) {
        responseDto = new ResponseDto();
        try {
            userService.updateUserEmail(user);
        } catch (Exception e) {
            responseDto.setCode(MessageCode.ERROR);
            e.printStackTrace();
            return responseDto;
        }
        return responseDto;
    }


    /**
     * 页面:修改密码
     *
     * @param model
     * @return
     */
    @RequestMapping("/user/setting/modifyPwd")
    public String userSettingModifyPwd(Model model) {

        return "setting-changePwd";
    }

    /**
     * 修改用户密码
     *
     * @param user
     * @return
     */
    @RequestMapping("/user/changePwd")
    public @ResponseBody
    ResponseDto userUpdatePwd(User user) {
        responseDto = new ResponseDto();
        try {
            userService.updateUserPwd(user);
        } catch (Exception e) {
            responseDto.setCode(MessageCode.ERROR);
            e.printStackTrace();
            return responseDto;
        }
        return responseDto;
    }

    @RequestMapping("/user/updateUser")
    public @ResponseBody
    ResponseDto updateUser(User user, HttpSession session) {
        responseDto = new ResponseDto();
        try {
            userService.userUpdate(user);
            User load = userService.load(user.getId());
            session.setAttribute("user", load);
        } catch (Exception e) {
            responseDto.setCode(MessageCode.ERROR);
            e.printStackTrace();
            return responseDto;
        }
        return responseDto;
    }
}
