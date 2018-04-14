package com.ccsu.core.player.controller;

import com.ccsu.common.utils.MessageCode;
import com.ccsu.core.club.domain.Club;
import com.ccsu.core.club.service.ClubService;
import com.ccsu.core.common.domain.PageRequestDto;
import com.ccsu.core.common.domain.PageResponseDto;
import com.ccsu.core.common.domain.ResponseDto;
import com.ccsu.core.country.domain.Country;
import com.ccsu.core.country.service.CountryService;
import com.ccsu.core.player.domain.Player;
import com.ccsu.core.player.service.PlayerService;
import com.ccsu.core.playerPosition.domain.PlayerPosition;
import com.ccsu.core.playerPosition.service.PlayerPositionService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/10
 * @Time: 17:34
 * Description:球员controller
 */
@Controller
public class PlayerController {

    @Autowired
    private PlayerPositionService playerPositionService;
    @Autowired
    private PlayerService playerService;
    @Autowired
    private ClubService clubService;
    @Autowired
    private CountryService countryService;

    private ResponseDto responseDto;

    /**
     * 请求转发:球员列表
     *
     * @return
     */
    @RequestMapping("/admin/player/list")
    public String adminPlayerList() {

        return "/admin/player-list";
    }

    /**
     * 请求转发:运动员添加
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/player/add")
    public String adminPlayerAdd(Model model) {
        List<PlayerPosition> playerPositions = null;
        List<Country> countries = null;
        try {
            playerPositions = playerPositionService.findAll(null);
            countries = countryService.findAll(null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("playerPositions", playerPositions);
        model.addAttribute("countries", countries);
        return "/admin/player-add";
    }

    /**
     * 球员添加
     *
     * @param player
     * @return
     */
    @RequestMapping("/player/add")
    public @ResponseBody
    ResponseDto addClub(Player player) {
        responseDto = new ResponseDto();
        try {
            playerService.add(player);
        } catch (Exception e) {
            e.printStackTrace();
            responseDto.setCode(MessageCode.ERROR);
            return responseDto;
        }
        return responseDto;
    }

    /**
     * 球员删除
     *
     * @param id
     * @return
     */
    @RequestMapping("/player/delete")
    public @ResponseBody
    ResponseDto
    deletePlayer(Integer id) {
        responseDto = new ResponseDto();
        try {
            playerService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            responseDto.setCode(MessageCode.ERROR);
            return responseDto;
        }
        return responseDto;
    }


    /**
     * 查询球员信息
     *
     * @param id
     * @return
     */
    @RequestMapping("/player/info/{id}")
    public @ResponseBody
    Player searchPlayer(@PathVariable Integer id) {
        Player player = null;
        try {
            player = playerService.load(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return player;
    }

    /**
     * 球员信息编辑
     *
     * @param id
     * @return
     */
    @RequestMapping("/player/edit")
    public ModelAndView edit(Integer id) {
        ModelAndView modelAndView = new ModelAndView("admin/player-update");
        Player player = null;
        List<PlayerPosition> playerPositions = null;
        List<Country> countries = null;
        List<Club> clubs = null;
        try {
            player = playerService.load(id);
            playerPositions = playerPositionService.findAll(null);
            countries = countryService.findAll(null);
            Club club = player.getClub();
            Integer clubId = null;
            if (club != null) {
                clubId = club.getId();
                if (clubId != null) {
                    clubs = clubService.searchClubAndCountryByClubId(clubId);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        modelAndView.addObject("player", player);
        modelAndView.addObject("playerPositions", playerPositions);
        modelAndView.addObject("countries", countries);
        modelAndView.addObject("clubs", clubs);
        return modelAndView;
    }

    /**
     * 球员信息更新
     *
     * @param player
     * @return
     */
    @RequestMapping("/player/update")
    public @ResponseBody
    ResponseDto updatePlayer(Player player) {
        responseDto = new ResponseDto();
        try {
            playerService.update(player);
        } catch (Exception e) {
            e.printStackTrace();
            responseDto.setCode(MessageCode.ERROR);
            return responseDto;
        }
        return responseDto;
    }

    /**
     * 分页查询所有球员
     *
     * @param pageRequestDto
     */
    @RequestMapping(value = {"/admin/player/table/list"})
    public @ResponseBody
    PageResponseDto<Player> findAll(PageRequestDto pageRequestDto) {
        PageHelper.startPage(pageRequestDto.getPage(), pageRequestDto.getLimit());
        List<Player> players = null;
        PageResponseDto<Player> pageResponseDto = null;
        try {
            players = playerService.findAll(pageRequestDto.getCondition());
            PageInfo<Player> pageInfo = new PageInfo<>(players);
            Long count = pageInfo.getTotal();
            pageResponseDto = new PageResponseDto<Player>(players, count);
        } catch (Exception e) {
            e.printStackTrace();
            pageResponseDto.setCode(MessageCode.ERROR);
            return pageResponseDto;
        }

        return pageResponseDto;
    }


}
