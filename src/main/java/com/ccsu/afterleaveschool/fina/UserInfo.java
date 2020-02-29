package com.ccsu.afterleaveschool.fina;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2020/2/14
 * @Time: 12:04
 * Description: final 用法
 */
public class UserInfo {
    private String name;
    private String certId;
    private Integer age;

    public UserInfo() {
    }

    public UserInfo(String name, String certId, Integer age) {
        this.name = name;
        this.certId = certId;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCertId() {
        return certId;
    }

    public void setCertId(String certId) {
        this.certId = certId;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "name='" + name + '\'' +
                ", certId='" + certId + '\'' +
                ", age=" + age +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof UserInfo)) return false;

        UserInfo userInfo = (UserInfo) o;

        if (getName() != null ? !getName().equals(userInfo.getName()) : userInfo.getName() != null) return false;
        if (getCertId() != null ? !getCertId().equals(userInfo.getCertId()) : userInfo.getCertId() != null)
            return false;
        return getAge() != null ? getAge().equals(userInfo.getAge()) : userInfo.getAge() == null;
    }

    @Override
    public int hashCode() {
        int result = getName() != null ? getName().hashCode() : 0;
        result = 31 * result + (getCertId() != null ? getCertId().hashCode() : 0);
        result = 31 * result + (getAge() != null ? getAge().hashCode() : 0);
        return result;
    }

    public static void main(String[] args) {
        UserInfo u1 = new UserInfo();
        UserInfo u2 = u1;
        System.out.println(u1.equals(u2));
    }

}
