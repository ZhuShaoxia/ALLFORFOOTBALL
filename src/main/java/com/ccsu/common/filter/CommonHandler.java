package com.ccsu.common.filter;

import com.ccsu.core.user.domain.User;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/15
 * @Time: 21:17
 * Description:拦截非登录用户访问后台系统，及前台用户个人中心页面。
 */
public class CommonHandler implements HandlerInterceptor {

    private static final Log LOGGER = LogFactory.getLog(CommonHandler.class);

    private final static String[] LOGIN_IGNORE_URI = {"/admin/login", "/user/login"};

//    private final static String[] INTERCEPTOR_URI = {"/user/center", "/user/center/", "/user/article", "/user/article/", "/user/comment", "/user/comment/", "/user/setting", "/user/setting/", "/user/setting/info", "/user/setting/info/", "/setting/modifyPwd", "/setting/modifyPwd/", "/setting/bind"};
    private final static String[] INTERCEPTOR_URI = {"/user/center", "/user/center/", "/user/article", "/user/article/", "/user/comment", "/user/comment/"};

    /**
     * 在业务处理器处理请求之前被调用
     * 如果返回false
     * 从当前的拦截器往回执行所有拦截器的afterCompletion(),再退出拦截器链
     * 如果返回true
     * 执行下一个拦截器,直到所有的拦截器都执行完毕
     * 再执行被拦截的Controller
     * 然后进入拦截器链,
     * 从最后一个拦截器往回执行所有的postHandle()
     * 接着再从最后一个拦截器往回执行所有的afterCompletion()
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        Boolean flag = false;
        String uri = request.getRequestURI();
        User user = (User) request.getSession().getAttribute("user");
        if (uri.contains("admin")) {
            if (!uri.equals("/admin/login")) {
                if (user == null) {
                    response.sendRedirect("/admin/login");
                }
            }
            return !flag;
        } else {
            if (uri.contains("/setting/")) {
                if (user == null) {
                    flag = true;
                }
            } else {
                for (String u : INTERCEPTOR_URI) {
                    if (uri.equals(u) && user == null) {
                        flag = true;
                        break;
                    }
                }
            }
        }
        if (flag) {
            response.sendRedirect("/");
        }
        return !flag;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
