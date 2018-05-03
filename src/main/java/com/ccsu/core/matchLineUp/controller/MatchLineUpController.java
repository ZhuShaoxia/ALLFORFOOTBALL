package com.ccsu.core.matchLineUp.controller;

import com.ccsu.common.utils.MessageCode;
import com.ccsu.core.club.domain.Club;
import com.ccsu.core.common.domain.ResponseDto;
import com.ccsu.core.matchInfo.domain.MatchInfo;
import com.ccsu.core.matchLineUp.domain.RequestMatchLineUp;
import com.ccsu.core.matchLineUp.service.MatchLineUpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/18
 * @Time: 22:25
 * Description:
 */
@Controller
public class MatchLineUpController {

    @Autowired
    private MatchLineUpService matchLineUpService;

    private ResponseDto responseDto;

    /**
     * 页面 后台管理 比赛阵容录入
     *
     * @return
     */
    @RequestMapping("/admin/match/lineUp/add")
    public String adminMatchLineUp() {

        return "/admin/match-lineUp-add";
    }

    /**
     * 比赛阵容添加
     * @param homeClubPlayerFirstStart
     * @param homeClubPlayerSubstitutes
     * @param awayClubPlayerFirstStart
     * @param awayClubPlayerSubstitutes
     * @param homeClubId
     * @param awayClubId
     * @param matchInfoId
     * @return
     */
    @RequestMapping("/match/lineUp/add")
    public @ResponseBody
    ResponseDto adminMatchLineUpAdd(@RequestParam(value = "homeClubPlayerFirstStart[]") String[] homeClubPlayerFirstStart,
                                    @RequestParam(value = "homeClubPlayerSubstitutes[]", required = false) String[] homeClubPlayerSubstitutes,
                                    @RequestParam(value = "awayClubPlayerFirstStart[]") String[] awayClubPlayerFirstStart,
                                    @RequestParam(value = "awayClubPlayerSubstitutes[]", required = false) String[] awayClubPlayerSubstitutes,
                                    @RequestParam(value = "homeClubId") Integer homeClubId,
                                    @RequestParam(value = "awayClubId") Integer awayClubId,
                                    @RequestParam(value = "matchInfoId") Integer matchInfoId
                                    ) {
        responseDto = new ResponseDto();
        RequestMatchLineUp requestMatchLineUp = new RequestMatchLineUp();
        Club homeClub = new Club();
        homeClub.setId(homeClubId);
        Club awayClub = new Club();
        awayClub.setId(awayClubId);
        MatchInfo matchInfo = new MatchInfo();
        matchInfo.setId(matchInfoId);
        requestMatchLineUp.setMatchInfo(matchInfo);
        requestMatchLineUp.setHomeClub(homeClub);
        requestMatchLineUp.setAwayClub(awayClub);
        requestMatchLineUp.setHomeClubPlayerFirstStart(homeClubPlayerFirstStart);
        requestMatchLineUp.setHomeClubPlayerSubstitutes(homeClubPlayerSubstitutes);
        requestMatchLineUp.setAwayClubPlayerFirstStart(awayClubPlayerFirstStart);
        requestMatchLineUp.setAwayClubPlayerSubstitutes(awayClubPlayerSubstitutes);
        try {
            matchLineUpService.addMatchLineUp(requestMatchLineUp);
        } catch (Exception e) {
            responseDto.setCode(MessageCode.ERROR);
            e.printStackTrace();
            return responseDto;
        }
        return responseDto;
    }

}
