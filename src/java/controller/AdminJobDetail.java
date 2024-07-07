/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.AdminDAO;
import dao.CVDAO;
import dao.CompanyDAO;
import dao.JobDAO;
import dao.JobseekerDAO;
import dao.NotificationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.CVProfile;
import model.Company;
import model.Job;
import model.User;

/**
 *
 * @author DELL
 */
public class AdminJobDetail extends HttpServlet {

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
            out.println("<title>Servlet ModerationTalentControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModerationTalentControl at " + request.getContextPath() + "</h1>");
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
        String hidenButton = request.getParameter("hidenButton");
        JobDAO jd = new JobDAO();
        JobseekerDAO jdd = new JobseekerDAO();
        //lay thong tin cua job tu id job
        Job job = jd.findById(id);
        // Lay ra thong tin company theo id job
        CompanyDAO cm = new CompanyDAO();
        Company com = cm.findCompanyByIdJob(id);

        // thong tin nha tuyen dung
        User u = jdd.getInfo(id);

        CVDAO cvd = new CVDAO();

        HttpSession session = request.getSession();
        //account của user
        User user = (User) session.getAttribute("account");

        CVProfile cvp = cvd.findByIdUser(user.getIdUser());
        NotificationDAO notidao = new NotificationDAO();
        request.setAttribute("notidao", notidao);
        request.setAttribute("u", u);
        //thong tin job
        request.setAttribute("cc", job);
        request.setAttribute("hidenButton", hidenButton);
        request.setAttribute("jobid", id);
        request.setAttribute("check", "success");
        request.setAttribute("profile", cvp);
        request.setAttribute("com", com);

        request.getRequestDispatcher("./Admin/jobdetail.jsp").forward(request, response);

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
