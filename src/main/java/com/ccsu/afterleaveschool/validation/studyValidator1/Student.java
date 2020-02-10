package com.ccsu.afterleaveschool.validation.studyValidator1;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/7/8
 * @Time: 16:46
 * Description:
 * 2018年07月08日16:48:09
 * 学习SpringMVC验证器
 */
public class Student {
    private String name;
    private Integer number;
    private String address;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isValid() {
        return name != null;
    }
}
