package com.ccsu.core.honer.controller;

import com.ccsu.common.utils.MessageCode;
import com.ccsu.core.common.domain.ResponseDto;
import com.ccsu.core.honer.domain.Honer;
import com.ccsu.core.honer.service.HonerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/27
 * @Time: 14:26
 * Description:
 */
@Controller
public class HonerController {

    @Autowired
    private HonerService honerService;
    private ResponseDto responseDto;

    /**
     * 添加荣誉信息
     *
     * @param honer
     * @return
     */
    @RequestMapping("/honer/add")
    public @ResponseBody
    ResponseDto honerAdd(Honer honer) {
        responseDto = new ResponseDto();
        try {
            honerService.add(honer);
        } catch (Exception e) {
            responseDto.setCode(MessageCode.ERROR);
            e.printStackTrace();
        }
        return responseDto;
    }

    /**
     * 荣誉信息删除
     * @param id
     * @return
     */
    @RequestMapping("/honer/delete")
    public @ResponseBody
    ResponseDto honerDelete(Integer id) {
        responseDto = new ResponseDto();
        try {
            honerService.delete(id);
        } catch (Exception e) {
            responseDto.setCode(MessageCode.ERROR);
            e.printStackTrace();
        }
        return responseDto;
    }


    /**
     * 查询某个用户荣誉信息
     *
     * @param playerId
     * @return
     */
    @RequestMapping("/honer/findHonerByPlayerId")
    public @ResponseBody
    List<Honer> findHonerByPlayerId(Integer playerId) {
        responseDto = new ResponseDto();
        List<Honer> list = honerService.findHonerByPlayerId(playerId);
        return list;
    }

    /**
     * 查询某个俱乐部荣誉信息
     *
     * @param clubId
     * @return
     */
    @RequestMapping("/honer/findHonerByClubId")
    public @ResponseBody
    List<Honer> findHonerByClubId(Integer clubId) {
        responseDto = new ResponseDto();
        List<Honer> list = honerService.findHonerByClubId(clubId);
        return list;
    }


}
