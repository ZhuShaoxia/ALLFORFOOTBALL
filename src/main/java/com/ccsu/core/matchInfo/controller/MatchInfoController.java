package com.ccsu.core.matchInfo.controller;

import com.ccsu.common.utils.MessageCode;
import com.ccsu.core.article.domain.Article;
import com.ccsu.core.article.service.ArticleService;
import com.ccsu.core.club.domain.Club;
import com.ccsu.core.common.domain.PageRequestDto;
import com.ccsu.core.common.domain.PageResponseDto;
import com.ccsu.core.common.domain.RequestDto;
import com.ccsu.core.common.domain.ResponseDto;
import com.ccsu.core.matchHighlights.domain.MatchHighlights;
import com.ccsu.core.matchHighlights.service.MatchHighlightsService;
import com.ccsu.core.matchInfo.domain.MatchInfo;
import com.ccsu.core.matchInfo.service.MatchInfoService;
import com.ccsu.core.matchProcess.domain.MatchProcess;
import com.ccsu.core.matchProcess.service.MatchProcessService;
import com.ccsu.core.matchTechnologyStatistics.domain.MatchTechnologyStatistics;
import com.ccsu.core.matchTechnologyStatistics.service.MatchTechnologyService;
import com.ccsu.core.matchType.domain.MatchType;
import com.ccsu.core.matchType.service.MatchTypeService;
import com.ccsu.core.player.domain.Player;
import com.ccsu.core.player.service.PlayerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/16
 * @Time: 10:11
 * Description:
 */
@Controller
public class MatchInfoController {


    @Autowired
    private MatchInfoService matchInfoService;
    @Autowired
    private MatchTypeService matchTypeService;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private MatchTechnologyService matchTechnologyService;
    @Autowired
    private PlayerService playerService;
    @Autowired
    private MatchHighlightsService matchHighlightsService;
    @Autowired
    private MatchProcessService matchProcessService;
    private ResponseDto responseDto;

    /**
     * 页面:比赛列表首页
     *
     * @return
     */
    @RequestMapping("/admin/match/list")
    public String adminMatchList(Model model) {
        List<MatchType> matchTypes = null;
        try {
            matchTypes = matchTypeService.findAll(null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("matchTypes", matchTypes);
        return "/admin/match-list";
    }

    /**
     * 页面:比赛基本信息添加
     *
     * @return
     */
    @RequestMapping("/admin/match/info/add")
    public String adminMatchInfoAdd(Model model) {
        List<MatchType> matchTypes = null;
        try {
            matchTypes = matchTypeService.findAll(null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("matchTypes", matchTypes);

        return "/admin/match-info-add";
    }


    /**
     * 比赛表单数据提交
     *
     * @param matchInfo
     * @return
     */
    @RequestMapping("/match/info/add")
    public @ResponseBody
    ResponseDto addMatchInfo(MatchInfo matchInfo) throws Exception {
        responseDto = new ResponseDto();
        try {
            matchInfoService.add(matchInfo);
        } catch (Exception e) {
            e.printStackTrace();
            responseDto.setCode(MessageCode.ERROR);
            return responseDto;
        }
        return responseDto;
    }

    /**
     * 比赛信息删除
     *
     * @param id
     * @return
     */
    @RequestMapping("/match/info/delete")
    public ResponseDto deleteMatchInfo(Integer id) {
        responseDto = new ResponseDto();
        try {
            matchInfoService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            responseDto.setCode(MessageCode.ERROR);
            return responseDto;
        }
        return responseDto;
    }

    /**
     * 比赛信息查询
     *
     * @param id
     * @return
     */
    @RequestMapping("/match/info/{id}")
    public String searchMatchInfo(@PathVariable Integer id, Model model) {
        MatchInfo matchInfo = null;

        List<Article> articles = new ArrayList<>();
        MatchTechnologyStatistics homeTec = null;
        MatchTechnologyStatistics awayTec = null;
        MatchHighlights matchHighlights = null;
        List<MatchInfo> recentMatchInfo = null;
        Map<Integer, List<MatchProcess>> matchProcesses = null;
        List<Player> homeClubPlayerFirstStart = null;
        List<Player> awayClubPlayerFirstStart = null;
        List<Player> homeClubPlayerSubstitutes = null;
        List<Player> awayClubPlayerSubstitutes = null;
        try {
            matchInfo = matchInfoService.load(id);
            Club homeClub = matchInfo.getHomeClub();
            Club awayClub = matchInfo.getAwayClub();
            List<Article> homeClubList = articleService.findAll(homeClub.getName());
            List<Article> awayClubList = articleService.findAll(awayClub.getName());
            if (homeClubList != null || homeClubList.size() != 0) {
                articles.addAll(homeClubList);
            }
            if (awayClubList != null || awayClubList.size() != 0) {
                articles.addAll(awayClubList);
            }
            homeTec = matchTechnologyService.findTecByMatchInfoIdAndMatchPlc(id, 1);
            awayTec = matchTechnologyService.findTecByMatchInfoIdAndMatchPlc(id, 2);
            matchHighlights = matchHighlightsService.findByMatchInfoId(id);
            recentMatchInfo = matchInfoService.searchRecentMatchInfo();
            matchProcesses = matchProcessService.findAllMapByMatchInfoId(id);
            homeClubPlayerFirstStart = playerService.searchMatchLineUp(id, homeClub.getId(), 1);
            awayClubPlayerFirstStart = playerService.searchMatchLineUp(id, homeClub.getId(), 2);
            homeClubPlayerSubstitutes = playerService.searchMatchLineUp(id, awayClub.getId(), 1);
            awayClubPlayerSubstitutes = playerService.searchMatchLineUp(id, awayClub.getId(), 2);

        } catch (Exception e) {
            e.printStackTrace();
        }
        //比赛基本信息
        model.addAttribute("matchInfo", matchInfo);
        //比赛事件
        model.addAttribute("matchProcesses", matchProcesses);
        //比赛技术统计
        model.addAttribute("homeTec", homeTec);
        model.addAttribute("awayTec", awayTec);
        //比赛相关新闻
        model.addAttribute("articles", articles);
        //近期比赛
        model.addAttribute("recentMatchInfo", recentMatchInfo);
        //阵容
        model.addAttribute("homeClubPlayerFirstStart", homeClubPlayerFirstStart);
        model.addAttribute("awayClubPlayerFirstStart", awayClubPlayerFirstStart);
        model.addAttribute("homeClubPlayerSubstitutes", homeClubPlayerSubstitutes);
        model.addAttribute("awayClubPlayerSubstitutes", awayClubPlayerSubstitutes);

        //集锦
        model.addAttribute("matchHighlights", matchHighlights);
        return "game-detail";
    }

    /**
     * 比赛信息编辑
     *
     * @param id
     * @return
     */
    @RequestMapping("/match/info/edit")
    public ModelAndView edit(Integer id) {
        ModelAndView modelAndView = new ModelAndView("/admin/match-info-update");


        return modelAndView;
    }

    /**
     * 比赛信息更新
     *
     * @param matchInfo
     * @return
     */
    @RequestMapping("/match/info/update")
    public @ResponseBody
    ResponseDto updateMatchInfo(MatchInfo matchInfo) {
        responseDto = new ResponseDto();
        if (matchInfo.getId() == null) {
            responseDto.setCode("-1");
            responseDto.setMsg("比赛id为空");
            return responseDto;
        }
        try {
            matchInfoService.update(matchInfo);
        } catch (Exception e) {
            e.printStackTrace();
            responseDto.setCode(MessageCode.ERROR);
            return responseDto;
        }
        return responseDto;
    }

    /**
     * 查询所有比赛
     *
     * @return
     */
    @RequestMapping(value = {"/match/info/list"})
    public @ResponseBody
    List<MatchInfo> findAll(String condition) {
        List<MatchInfo> matchInfos = null;
        try {
            matchInfos = matchInfoService.findAll(condition);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return matchInfos;
    }

    /**
     * 分页查询所有比赛
     *
     * @param pageRequestDto
     */
//    @RequestMapping(value = {"/admin/match/info/table/list"})
    public @ResponseBody
    PageResponseDto<MatchInfo> findAll(PageRequestDto pageRequestDto) {
        PageHelper.startPage(pageRequestDto.getPage(), pageRequestDto.getLimit());
        List<MatchInfo> matchInfos = null;
        PageResponseDto<MatchInfo> pageResponseDto = null;
        try {
            matchInfos = matchInfoService.findAll(pageRequestDto.getCondition());
            PageInfo<MatchInfo> pageInfo = new PageInfo<>(matchInfos);
            Long count = pageInfo.getTotal();
            pageResponseDto = new PageResponseDto<MatchInfo>(matchInfos, count);
        } catch (Exception e) {
            e.printStackTrace();
            pageResponseDto.setCode(MessageCode.ERROR);
            return pageResponseDto;
        }
        return pageResponseDto;
    }

    /**
     * 新修改的 多条件使用
     *
     * @param requestDto
     * @return
     */
    @RequestMapping(value = {"/admin/match/info/table/list"})
    public @ResponseBody
    PageResponseDto<MatchInfo> findAllByRequestDto(RequestDto requestDto) {
        PageHelper.startPage(requestDto.getPage(), requestDto.getLimit());
        List<MatchInfo> matchInfos = null;
        PageResponseDto<MatchInfo> pageResponseDto = null;
        try {
            matchInfos = matchInfoService.findAll(requestDto);
            PageInfo<MatchInfo> pageInfo = new PageInfo<>(matchInfos);
            Long count = pageInfo.getTotal();
            pageResponseDto = new PageResponseDto<MatchInfo>(matchInfos, count);
        } catch (Exception e) {
            e.printStackTrace();
            pageResponseDto.setCode(MessageCode.ERROR);
            return pageResponseDto;
        }
        return pageResponseDto;
    }


    /**
     * 查询比赛总共有多少轮
     *
     * @param matchTypeId
     * @return
     */
    @RequestMapping("/match/maxMatchNum")
    public @ResponseBody
    MatchType maxMatchNum(Integer matchTypeId) {
        MatchType matchType = null;
        try {
            matchType = matchTypeService.load(matchTypeId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return matchType;
    }

    /**
     * 根据比赛类型 比赛轮次查找对应的比赛
     *
     * @param matchType
     * @param matchTime
     * @return
     */
    @RequestMapping("/match/info/{matchType}/{matchTime}")
    public @ResponseBody
    List<MatchInfo> searchMatchInfoByTypeAndTime(@PathVariable Integer matchType, @PathVariable Integer matchTime) {
        List<MatchInfo> matchInfos = null;
        try {
            matchInfos = matchInfoService.searchMatchInfoByTypeAndTime(matchType, matchTime);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return matchInfos;
    }

    /**
     * 表单提交 验证此轮比赛 对阵双方是否存在
     *
     * @param matchInfo
     * @return
     */
    @RequestMapping("/match/info/search")
    public @ResponseBody
    ResponseDto searchMatchInfo(MatchInfo matchInfo) {
        responseDto = new ResponseDto();
        List<MatchInfo> matchInfos = null;
        try {
            matchInfos = matchInfoService.searchMatchInfo(matchInfo);
        } catch (Exception e) {
            responseDto.setCode("-1");
            e.printStackTrace();
        }
        if (matchInfos != null) {
            responseDto.setCode("-2");
            return responseDto;
        }
        return responseDto;
    }

    /**
     * 查询指定日期没有录入集锦的比赛
     * 根据比赛日期查询已经结束的比赛
     *
     * @return
     */
    @RequestMapping("/match/info/searchByMatchDateForHighlignts")
    public @ResponseBody
    List<MatchInfo> searchMatchInfoByMatchDateForHighlignts(MatchInfo matchInfo) {
        List<MatchInfo> matchInfos = null;
        matchInfos = matchInfoService.searchMatchInfoByMatchDateForHighlignts(matchInfo);

        return matchInfos;
    }

    /**
     * 查询指定日期没有录入比赛阵容的比赛
     *
     * @param matchInfo
     * @return
     */
    @RequestMapping("/match/info/searchByMatchDateForLineUp")
    public @ResponseBody
    List<MatchInfo> searchMatchInfoByMatchDateForLineUp(MatchInfo matchInfo) {
        List<MatchInfo> matchInfos = null;
        matchInfos = matchInfoService.searchMatchInfoByMatchDateForLineUp(matchInfo);
        return matchInfos;
    }

    /**
     * 比赛过程录入 搜索比赛
     *
     * @param matchInfo
     * @return
     */
    @RequestMapping("/match/info/searchByMatchDateForProcess")
    public @ResponseBody
    List<MatchInfo> searchMatchInfoByMatchDateForProcess(MatchInfo matchInfo) {
        List<MatchInfo> matchInfos = null;
        matchInfos = matchInfoService.searchMatchInfoByMatchDateForProcess(matchInfo);
        return matchInfos;
    }

    /**
     * 比赛结果录入 搜索比赛
     *
     * @param matchInfo
     * @return
     */
    @RequestMapping("/match/info/searchByMatchDateForRes")
    public @ResponseBody
    List<MatchInfo> searchMatchInfoByMatchDateForRes(MatchInfo matchInfo) {
        List<MatchInfo> matchInfos = null;
        matchInfos = matchInfoService.searchMatchInfoByMatchDateAndMatchState(matchInfo);
        return matchInfos;
    }

    /**
     * 查询指定日期没有录入技术统计的比赛
     *
     * @param matchInfo
     * @return
     */
    @RequestMapping("/match/info/searchByMatchDateForTec")
    public @ResponseBody
    List<MatchInfo> searchMatchInfoByMatchDateForTec(MatchInfo matchInfo) {
        List<MatchInfo> matchInfos = null;
        matchInfos = matchInfoService.searchMatchInfoByMatchDateForTec(matchInfo);

        return matchInfos;
    }

    /**
     * 查询指定俱乐部录入场次
     *
     * @param matchInfo
     * @return
     */
    @RequestMapping("/match/info/verify/clubIdAndMatchTimes")
    public @ResponseBody
    ResponseDto verifyNickName(MatchInfo matchInfo) {
        ResponseDto responseDto = new ResponseDto();
        if (!matchInfoService.isExistMatchInfoByClubIdAndTimes(matchInfo)) {
            responseDto.setCode("-2");
            return responseDto;
        }
        return responseDto;
    }

    /**
     * 比赛状态修改
     *
     * @param matchInfoId
     * @param matchState
     * @return
     */
    @RequestMapping("/match/updateMatchState")
    public @ResponseBody
    ResponseDto updateMatchState(Integer matchInfoId, Integer matchState) {
        responseDto = new ResponseDto();
        try {
            matchInfoService.updateMatchState(matchInfoId, matchState);
        } catch (Exception e) {
            e.printStackTrace();
            responseDto.setCode(MessageCode.ERROR);
            return responseDto;
        }
        return responseDto;
    }

    @RequestMapping("/match/searchMatchForList")
    public @ResponseBody
    List<MatchInfo> searchMatchForList(String matchDate, Integer matchTypeId) {
        List<MatchInfo> matchInfos = matchInfoService.searchMatchForList(matchDate, matchTypeId);
        return matchInfos;
    }
}
