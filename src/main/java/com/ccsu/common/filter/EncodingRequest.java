package com.ccsu.common.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.UnsupportedEncodingException;

/**
 * @author zhuxiaolei
 */
public class EncodingRequest extends HttpServletRequestWrapper {
    private HttpServletRequest request;

    public EncodingRequest(HttpServletRequest request) {
        super(request);
        this.request = request;
    }

    @Override
    public String getParameter(String name) {
        String value = request.getParameter(name);

        try {
            if (value != null) {
                value = new String(value.getBytes("iso-8859-1"), "utf-8");
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return value;
    }


}
