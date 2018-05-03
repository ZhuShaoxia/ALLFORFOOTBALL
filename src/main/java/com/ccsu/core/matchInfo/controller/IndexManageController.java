package com.ccsu.core.matchInfo.controller;

import com.ccsu.core.article.domain.Article;
import com.ccsu.core.article.service.ArticleService;
import com.ccsu.core.common.domain.ResponseDto;
import com.ccsu.core.matchInfo.domain.MatchInfo;
import com.ccsu.core.matchInfo.service.MatchInfoService;
import com.ccsu.core.matchType.service.MatchTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/24
 * @Time: 10:16
 * Description:
 */
@Controller
public class IndexManageController {


    @Autowired
    private MatchInfoService matchInfoService;
    @Autowired
    private MatchTypeService matchTypeService;
    @Autowired
    private ArticleService articleService;

    private ResponseDto responseDto;


    /**
     * 页面：后台界面 焦点比赛管理
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/index/match/focus")
    public String adminMatchFocusSelect(Model model) {
        List<MatchInfo> currentFocusMatchInfos = matchInfoService.searchMatchInfoForIndex();
        model.addAttribute("currentFocusMatchInfos", currentFocusMatchInfos);

        List<MatchInfo> matchInfos = matchInfoService.searchMatchInfoForIndexSelect();

        model.addAttribute("matchInfos", matchInfos);
        return "/admin/index-focus-game";
    }


    /**
     * 当前焦点比赛删除
     *
     * @param matchInfo
     * @return
     */
    @RequestMapping("/index/match/focus/update")
    public @ResponseBody
    ResponseDto adminMatchFocusStateUpdate(MatchInfo matchInfo) {
        responseDto = new ResponseDto();
        matchInfoService.updateMatchInfoFocus(matchInfo);
        return responseDto;
    }


    /**
     * 页面：首页管理 轮播图片
     * @param model
     * @return
     */
    @RequestMapping("/admin/index/article/carousel")
    public String adminArticleCarouselSelect(Model model) {
        List<Article> articlesIsCarousel = articleService.searchAllCarousel();
        model.addAttribute("articlesIsCarousel", articlesIsCarousel);

        List<Article> articles = articleService.searchArticleForCarousel();
        model.addAttribute("articles", articles);
        return "/admin/index-carousel-article";
    }

    /**
     * 轮播状态改变
     * @param article
     * @return
     */
    @RequestMapping("/index/article/carousel/update")
    public @ResponseBody
    ResponseDto adminArticleCarouselUpdate(Article article) {
        responseDto = new ResponseDto();
        articleService.updateCarouselState(article);
        return responseDto;
    }
}
