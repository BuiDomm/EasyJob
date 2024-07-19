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

@WebFilter(filterName = "EmployerFilter", urlPatterns = {"/companycontrolservlet", "/createjob", "/listjobcreated", "/listApplyCv",
    "/jobdetailemployeer", "/statuschange", "/loadjobservlet", "/deletejob", "/detailCV", "/rejectApply", "/acceptApply", "/createskilltest",
    "/deleteanswer", "/deletequestion", "/editcompanyservlet","/employerhomeservlet", "/loadcompanyservlet", "/manageskilltest", "/skilltestmark", "/updatejobservlet", "/updateskilltest"})
public class EmployerFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();

        User account = (User) session.getAttribute("account");

        if (account != null && account.getRoleId() == 3) { 
            
            chain.doFilter(request, response);
        } else {
            res.sendRedirect(req.getContextPath() + "/404.jsp");
        }
    }

    @Override
    public void destroy() {
    }

    @Override
    public void init(FilterConfig filterConfig) {
    }
}
