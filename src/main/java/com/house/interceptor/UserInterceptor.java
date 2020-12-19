package com.house.interceptor;

import com.house.entity.Admin;
import com.house.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

/**
 * 过滤器
 */
public class UserInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
        throws Exception {

        response.setCharacterEncoding("utf-8");
        String requestUrl = request.getRequestURL().toString();

        // 检查 session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loginUser");
        Admin admin = (Admin) session.getAttribute("Admin");
        if (user != null || admin != null) {
            return true;
        }

        List<String> filterUserList = Arrays.asList("/index.html", "/user/login", "/user/register", "/detail.html",
            "/page1","/page2", "/priceAsc", "/priceDesc", "/admin/", "/admin/index.html", "/admin/adminAccess","/news/newsDetail");
        for (String url : filterUserList) {
            if (requestUrl.contains(url)) {
                return true;
            }
        }

        response.sendRedirect("/");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
