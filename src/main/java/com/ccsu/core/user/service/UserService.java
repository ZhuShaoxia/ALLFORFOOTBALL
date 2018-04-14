package com.ccsu.core.user.service;

import com.ccsu.common.base.BaseService;
import com.ccsu.core.user.domain.User;


/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/2
 * @Time: 21:30
 * Description:
 */
public interface UserService extends BaseService<User> {
    Boolean verifyAccount(String account);

    Boolean verifyNickname(String nickname);

    Boolean verifyPhone(String phone);

    Boolean verifyEmail(String email);
}
