package com.xiaofeng.mall.filter;


import com.xiaofeng.mall.common.Constant;
import com.xiaofeng.mall.model.pojo.User;
import com.xiaofeng.mall.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 描述：   管理员校验过滤器
 */
public class AdminFilter implements Filter {
    @Autowired
    UserService userService;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute(Constant.MALL_USER);
        if (currentUser == null) {
            PrintWriter out = new HttpServletResponseWrapper((HttpServletResponse) servletResponse).getWriter();
            out.write("{\n" +
                    "\t\"status\" : 10007,\n"+
                    "\t\"msg\" :  \"NEED_LOGIN\",\n"+
                    "\t\"data\" : null\n"+
                    '}');
            out.flush();
            out.close();
            return;
        }
        //校验是否是管理员
        boolean adminRole = userService.checkAdminRole(currentUser);
        if (adminRole) {
            filterChain.doFilter(servletRequest,servletResponse);
        } else {
            PrintWriter out = new HttpServletResponseWrapper((HttpServletResponse) servletResponse).getWriter();

            out.write("{\n" +
                    "\t\"status\" : 10009,\n"+
                    "\t\"msg\" :  \"NEED_ADMIN\",\n"+
                    "\t\"data\" : null\n"+
                    '}');
            out.flush();
            out.close();
        }

    }

    @Override
    public void destroy() {

    }
}
