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
import model.Category;
import model.Company;
import model.Job;
import model.User;

/**
 *
 * @author ACER
 */
public class updatejobservlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       String location = request.getParameter("location");
        String title = request.getParameter("title");
        String raw_category = request.getParameter("category");
        String raw_exp = request.getParameter("exp");
        String raw_salary = request.getParameter("salary");
        String description = request.getParameter("description");
       
        int category = Integer.parseInt(raw_category);
        int exp = Integer.parseInt(raw_exp);
        int salary = Integer.parseInt(raw_salary);
        HttpSession session = request.getSession();
        User acc = (User) session.getAttribute("account");
        CategoryDAO catedao = new CategoryDAO();
        Category cate = catedao.findById(category);
        CompanyDAO companydao = new CompanyDAO();
        Company company = companydao.findCompanyByUserId(acc.getIdUser());
        JobDAO jd = new JobDAO();
        Job job = jd.findByCompanyId(company.getCompanyID());
        
        job.setLocation(location);
        job.setTitle(title);
        job.setCategory(cate);
        job.setYearEx(exp);
        job.setSalary(salary);
        job.setDescrip(description);
        jd.update(job);
        response.sendRedirect("employerjobdetailservlet");
        
    } 

}
