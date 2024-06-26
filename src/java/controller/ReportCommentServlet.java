package controller;

import dao.CommentDAO;
import dao.JobseekerDAO;
import dao.NotificationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import java.io.IOException;
import java.util.List;
import model.Comment;

@WebServlet(name = "ReportCommentServlet", urlPatterns = {"/reportComment"})
public class ReportCommentServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {

            int commentId = Integer.parseInt(request.getParameter("commentId"));
            User user = (User) request.getSession().getAttribute("account");

            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            CommentDAO commentDAO = new CommentDAO();
            boolean reported = commentDAO.updateStatus(commentId, "Report");
            
            JobseekerDAO js = new JobseekerDAO();
            NotificationDAO ntd = new NotificationDAO();
            List<User> adminlist = js.getAll();
            int iduserCmt = commentDAO.findUserIdByCmt(commentId);
            User u = js.findById(iduserCmt);
            Comment cmt = commentDAO.findCmtById(commentId);
            if (reported) {
                String mess = user.getFirstName() + " " + user.getLastName() + " reported " + u.getFirstName() + " " + u.getLastName() + " with the content: " + cmt.getContent();
                for (User users : adminlist) {
                    if (users.getRoleId() == 1) {
                        ntd.insertNotificationApprovel(users.getIdUser(), mess, 1);
                    }
                }
                response.sendRedirect(request.getContextPath() + "/blogDetails?bid=" + request.getParameter("blogId"));
            } else {
                request.setAttribute("reportError", "Failed to report comment.");
                response.sendRedirect(request.getContextPath() + "/blog-details.jsp");
            }
        } catch (NumberFormatException | IOException ex) {
            ex.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
