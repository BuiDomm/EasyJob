/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

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
@WebFilter(filterName = "ChangePass", urlPatterns = {"/changepass"})
public class ChangePass implements Filter {
    

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
      public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
                    HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();
       User account = (User) session.getAttribute("account");
      
        if (account != null) {
            // neu la jobseeker thi cho dung
            chain.doFilter(request, response);
        } else {
            // khong phai jobseeker hoac chua dang nhap, tu choi truy cap
            res.sendRedirect(req.getContextPath() + "/404.jsp");

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
