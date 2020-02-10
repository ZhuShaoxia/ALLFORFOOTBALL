package com.ccsu.common.study;

import java.util.Optional;
import java.util.function.Consumer;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2020/2/6
 * @Time: 16:07
 * Description:
 */
public class UserInfoService implements Consumer<UserInfo> {


    public Optional<UserInfo> getUserInfoByCertId(String certId) {
        UserInfo userInfo = new UserInfo();

        return Optional.of(userInfo);
    }

    public static void main(String[] args) {
        UserInfoService userInfoService = new UserInfoService();
        Optional<UserInfo> userInfoOptional = userInfoService.getUserInfoByCertId("");
        //if (userInfoOptional.isPresent()) {
        //    UserInfo userInfo1 = userInfoOptional.get();
        //}
        userInfoOptional.ifPresent(userInfoService);
    }


    @Override
    public void accept(UserInfo userInfo) {
        System.out.println(userInfo == null);
    }
}
