package com.ccsu.core.user.dao;

import com.ccsu.common.base.BaseDao;
import com.ccsu.core.user.domain.User;
import org.springframework.stereotype.Repository;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/2
 * @Time: 21:33
 * Description:用户dao层
 */

@Repository
public interface UserMapper extends BaseDao<User> {
    Integer verifyAccount(String account);

    Integer verifyNickname(String nickname);

    Integer verifyPhone(String phone);

    Integer verifyEmail(String email);

    Integer verifyPassword(Integer id, String password);

    User userLogin(User user) throws Exception;
    void updateUserPwd(User user) throws Exception;


    void updateUserPhone(User user);
    void userUpdate(User user) throws Exception;

    void updateUserEmail(User user);
}
