package com.ccsu.core.club.controller;

import com.ccsu.common.utils.MessageCode;
import com.ccsu.core.club.domain.Club;
import com.ccsu.core.club.service.ClubService;
import com.ccsu.core.common.domain.PageRequestDto;
import com.ccsu.core.common.domain.PageResponseDto;
import com.ccsu.core.common.domain.ResponseDto;
import com.ccsu.core.country.domain.Country;
import com.ccsu.core.country.service.CountryService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
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
 * @Time: 18:13
 * Description:
 */
@Controller
public class ClubController {

    @Autowired
    private ClubService clubService;

    @Autowired
    private CountryService countryService;


    private static final Log LOGGER = LogFactory.getLog(ClubController.class);

    private ResponseDto responseDto;

    /**
     * 重定向:后台界面-俱乐部列表
     *
     * @return
     */
    @RequestMapping("/admin/club/list")
    public String adminClubList() {

        return "/admin/club-list";
    }

    /**
     * 重定向:后台界面-俱乐部添加-
     *
     * @return
     */
    @RequestMapping("/admin/club/add")
    public String adminClubAdd(Model model) {
        List<Country> countries = null;
        try {
            countries = countryService.findAll(null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("countries", countries);
        return "/admin/club-add";
    }


    /**
     * 俱乐部添加
     *
     * @param club
     * @return
     */
    @RequestMapping("/club/add")
    public @ResponseBody
    ResponseDto addClub(Club club) {
        responseDto = new ResponseDto();
        try {
            clubService.add(club);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responseDto;
    }

    /**
     * 俱乐部删除
     *
     * @param id
     * @return
     */
    @RequestMapping("/club/delete")
    public @ResponseBody
    ResponseDto
    deleteClub(Integer id) {
        responseDto = new ResponseDto();
        try {
            clubService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responseDto;
    }


    /**
     * 查询俱乐部信息
     *
     * @param id
     * @return
     */
    @RequestMapping("/club/info/{id}")
    public @ResponseBody
    Club searchClub(@PathVariable Integer id) {
        Club club = null;
        try {
            club = clubService.load(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return club;
    }

    /**
     * 俱乐部信息编辑
     *
     * @param id
     * @return
     */
    @RequestMapping("/club/edit")
    public ModelAndView edit(Integer id) {
        ModelAndView modelAndView = new ModelAndView("admin/club-update");
        Club club = null;
        List<Country> countries = null;
        try {
            countries = countryService.findAll(null);
            club = clubService.load(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        modelAndView.addObject("countries", countries);
        modelAndView.addObject("club", club);
        return modelAndView;
    }

    /**
     * 俱乐部信息更新
     *
     * @param club
     * @return
     */
    @RequestMapping("/club/update")
    public @ResponseBody
    ResponseDto updateClub(Club club) {
        responseDto = new ResponseDto();
        try {
            clubService.update(club);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responseDto;
    }

    /**
     * 分页查询所有俱乐部
     *
     * @param pageRequestDto
     */
    @RequestMapping(value = {"/admin/club/table/list"})
    public @ResponseBody
    PageResponseDto<Club> findAll(PageRequestDto pageRequestDto) {
        PageHelper.startPage(pageRequestDto.getPage(), pageRequestDto.getLimit());
        List<Club> clubs = null;
        try {
            clubs = clubService.findAll(pageRequestDto.getCondition());
        } catch (Exception e) {
            e.printStackTrace();
        }
        PageInfo<Club> pageInfo = new PageInfo<>(clubs);
        Long count = pageInfo.getTotal();
        PageResponseDto<Club> pageResponseDto = new PageResponseDto<Club>(clubs, count);
        return pageResponseDto;
    }

    /**
     * 验证俱乐部名字是否存在
     *
     * @param name
     * @return
     */
    @RequestMapping("/club/verify/name")
    public @ResponseBody
    ResponseDto verifyAccount(String name) {
        ResponseDto responseDto = new ResponseDto();
        try {
            if (clubService.verifyClubName(name)) {
                responseDto.setCode(MessageCode.ERROR);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responseDto;
    }

    /**
     * 模糊搜索符合条件的俱乐部
     *
     * @param condition
     * @return
     */
    @RequestMapping("/club/search/condition/string")
    public @ResponseBody
    List<Club> searchClubForSelect(String condition) {
        List<Club> clubs = null;
        try {
            clubs = clubService.searchClubForSelect(condition);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return clubs;
    }

    /**
     * 查询当前国家所有俱乐部
     *
     * @param countryId
     * @return
     */
    @RequestMapping("/club/search/condition/countryId")
    public @ResponseBody
    List<Club> searchClubByCountryId(Integer countryId) {
        List<Club> clubs = null;
        try {
            clubs = clubService.searchClubByCountryId(countryId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return clubs;
    }


}
