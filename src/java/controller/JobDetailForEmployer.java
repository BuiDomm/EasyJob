/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ChooseAnswerDAO;
import dao.CompanyDAO;
import dao.JobApplyDAO;
import dao.JobDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Apply;
import model.Company;
import model.Job;
import model.User;

/**
 *
 * @author ASUS
 */
public class JobDetailForEmployer extends HttpServlet {

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
            out.println("<title>Servlet JobDetailForEmployer</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet JobDetailForEmployer at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");
        int id = Integer.parseInt(request.getParameter("id"));
        CompanyDAO cm = new CompanyDAO();
        Company com = cm.findCompanyByIdJob(id);
        JobDAO jd = new JobDAO();
        Job b = jd.findById(id);
         JobApplyDAO dao = new JobApplyDAO();
        List<Apply> listApply = dao.ListApplyByUserIdAndJobID(u.getIdUser(),id);
        for (Apply apply : listApply) {
            System.out.println(apply.getCvProfile().getUserID());
        }
        
        ChooseAnswerDAO chd = new ChooseAnswerDAO();
        request.setAttribute("status", chd);
         request.setAttribute("dao", dao);
        request.setAttribute("listApply", listApply);
        request.setAttribute("com", com);
        request.setAttribute("cc", b);
        request.setAttribute("u", u);
        request.getRequestDispatcher("job-detailsemployer.jsp").forward(request, response);
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
