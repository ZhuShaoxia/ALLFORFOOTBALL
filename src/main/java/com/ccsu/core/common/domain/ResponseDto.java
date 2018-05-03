package com.ccsu.core.common.domain;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/4
 * @Time: 13:25
 * Description: 返回消息实体类
 */
public class ResponseDto {
    /**
     * 返回状态码
     * 默认200 成功
     */
    private String code = "200";
    /**
     * 状态消息
     */
    private String msg;
    private String url;
    private Boolean isSuc = true;
    private String SMSCode;

    public String getSMSCode() {
        return SMSCode;
    }

    public void setSMSCode(String SMSCode) {
        this.SMSCode = SMSCode;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Boolean getSuc() {
        return isSuc;
    }

    public void setSuc(Boolean suc) {
        isSuc = suc;
    }
}
