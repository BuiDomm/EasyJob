/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.CompanyDAO;
import dao.JobDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Category;
import model.Company;
import model.Job;
import model.User;

/**
 *
 * @author ASUS
 */
public class CreateJob extends HttpServlet {

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
            out.println("<title>Servlet CreateJob</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateJob at " + request.getContextPath() + "</h1>");
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
        
        int idUser = Integer.parseInt(request.getParameter("id"));
        CompanyDAO cd = new CompanyDAO();
        Company com = cd.findByUserId(idUser);
        request.setAttribute("com", com);
        request.getRequestDispatcher("createjob.jsp").forward(request, response);
        
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
        HttpSession session = request.getSession();
        User epl = (User) session.getAttribute("account");
        CompanyDAO comdao = new CompanyDAO();
        Company com = comdao.findByUserId(epl.getIdUser());
        
        String nameCompnay = request.getParameter("name");
        String nameWork = request.getParameter("namework");
        int idCate = Integer.parseInt(request.getParameter("cateID"));
        int yearExpr = Integer.parseInt(request.getParameter("experiences"));
        int salary = Integer.parseInt(request.getParameter("salary"));
        String location = request.getParameter("location");
        String desc = request.getParameter("description");
        CategoryDAO cd = new CategoryDAO();
        Category c = cd.findById(idCate);
        
        Job j = new Job(com, c, nameWork, desc, yearExpr, location, salary, "Pending");
        
        JobDAO jd = new JobDAO();
        jd.insert(j);
        List<Job> list = jd.findByIdUser(epl.getIdUser());
        Job currentJob = jd.getJobCurrentInsert(epl.getIdUser());
        request.setAttribute("successfully", true);
        request.setAttribute("list", list);
        request.setAttribute("job", currentJob);
        request.getRequestDispatcher("listcvcreated.jsp").forward(request, response);
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
