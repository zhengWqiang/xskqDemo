package com.xskq.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {

    public void destroy() {

    }

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        if (session.getAttribute("user") == null) {
            res.sendRedirect(req.getContextPath() + "/login.jsp");
        } else {
            chain.doFilter(req, res);
        }
    }

    public void init(FilterConfig filterConfig) throws ServletException {

    }
}
