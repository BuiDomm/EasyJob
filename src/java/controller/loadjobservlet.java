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
 * @author ACER
 */
public class loadjobservlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
      HttpSession session = request.getSession();
     
        User user = (User) session.getAttribute("account");
        CategoryDAO ctd = new CategoryDAO();
        CompanyDAO dao = new CompanyDAO();
        Company com = dao.findCompanyByUserId(user.getIdUser());   
        JobDAO jd = new JobDAO();
        List<Category> list = ctd.getAll();
        Job job = jd.findByCompanyId(com.getCompanyID());
        request.setAttribute("categories", list);
        request.setAttribute("com", com);
        request.setAttribute("job", job);
        request.getRequestDispatcher("EditJob.jsp").forward(request, response);
    } 

}
