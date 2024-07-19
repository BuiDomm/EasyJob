/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.FilterDAO;
import dao.NotificationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.Category;
import model.Company;
import model.Job;

/**
 *
 * @author DELL
 */
public class SearchAndFilter extends HttpServlet {

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
        String txt = request.getParameter("search");
        if ("".equals(txt)) {
            txt = null;
        }
        String company = request.getParameter("company");
        if ("".equals(company)) {
            company = null;
        }
        int category = Integer.parseInt(request.getParameter("category"));
        String location = request.getParameter("location");
        if ("".equals(location)) {
            location = null;
        }
        int salary = (request.getParameter("salary") != null) ? Integer.parseInt(request.getParameter("salary")) : 0;
        int year = (request.getParameter("year") != null) ? Integer.parseInt(request.getParameter("year")) : 0;
        int index = (request.getParameter("index") != null) ? Integer.parseInt(request.getParameter("index")) : 1;

        System.out.println(location);
        FilterDAO dao = new FilterDAO();

        List<Company> listCompany = dao.getAllCompany();
        List<Category> listCategory = dao.getAllCategory();
        List<Job> listLocation = dao.getAllLocation();
        List<Job> listJob = dao.getJobsByCriteria(txt, company, category, year, location, salary, index);
        int count = dao.countJobsByCriteria(txt, company, category, year, location, salary);
        System.out.println(count);
        int endPage = count / 4;
        if (count % 4 != 0) {
            endPage++;
        }

        request.setAttribute("txt", txt);
        request.setAttribute("company", company);
        request.setAttribute("category", category);
        request.setAttribute("location", location);
        request.setAttribute("salary", salary);
        request.setAttribute("year", year);
        request.setAttribute("dao", dao);
        System.out.println(location);
        System.out.println(txt);

        request.setAttribute("endP", endPage);
request.setAttribute("listjob", listJob);
        request.setAttribute("listCompany", listCompany);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listLocation", listLocation);
        NotificationDAO notidao = new NotificationDAO();
        request.setAttribute("notidao", notidao);
        request.getRequestDispatcher("jobsearch.jsp").forward(request, response);
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