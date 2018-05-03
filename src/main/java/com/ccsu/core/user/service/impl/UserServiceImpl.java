package com.ccsu.core.user.service.impl;

import com.ccsu.common.utils.CommonUtils;
import com.ccsu.core.user.dao.UserMapper;
import com.ccsu.core.user.domain.User;
import com.ccsu.core.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/2
 * @Time: 21:32
 * Description:
 */
@Service
public class UserServiceImpl implements UserService {


    @Autowired
    private UserMapper userMapper;

    @Override
    public void add(User user) throws Exception {
        user.setPassword(CommonUtils.MD5Encode(user.getPassword()));
        String currentDateTime = CommonUtils.getCurrentDateTime();
        user.setCreateTime(currentDateTime);
        user.setModifiedTime(currentDateTime);
        String otherClubName = user.getOtherClubName();
//        if ("".equals(otherClubName) || otherClubName != null) {
//            otherClubName = null;
//        } else {
//            user.setClub(null);
//        }
        userMapper.save(user);
    }

    @Override
    public void delete(Integer id) throws Exception {
        userMapper.delete(id);
    }

    @Override
    public void update(User user) throws Exception {
        if (user.getId() == null) {
            throw new NullPointerException("输入参数:用户ID不能为空");
        }
        if (user.getAccount() == null) {
            throw new NullPointerException("输入参数:用户account不能为空");
        }
        if (user.getNickname() == null) {
            throw new NullPointerException("输入参数:用户nickname不能为空");
        }
        if (user.getPhone() == null) {
            throw new NullPointerException("输入参数:用户phone不能为空");
        }

        String modifiedTime = CommonUtils.getCurrentDateTime();
        user.setModifiedTime(modifiedTime);
        String otherClubName = user.getOtherClubName();
        if (otherClubName != null || !"".equals(otherClubName)) {
            user.setClub(null);
        } else {
            user.setOtherClubName(null);
        }
        userMapper.update(user);
    }

    @Override
    public User load(Integer id) throws Exception {
        if (id == null) {
            throw new NullPointerException("输入参数:用户ID不能为空");
        }
        return userMapper.findById(id);
    }

    @Override
    public List<User> findAll(String condition) throws Exception {
        return userMapper.findAll(condition);
    }

    /**
     * 验证账号是否存在
     *
     * @param account
     * @return
     */
    @Override
    public Boolean verifyAccount(String account) {
        Integer count = userMapper.verifyAccount(account);
        if (count >= 1) {
            return true;
        }
        return false;
    }

    /**
     * 验证昵称是否存在
     *
     * @param nickname
     * @return
     */
    @Override
    public Boolean verifyNickname(String nickname) {
        Integer count = userMapper.verifyNickname(nickname);
        if (count >= 1) {
            return true;
        }
        return false;
    }

    /**
     * 验证手机号是否存在
     *
     * @param phone
     * @return
     */
    @Override
    public Boolean verifyPhone(String phone) {
        Integer count = userMapper.verifyPhone(phone);
        if (count >= 1) {
            return true;
        }
        return false;
    }

    /**
     * 验证邮箱是否存在
     *
     * @param email
     * @return
     */
    @Override
    public Boolean verifyEmail(String email) {
        Integer count = userMapper.verifyEmail(email);
        if (count >= 1) {
            return true;
        }
        return false;
    }

    @Override
    public Boolean verifyPassword(Integer id, String password) {
        password = CommonUtils.MD5Encode(password);
        Integer count = userMapper.verifyPassword(id, password);
        if (count >= 1) {
            return true;
        }
        return false;
    }

    @Override
    public User userLogin(User user) throws Exception {
        String password = user.getPassword();
        password = CommonUtils.MD5Encode(password);
        user.setPassword(password);
        user = userMapper.userLogin(user);
        if (user == null) {
            return null;
        }
        return user;
    }

    @Override
    public void updateUserPwd(User user) throws Exception {
        String password = user.getPassword();
        password = CommonUtils.MD5Encode(password);
        user.setPassword(password);
        String currentTime = CommonUtils.getCurrentDateTime();
        user.setModifiedTime(currentTime);
        if (user.getId() != null || user.getAccount() != null) {
            userMapper.updateUserPwd(user);
        } else {
            throw new Exception("用户编号或者用户账号不能为空");
        }
    }

    @Override
    public void updateUserPhone(User user) {
        String currentTime = CommonUtils.getCurrentDateTime();
        user.setModifiedTime(currentTime);
        userMapper.updateUserPhone(user);
    }


}
