/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

import dao.CVDAO;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.User;

/**
 *
 * @author ASUS
 */
@WebFilter(filterName = "ChatWithNewUserFilter", urlPatterns = {"/messageWith"})
public class ChatWithNewUserFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        CVDAO cvDAO = new CVDAO();
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        User account = (User) session.getAttribute("account");
        try {

            if (account != null && account.getRoleId() != 1) {
           
                    chain.doFilter(request, response);
               
            } else {
                // khong phai jobseeker hoac chua dang nhap, tu choi truy cap
                res.sendRedirect(req.getContextPath() + "/404.jsp");

            }

        } catch (Exception e) {

        }

    }

    /**
     * Return the filter configuration object for this filter.
     */
    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    @Override
    public void init(FilterConfig filterConfig) {

    }

    /**
     * Init method for this filter
     */
}
