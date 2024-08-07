/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AnswerDAO;
import dao.ApplyDAO;
import dao.CVDAO;
import dao.ChooseAnswerDAO;
import dao.CompanyDAO;
import dao.JobDAO;
import dao.JobseekerDAO;
import dao.MessagessDAO;
import dao.NotificationDAO;
import dao.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.mail.Session;
import model.Answer;
import model.Apply;
import model.CVProfile;
import model.ChooseAnswer;
import model.Company;
import model.Job;
import model.Question;
import model.User;

/**
 *
 * @author ASUS
 */
public class JobDetails extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet JobDetails</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet JobDetails at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        JobDAO jd = new JobDAO();
        JobseekerDAO jdd = new JobseekerDAO();
        //lay thong tin cua job tu id job
        Job job = jd.findById(id);
        // Lay ra thong tin company theo id job
        CompanyDAO cm = new CompanyDAO();
        Company com = cm.findCompanyByIdJob(id);

        //lay thong tin nguoi dang bai tu id job
        // thong tin nha tuyen dung
        User u = jdd.getInfo(id);

        //Chat DAO 
        MessagessDAO dao = new MessagessDAO();

        //CV ProfileDAO
        CVDAO cvd = new CVDAO();

        HttpSession session = request.getSession();
        //account của user
        User user = (User) session.getAttribute("account");

        if (user != null) {

            // Check thử cong viec nay da apply chua
            ApplyDAO ap = new ApplyDAO();
            CVDAO cvdd = new CVDAO();

            try {
                Apply a = ap.findByJobIDAndCvID(id, cvdd.findByIdUser(user.getIdUser()).getCVId());
                CVProfile cvp = cvd.findByIdUser(user.getIdUser());
                //thong tin nha tuyen dung
                request.setAttribute("u", u);
                //thong tin job
                request.setAttribute("cc", job);
                //
                request.setAttribute("dao", dao);
                request.setAttribute("profile", cvp);
                request.setAttribute("cv", cvp);
                request.setAttribute("user", user);
                request.setAttribute("com", com);
                request.setAttribute("apply", a);

                QuestionDAO qd = new QuestionDAO();
                ChooseAnswerDAO chd = new ChooseAnswerDAO();
                List<Question> questions = qd.getQuestionsByJobId(id);
                List<ChooseAnswer> chooseanswer = chd.getChooseAnswerJobIDAndUserID(id, user.getIdUser());

                NotificationDAO notidao = new NotificationDAO();
                request.setAttribute("notidao", notidao);
                request.setAttribute("questions", questions);
                request.setAttribute("checktest", chooseanswer);
                request.getRequestDispatcher("job-details.jsp").forward(request, response);

            } catch (Exception e) {
                CVProfile cvp = cvd.findByIdUser(user.getIdUser());
                request.setAttribute("u", u);
                //thong tin job
                request.setAttribute("cc", job);
                request.setAttribute("dao", dao);
                //
                request.setAttribute("profile", cvp);
                request.setAttribute("com", com);
                NotificationDAO notidao = new NotificationDAO();
                request.setAttribute("notidao", notidao);
                request.getRequestDispatcher("job-details.jsp").forward(request, response);
            }

        } else {
            // vẫn có thể xem được job khi không đăng nhập
            request.setAttribute("cc", job);
            request.setAttribute("u", u);
            request.setAttribute("com", com);
            request.getRequestDispatcher("job-details.jsp").forward(request, response);

        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
