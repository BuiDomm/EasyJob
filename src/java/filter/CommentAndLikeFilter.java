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



@WebFilter(filterName = "CommentAndLikeFilter", urlPatterns = {"/commentBlog", "/editblog", "/addblog", "/favoriteJobs", "/reportComment", "/rejectblog", "/pendingblog", "/managerblog", "/favoriteJobList", "/CVSeeker", "/createCV", "/acceptblog",})
public class CommentAndLikeFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();

        // kiem tra dang nhap va roleid
        User account = (User) session.getAttribute("account");

        if (account != null && account.getRoleId() == 2) {
            // neu la jobseeker thi cho dung
            chain.doFilter(request, response);
        } else {
            // khong phai jobseeker hoac chua dang nhap, tu choi truy cap
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
