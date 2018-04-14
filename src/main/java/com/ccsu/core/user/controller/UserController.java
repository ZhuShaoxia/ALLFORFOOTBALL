package com.ccsu.core.user.controller;

import com.ccsu.common.utils.MessageCode;
import com.ccsu.core.club.domain.Club;
import com.ccsu.core.club.service.ClubService;
import com.ccsu.core.common.domain.PageRequestDto;
import com.ccsu.core.common.domain.PageResponseDto;
import com.ccsu.core.common.domain.ResponseDto;
import com.ccsu.core.country.domain.Country;
import com.ccsu.core.country.service.CountryService;
import com.ccsu.core.user.domain.User;
import com.ccsu.core.user.service.UserService;
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
 * @Date: 2018/4/2
 * @Time: 21:38
 * Description:用户控制层
 */
@Controller
@RequestMapping()
public class UserController {

    private static final Log LOGGER = LogFactory.getLog(UserController.class);

    @Autowired
    private UserService userService;
    @Autowired
    private CountryService countryService;
    @Autowired
    private ClubService clubService;

    private ResponseDto responseDto;

    @RequestMapping("/admin/user/add")
    private String adminUserAdd(Model model) {
        List<Country> countries = null;
        try {
            countries = countryService.findAll(null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("countries", countries);
        return "admin/user-add";
    }

    @RequestMapping("/admin/user/list")
    private String adminUserList(Model model) {

        return "admin/user-list";
    }

    /**
     * 用户表单数据提交
     *
     * @param user
     * @return
     */
    @RequestMapping("/user/add")
    public @ResponseBody
    ResponseDto addUser(User user) throws Exception {
        responseDto = new ResponseDto();
        try {
            userService.add(user);
        } catch (Exception e) {
            e.printStackTrace();
            responseDto.setCode(MessageCode.ERROR);
            return responseDto;
        }
        return responseDto;
    }

    /**
     * 用户信息删除
     *
     * @param id
     * @return
     */
    @RequestMapping("/user/delete")
    public ResponseDto deleteUser(Integer id) {
        responseDto = new ResponseDto();
        try {
            userService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            responseDto.setCode(MessageCode.ERROR);
            return responseDto;
        }
        return responseDto;
    }

    /**
     * 用户信息查询
     *
     * @param id
     * @return
     */
    @RequestMapping("/user/info/{id}")
    public @ResponseBody
    User searchUser(@PathVariable Integer id) {
        User user = null;
        try {
            user = userService.load(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    /**
     * 用户信息编辑
     *
     * @param id
     * @return
     */
    @RequestMapping("/user/edit")
    public ModelAndView edit(Integer id) {
        ModelAndView modelAndView = new ModelAndView("/admin/user-update");
        User user = null;
        List<Club> clubs = null;
        List<Country> countries = null;
        try {
            user = userService.load(id);
            countries = countryService.findAll(null);
            Club club = user.getClub();
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
        modelAndView.addObject("user", user);
        modelAndView.addObject("clubs", clubs);
        modelAndView.addObject("countries", countries);
        return modelAndView;
    }

    /**
     * 用户信息更新
     *
     * @param user
     * @return
     */
    @RequestMapping("/user/update")
    public @ResponseBody
    ResponseDto updateUser(User user) {
        responseDto = new ResponseDto();
        if (user.getId() == null) {
            responseDto.setCode("-1");
            responseDto.setMsg("用户id为空");
            return responseDto;
        }
        try {
            userService.update(user);
        } catch (Exception e) {
            e.printStackTrace();
            responseDto.setCode(MessageCode.ERROR);
            return responseDto;
        }
        return responseDto;
    }

    /**
     * 查询所有用户
     *
     * @return
     */
    @RequestMapping(value = {"/user/list"})
    public @ResponseBody
    List<User> findAll(String condition) {
        List<User> users = null;
        try {
            users = userService.findAll(condition);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    /**
     * 分页查询所有用户
     *
     * @param pageRequestDto
     */
    @RequestMapping(value = {"/admin/user/table/list"})
    public @ResponseBody
    PageResponseDto<User> findAll(PageRequestDto pageRequestDto) {
        PageHelper.startPage(pageRequestDto.getPage(), pageRequestDto.getLimit());
        List<User> users = null;
        PageResponseDto<User> pageResponseDto = null;
        try {
            users = userService.findAll(pageRequestDto.getCondition());
            PageInfo<User> pageInfo = new PageInfo<>(users);
            Long count = pageInfo.getTotal();
            pageResponseDto = new PageResponseDto<User>(users, count);
        } catch (Exception e) {
            e.printStackTrace();
            pageResponseDto.setCode(MessageCode.ERROR);
            return pageResponseDto;
        }
        return pageResponseDto;
    }

    /**
     * 验证用户账号是否存在
     *
     * @param account
     * @return
     */
    @RequestMapping("/user/verify/account")
    public @ResponseBody
    ResponseDto verifyAccount(String account) {
        ResponseDto responseDto = new ResponseDto();
        if (userService.verifyAccount(account)) {
            responseDto.setCode(MessageCode.ERROR);
        }
        return responseDto;
    }

    /**
     * 验证手机号是否存在
     *
     * @param phone
     * @return
     */
    @RequestMapping("/user/verify/phone")
    public @ResponseBody
    ResponseDto verifyPhone(String phone) {
        ResponseDto responseDto = new ResponseDto();
        if (userService.verifyPhone(phone)) {
            responseDto.setCode(MessageCode.ERROR);
        }
        return responseDto;
    }

    /**
     * 验证邮箱是否存在
     *
     * @param email
     * @return
     */
    @RequestMapping("/user/verify/email")
    public @ResponseBody
    ResponseDto verifyEmail(String email) {
        ResponseDto responseDto = new ResponseDto();
        if (userService.verifyEmail(email)) {
            responseDto.setCode(MessageCode.ERROR);
        }
        return responseDto;
    }

    /**
     * 验证昵称是否存在
     *
     * @param nickname
     * @return
     */
    @RequestMapping("/user/verify/nickname")
    public @ResponseBody
    ResponseDto verifyNickName(String nickname) {
        ResponseDto responseDto = new ResponseDto();
        if (userService.verifyNickname(nickname)) {
            responseDto.setCode(MessageCode.ERROR);
        }
        return responseDto;
    }


}
