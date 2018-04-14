package com.ccsu.common.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * @author zhuxiaolei
 */
public class EncodingFilter implements Filter {

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        response.setContentType("text/html;charset=utf-8");
        HttpServletRequest req = (HttpServletRequest) request;

        if ("GET".equals(req.getMethod())) {
            EncodingRequest er = new EncodingRequest(req);
            chain.doFilter(er, response);

        } else {
            req.setCharacterEncoding("utf-8");
            chain.doFilter(request, response);

        }
    }

    public void init(FilterConfig fConfig) throws ServletException {
    }

}
