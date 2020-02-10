package com.ccsu.common.study;

import java.util.Optional;
import java.util.function.Consumer;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2020/2/6
 * @Time: 16:03
 * Description:
 */
public class UserInfo {

    private String name;
    private Integer age;
    private String sex;

    private String certId;
    private String certType;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getCertId() {
        return certId;
    }

    public void setCertId(String certId) {
        this.certId = certId;
    }

    public String getCertType() {
        return certType;
    }

    public void setCertType(String certType) {
        this.certType = certType;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", sex='" + sex + '\'' +
                ", certId='" + certId + '\'' +
                ", certType='" + certType + '\'' +
                '}';
    }

    public static void main(String[] args) {
        UserInfo userInfo = new UserInfo();
        userInfo.setAge(25);
        userInfo.setCertId("14118219950514007X");
        userInfo.setCertType("B0701");
        userInfo.setName("朱晓磊");
        userInfo.setSex("男");
        Optional<UserInfo> userInfoOptional = Optional.of(userInfo);

        // 1
        userInfoOptional.ifPresent(new Consumer<UserInfo>() {
            @Override
            public void accept(UserInfo userInfo) {
                System.out.println(userInfo);
            }
        });


    }

}
