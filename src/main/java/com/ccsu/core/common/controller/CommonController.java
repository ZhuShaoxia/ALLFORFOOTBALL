package com.ccsu.core.common.controller;

import com.ccsu.common.utils.CommonUtils;
import com.ccsu.common.utils.MessageCode;
import com.ccsu.core.article.domain.Article;
import com.ccsu.core.article.service.ArticleService;
import com.ccsu.core.club.service.ClubService;
import com.ccsu.core.comment.domain.Comment;
import com.ccsu.core.comment.service.CommentService;
import com.ccsu.core.common.domain.PageRequestDto;
import com.ccsu.core.common.domain.ResponseDto;
import com.ccsu.core.country.service.CountryService;
import com.ccsu.core.matchInfo.domain.MatchInfo;
import com.ccsu.core.matchInfo.service.MatchInfoService;
import com.ccsu.core.matchProcess.domain.MatchProcess;
import com.ccsu.core.matchProcess.service.MatchProcessService;
import com.ccsu.core.matchType.domain.MatchType;
import com.ccsu.core.matchType.service.MatchTypeService;
import com.ccsu.core.ranking.domain.Ranking;
import com.ccsu.core.ranking.service.RankingService;
import com.ccsu.core.user.domain.User;
import com.ccsu.core.user.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/4
 * @Time: 09:49
 * Description:公共controller
 */
@Controller
public class CommonController {
    @Autowired
    private UserService userService;
    @Autowired
    private CountryService countryService;
    @Autowired
    private ClubService clubService;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private MatchInfoService matchInfoService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private RankingService rankingService;
    @Autowired
    private MatchProcessService matchProcessService;
    @Autowired
    private MatchTypeService matchTypeService;
    private ResponseDto responseDto;

    /**
     * 页面:首页
     *
     * @return
     */
    @RequestMapping("/")
    public String index(Model model) {
        //轮播展示文章
        List<Article> articlesIsCarousel = articleService.searchAllCarousel();
        model.addAttribute("articlesIsCarousel", articlesIsCarousel);
        //焦点比赛
        List<MatchInfo> currentFocusMatchInfos = matchInfoService.searchMatchInfoForIndex();
        model.addAttribute("currentFocusMatchInfos", currentFocusMatchInfos);
        //各个文章类型文章
        for (int i = 1; i < 10; i++) {
            List<Article> articles = articleService.searchArticleForIndex(i);
            model.addAttribute("articlesByType" + i, articles);
        }
        //比赛积分表
        List<Ranking> zcRanking = rankingService.findAllByMatchTypeId(1);
        List<Ranking> xjRanking = rankingService.findAllByMatchTypeId(2);
        List<Ranking> ycRanking = rankingService.findAllByMatchTypeId(3);
        List<Ranking> yjRanking = rankingService.findAllByMatchTypeId(4);
        List<Ranking> djRanking = rankingService.findAllByMatchTypeId(5);
        model.addAttribute("zcRanking", zcRanking);
        model.addAttribute("ycRanking", ycRanking);
        model.addAttribute("xjRanking", xjRanking);
        model.addAttribute("yjRanking", yjRanking);
        model.addAttribute("djRanking", djRanking);

        return "index2";
    }

    /**
     * 错误页面
     *
     * @return
     */
    @RequestMapping("/error")
    public String errorJsp() {
        return "error";
    }

    /**
     * 后台首页
     *
     * @return
     */
    @RequestMapping("/admin")
    public String adminIndex() {
        return "forward:/admin/login";
    }

    /**
     * 文章列表
     *
     * @return
     */
    @RequestMapping("/articles")
    public String article(PageRequestDto pageRequestDto, Model model) {
        Integer page = pageRequestDto.getPage();
        if (page == null) {
            page = 1;
        }
        Integer articleTypeId = pageRequestDto.getArticleTypeId();
        if (articleTypeId == null) {
            articleTypeId = 1;
            pageRequestDto.setArticleTypeId(articleTypeId);
        }
        PageHelper.startPage(page, 10);

        PageInfo<Article> pageInfo = null;
        List<Article> articles = null;
        try {
            articles = articleService.findAllByRequestDto(pageRequestDto);
            pageInfo = new PageInfo<>(articles);
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Comment> hotComment = commentService.searchHotComment();
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("hotComment", hotComment);
        model.addAttribute("articleTypeId", articleTypeId);
        return "articleList";
    }

    /**
     * 页面加载数据 加载文章
     *
     * @param pageRequestDto
     * @return
     */
    @RequestMapping("/article/loading")
    public @ResponseBody
    List<Article> article(PageRequestDto pageRequestDto) {
        Integer page = pageRequestDto.getPage();
        if (page == null) {
            page = 1;
        }
        Integer articleTypeId = pageRequestDto.getArticleTypeId();
        if (articleTypeId == null) {
            articleTypeId = 1;
            pageRequestDto.setArticleTypeId(articleTypeId);
        }
        PageHelper.startPage(page, 10);

        PageInfo<Article> pageInfo = null;
        List<Article> articles = null;
        try {
            articles = articleService.findAllByRequestDto(pageRequestDto);
            pageInfo = new PageInfo<>(articles);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pageInfo.getList();
    }


    /**
     * 比赛列表
     *
     * @return
     */
    @RequestMapping("/matches")
    public String matches(Integer matchTypeId, Model model) {
        if (matchTypeId == null) {
            matchTypeId = 1;
        }
        Map<String, List<MatchInfo>> matchInfos = matchInfoService.searchMatchForList(matchTypeId);
        model.addAttribute("matchInfos", matchInfos);
        return "game-list";
    }

    @RequestMapping("/data")
    public String data(Integer matchTypeId, Model model) {
        if (matchTypeId == null) {
            matchTypeId = 1;
        }
        //积分榜
        List<Ranking> rankings = rankingService.findAllByMatchTypeId(matchTypeId);
        //射手榜
        List<MatchProcess> shooterList = matchProcessService.searchPlayerEvent(matchTypeId, 3);
        //助攻榜
        List<MatchProcess> assistsList = matchProcessService.searchPlayerEvent(matchTypeId, 4);
        //赛程表
        List<MatchInfo> matchInfos = matchInfoService.searchMatchInfoByMatchTypeAndMatchTimes(matchTypeId, 1);
        MatchType matchType = null;
        try {
            matchType = matchTypeService.load(matchTypeId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("rankings", rankings);
        model.addAttribute("shooterList", shooterList);
        model.addAttribute("assistsList", assistsList);
        model.addAttribute("matchInfos", matchInfos);
        model.addAttribute("matchTypeId", matchTypeId);
        model.addAttribute("matchType", matchType);
        return "data";
    }

    /**
     * 数据页面 赛程表
     *
     * @param matchTypeId
     * @param matchTimes
     * @return
     */
    @RequestMapping("/match/searchMatchInfoByMatchTypeAndMatchTimes")
    public @ResponseBody
    List<MatchInfo> searchMatchInfoByMatchTypeAndMatchTimes(Integer matchTypeId, Integer matchTimes) {
        return matchInfoService.searchMatchInfoByMatchTypeAndMatchTimes(matchTypeId, matchTimes);
    }


    /**
     * 图片上传
     *
     * @param file
     * @param type
     * @return
     */
    @RequestMapping("/upload/img")
    public @ResponseBody
    ResponseDto uploadImg(MultipartFile file, String type, HttpSession session) {
        responseDto = new ResponseDto();
        String fileName = CommonUtils.UUIDGenerate();
        String originalFilename = file.getOriginalFilename();
        //文件扩展名
        String extension = FilenameUtils.getExtension(originalFilename);
        String realPath = "/Users/zhuxiaolei/IdeaProjects/ALLFORFOOTBALLUPLOAD/" + fileName + "." + extension;
        //TODO:如何根据虚拟目录获得实际目录
//        String realPath = session.getServletContext().getRealPath("/uploadImg/");
//        String imgFileName = fileName + "." + extension;
        File f = new File(realPath);
        String url = null;
        try {
            //文件保存路径
            file.transferTo(f);
            url = "/uploadImg/" + fileName + "." + extension;
            responseDto.setUrl(url);
        } catch (Exception e) {
            e.printStackTrace();
            responseDto.setCode(MessageCode.ERROR);
            return responseDto;
        }
        return responseDto;
    }


    /**
     * 发送短信验证码
     *
     * @param phone
     * @return
     */
    @RequestMapping("/send/sms/verificationCode")
    public @ResponseBody
    ResponseDto sendSMSCode(String phone) {
        responseDto = new ResponseDto();
        User user = new User();
        user.setPhone(phone);
        String SMSCode;
        try {
            SMSCode = CommonUtils.sendSMSCode(user);
        } catch (Exception e) {
            responseDto.setCode(MessageCode.ERROR);
            e.printStackTrace();
            return responseDto;
        }
        responseDto.setSMSCode(SMSCode);
        return responseDto;
    }

    /**
     * 发送邮箱验证码
     *
     * @param email
     * @param session
     * @return
     */
    @RequestMapping("/send/email/verificationCode")
    public @ResponseBody
    ResponseDto sendEmailCode(String email, HttpSession session) {
        responseDto = new ResponseDto();
        User user = (User) session.getAttribute("user");
        user.setEmail(email);
        try {
            String code = CommonUtils.sendMailCode(user);
            responseDto.setSMSCode(code);
        } catch (MessagingException | UnsupportedEncodingException e) {
            e.printStackTrace();
            responseDto.setCode(MessageCode.ERROR);
            return responseDto;
        }
        return responseDto;
    }

    @RequestMapping("/testsss")
    public @ResponseBody
    ResponseDto test(@RequestParam(value = "a", required = false) String a, @RequestParam(value = "b", required = false) String b) {
        responseDto = new ResponseDto();
//        String realPath = request.getSession().getServletContext().getRealPath("/uploadImg");
//        String contextPath = request.getContextPath();
//        String requestURI = request.getRequestURI();
//        String servletPath = request.getServletPath();
//        String remoteUser = request.getRemoteUser();
        responseDto.setSMSCode("223123123");
        return responseDto;

    }
}
