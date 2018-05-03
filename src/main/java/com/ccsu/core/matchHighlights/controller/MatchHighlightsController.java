package com.ccsu.core.matchHighlights.controller;

import com.ccsu.core.common.domain.ResponseDto;
import com.ccsu.core.matchHighlights.domain.MatchHighlights;
import com.ccsu.core.matchHighlights.service.MatchHighlightsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/19
 * @Time: 09:24
 * Description:
 */
@Controller
public class MatchHighlightsController {

    private ResponseDto responseDto;
    @Autowired
    private MatchHighlightsService matchHighlightsService;


    @RequestMapping("/admin/match/highlights/add")
    public String adminMatchHighlightsAdd() {

        return "/admin/match-highlights";
    }

    @RequestMapping("/match/highlights/add")
    public @ResponseBody
    ResponseDto matchHighlightsAdd(MatchHighlights matchHighlights) {
        responseDto = new ResponseDto();
        try {
            matchHighlightsService.add(matchHighlights);
        } catch (Exception e) {
            responseDto.setCode("-1");
            e.printStackTrace();
            return responseDto;
        }
        return responseDto;
    }

}
