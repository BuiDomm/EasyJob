/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.AdminDAO;
import dao.NotificationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import model.Job;
import model.Statistic;

/**
 *
 * @author DELL
 */
public class AdminDashBoard extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        int totalAccount = dao.getTotalUser();
        int totalJobs = dao.getTotalJob();
        int totalCompany = dao.getTotalCompany();

        int accountActive = dao.getAccountByStatus("Active");
        int accountLock = dao.getAccountByStatus("Lock");

        List<Statistic> statistic = dao.getJobByMonth();

        String top = request.getParameter("top");
        if (top == null) {
            top = "year";
        }
        Map<Job, Integer> topJob = dao.getTopJobWithApplyCount(top);

        NotificationDAO notidao = new NotificationDAO();
        request.setAttribute("notidao", notidao);
        request.setAttribute("statistic", statistic);

        request.setAttribute("accountActive", accountActive);
        request.setAttribute("accountLock", accountLock);
        request.setAttribute("topJob", topJob);

        request.setAttribute("top", top);
        request.setAttribute("dao", dao);

        request.setAttribute("totalAccount", totalAccount);
        request.setAttribute("totalJobs", totalJobs);
        request.setAttribute("totalCompany", totalCompany);

        request.getRequestDispatcher("./Admin/adminhome.jsp").forward(request, response);
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
        processRequest(request, response);
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
