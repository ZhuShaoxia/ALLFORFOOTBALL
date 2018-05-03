package com.ccsu.core.matchTechnologyStatistics.controller;

import com.ccsu.core.common.domain.ResponseDto;
import com.ccsu.core.matchTechnologyStatistics.domain.RequestMatchTechnologyStatistics;
import com.ccsu.core.matchTechnologyStatistics.service.MatchTechnologyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/19
 * @Time: 08:53
 * Description:
 */
@Controller
public class MatchTechnologyStatisticsController {


    private ResponseDto responseDto;
    @Autowired
    private MatchTechnologyService matchTechnologyService;

    @RequestMapping("/admin/match/technology/add")
    public String adminMatchTechnologyStatisticsAdd() {

        return "/admin/match-technology";
    }

    /**
     * 添加技术统计
     * @param requestMatchTechnologyStatistics
     * @return
     */
    @RequestMapping("/match/technology/add")
    public @ResponseBody
    ResponseDto technologyAdd(RequestMatchTechnologyStatistics requestMatchTechnologyStatistics) {
        responseDto = new ResponseDto();
        try {
            matchTechnologyService.insertMatchTechnology(requestMatchTechnologyStatistics);
        } catch (Exception e) {
            responseDto.setCode("-1");
            e.printStackTrace();
            return responseDto;
        }
        return responseDto;
    }

}
