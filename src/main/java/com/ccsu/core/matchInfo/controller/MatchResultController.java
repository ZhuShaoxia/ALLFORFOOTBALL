package com.ccsu.core.matchInfo.controller;

import com.ccsu.common.utils.MessageCode;
import com.ccsu.core.common.domain.ResponseDto;
import com.ccsu.core.matchInfo.domain.RequestMatchInfo;
import com.ccsu.core.matchInfo.service.MatchInfoService;
import com.ccsu.core.matchType.domain.MatchType;
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
 * @Time: 18:13
 * Description:
 */
@Controller
public class MatchResultController {


    @Autowired
    private MatchInfoService matchInfoService;
    @Autowired
    private MatchTypeService matchTypeService;

    private ResponseDto responseDto;

    /**
     * 页面跳转
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/match/result/add")
    public String adminMatchResultAdd(Model model) {
        List<MatchType> matchTypes = null;
        try {
            matchTypes = matchTypeService.findAll(null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("matchTypes", matchTypes);

        return "/admin/match-result";
    }

    /**
     * 比赛结果录入
     *
     * @param requestMatchInfo
     * @return
     */
    @RequestMapping("/match/result/add")
    public @ResponseBody
    ResponseDto
    matchResultAdd(RequestMatchInfo requestMatchInfo) {
        responseDto = new ResponseDto();

        try {
            matchInfoService.updateMatchResult(requestMatchInfo);
        } catch (Exception e) {
            responseDto.setCode(MessageCode.ERROR);
            e.printStackTrace();
            return responseDto;
        }
        return responseDto;
    }
}
