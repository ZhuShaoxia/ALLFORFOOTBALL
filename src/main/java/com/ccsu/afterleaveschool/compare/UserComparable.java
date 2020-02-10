package com.ccsu.afterleaveschool.compare;

import com.ccsu.common.study.UserInfo;

import java.util.Arrays;
import java.util.Comparator;
import java.util.Objects;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2020/2/6
 * @Time: 18:09
 * Description:
 */
public class UserComparable implements Comparator<UserInfo> {

    @Override
    public int compare(UserInfo o1, UserInfo o2) {
        Objects.requireNonNull(o1, "【用户不能为空】");
        Objects.requireNonNull(o2, "{用户不能为空}");
        Integer age = o1.getAge();
        Integer age1 = o2.getAge();
        return age - age1;
    }

    public static void main(String[] args) {
        UserInfo u1 = new UserInfo();
        u1.setAge(30);

        UserInfo u2 = new UserInfo();
        u2.setAge(10);

        // 比较
        Comparator comparator = new UserComparable();
        int compare = comparator.compare(u1, u2);
        if (compare > 0) {
            System.out.println("u1年龄比u2年龄大");
        } else {
            System.out.println("u1年龄小于等于u2年龄");
        }

        UserInfo u3 = new UserInfo();
        u3.setAge(48);

        UserInfo u4 = new UserInfo();
        u4.setAge(23);
        //排序
        UserInfo[] userInfos = {u1, u2, u3, u4};
        Arrays.sort(userInfos, comparator);

        for (UserInfo u : userInfos) {
            System.out.println("用户年龄为: " + u.getAge());
        }

    }

}
