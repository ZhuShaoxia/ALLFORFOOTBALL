package com.ccsu.core.article.controller;

import com.ccsu.common.utils.CommonUtils;
import com.ccsu.common.utils.MessageCode;
import com.ccsu.core.article.domain.Article;
import com.ccsu.core.article.service.ArticleService;
import com.ccsu.core.articleType.domain.ArticleType;
import com.ccsu.core.articleType.service.ArticleTypeService;
import com.ccsu.core.comment.domain.Comment;
import com.ccsu.core.comment.service.CommentService;
import com.ccsu.core.common.domain.PageRequestDto;
import com.ccsu.core.common.domain.PageResponseDto;
import com.ccsu.core.common.domain.ResponseDto;
import com.ccsu.core.user.domain.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/15
 * @Time: 01:37
 * Description:
 */
@Controller
public class ArticleController {

    @Autowired
    private ArticleService articleService;
    @Autowired
    private ArticleTypeService articleTypeService;
    @Autowired
    private CommentService commentService;

    private ResponseDto responseDto;

    /**
     * 页面：文章列表
     *
     * @return
     */
    @RequestMapping("/admin/article/list")
    public String adminArticleList(Model model) {
        List<ArticleType> articleTypes = null;
        try {
            articleTypes = articleTypeService.findAll(null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("articleTypes",articleTypes);
        return "admin/article-list";
    }

    /**
     * 页面 文章添加
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/article/add")
    public String adminArticleAdd(Model model) {

        List<ArticleType> articleTypes = null;
        try {
            articleTypes = articleTypeService.findAll(null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("articleTypes", articleTypes);

        return "admin/article-add";
    }

    /**
     * 文章表单数据提交
     *
     * @param article
     * @return
     */
    @RequestMapping("/article/add")
    public @ResponseBody
    ResponseDto adminAddArticle(Article article, HttpSession session) {
        responseDto = new ResponseDto();
        try {
            User user = (User) session.getAttribute("user");
            article.setUser(user);
            articleService.add(article);
        } catch (Exception e) {
            e.printStackTrace();
            responseDto.setCode(MessageCode.ERROR);
            return responseDto;
        }
        return responseDto;
    }

    /**
     * 前台页面用户文章添加
     * @param file
     * @param article
     * @param session
     * @return
     */
    @RequestMapping("/article/userAdd")
    public String AddArticle(MultipartFile file, Article article, HttpSession session) {
        responseDto = new ResponseDto();
        String fileName = CommonUtils.UUIDGenerate();
        String originalFilename = file.getOriginalFilename();
        //文件扩展名
        String extension = FilenameUtils.getExtension(originalFilename);
        String realPath = "/Users/zhuxiaolei/IdeaProjects/ALLFORFOOTBALLUPLOAD/" + fileName + "." + extension;
        File f = new File(realPath);
        String imgUrl = null;
        try {
            //文件保存路径
            file.transferTo(f);
            imgUrl = "/uploadImg/" + fileName + "." + extension;
            User user = (User) session.getAttribute("user");
            article.setUser(user);
            article.setImgUrl(imgUrl);
            articleService.add(article);
        } catch (Exception e) {
            e.printStackTrace();
            responseDto.setCode(MessageCode.ERROR);
        }
        return "redirect:/user/article";
    }


    /**
     * 文章信息删除
     *
     * @param id
     * @return
     */
    @RequestMapping("/article/delete")
    public @ResponseBody
    ResponseDto deleteArticle(Integer id) {
        responseDto = new ResponseDto();
        try {
            articleService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            responseDto.setCode(MessageCode.ERROR);
            return responseDto;
        }
        return responseDto;
    }

    /**
     * 文章信息查询
     *
     * @param id
     * @return
     */
    @RequestMapping("/article/info/{id}")
    public String searchUser(@PathVariable Integer id, Model model) {
        Article article = null;
        try {
            article = articleService.load(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("article", article);
        return "article";
    }

    /**
     * 文章信息编辑
     *
     * @param id
     * @return
     */
    @RequestMapping("/article/edit")
    public ModelAndView edit(Integer id) {
        ModelAndView modelAndView = new ModelAndView("/admin/article-update");
        List<ArticleType> articleTypes = null;
        Article article = null;
        try {
            articleTypes = articleTypeService.findAll(null);
            article = articleService.load(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        modelAndView.addObject("articleTypes", articleTypes);
        modelAndView.addObject("article", article);
        return modelAndView;
    }

    /**
     * 文章信息更新
     *
     * @param article
     * @return
     */
    @RequestMapping("/article/update")
    public @ResponseBody
    ResponseDto updateUser(Article article, HttpSession session) {
        responseDto = new ResponseDto();
        if (article.getId() == null) {
            responseDto.setCode(MessageCode.ERROR);
            responseDto.setMsg("文章id为空");
            return responseDto;
        }
        try {
            articleService.update(article);
        } catch (Exception e) {
            e.printStackTrace();
            responseDto.setCode(MessageCode.ERROR);
            return responseDto;
        }
        return responseDto;
    }

    /**
     * 查询所有文章
     *
     * @return
     */
    @RequestMapping(value = {"/article/list"})
    public String findAll(PageRequestDto pageRequestDto, Model model) {
        PageHelper.startPage(1, 10);
        PageResponseDto<Article> pageResponseDto = null;
        try {
            List<Article> articles = articleService.findAll(pageRequestDto.getCondition());
            PageInfo<Article> pageInfo = new PageInfo<>(articles);
            Long count = pageInfo.getTotal();
            pageResponseDto = new PageResponseDto<Article>(articles, count);
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Comment> hotComment = commentService.searchHotComment();
        model.addAttribute("pageResponseDto", pageResponseDto);
        model.addAttribute("hotComment", hotComment);
        return "articleList";
    }

    /**
     * 分页查询所有文章
     *
     * @param pageRequestDto
     */
    @RequestMapping(value = {"/admin/article/table/list"})
    public @ResponseBody
    PageResponseDto<Article> findAll(PageRequestDto pageRequestDto) {
        PageHelper.startPage(pageRequestDto.getPage(), pageRequestDto.getLimit());
        List<Article> articles = null;
        PageResponseDto<Article> pageResponseDto = null;
        try {
//            articles = articleService.findAll(pageRequestDto.getCondition());
            articles = articleService.findAllByRequestDto(pageRequestDto);
            PageInfo<Article> pageInfo = new PageInfo<>(articles);
            Long count = pageInfo.getTotal();
            pageResponseDto = new PageResponseDto<Article>(articles, count);
        } catch (Exception e) {
            e.printStackTrace();
            pageResponseDto.setCode(MessageCode.ERROR);
            return pageResponseDto;
        }
        return pageResponseDto;
    }


}
