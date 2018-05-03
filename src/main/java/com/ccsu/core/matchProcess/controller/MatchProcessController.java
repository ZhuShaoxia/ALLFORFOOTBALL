package com.ccsu.core.matchProcess.controller;

import com.ccsu.common.utils.MessageCode;
import com.ccsu.core.common.domain.ResponseDto;
import com.ccsu.core.matchEvent.domain.MatchEvent;
import com.ccsu.core.matchEvent.service.MatchEventService;
import com.ccsu.core.matchProcess.domain.MatchProcess;
import com.ccsu.core.matchProcess.domain.RequestMatchProcessDto;
import com.ccsu.core.matchProcess.service.MatchProcessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/19
 * @Time: 08:51
 * Description:
 */
@Controller
public class MatchProcessController {

    @Autowired
    private MatchProcessService matchProcessService;
    @Autowired
    private MatchEventService matchEventService;

    private ResponseDto responseDto;

    /**
     * 页面:比赛过程
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/match/process/add")
    public String adminMatchProcessAdd(Model model) {
        List<MatchEvent> matchEvents = null;
        try {
            matchEvents = matchEventService.findAll(null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("matchEvents", matchEvents);
        return "/admin/match-process";
    }

    /**
     * 比赛过程录入
     *
     * @param requestMatchProcessDto
     * @return
     */
    @RequestMapping("/match/process/add")
    public @ResponseBody
    ResponseDto matchProcessAdd(RequestMatchProcessDto requestMatchProcessDto) {
        responseDto = new ResponseDto();
        try {
            matchProcessService.insertMatchProcess(requestMatchProcessDto);
        } catch (Exception e) {
            e.printStackTrace();
            responseDto.setCode(MessageCode.ERROR);
            return responseDto;
        }
        return responseDto;
    }

    @RequestMapping("/aaa")
    public @ResponseBody
    Map<Integer, List<MatchProcess>>
    aaa(Integer matchInfoId) {
        return matchProcessService.findAllMapByMatchInfoId(matchInfoId);
    }
}

