package controller;

import dao.CategoryDAO;
import dao.CompanyDAO;
import dao.JobDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Category;
import model.Company;
import model.Job;
import model.User;

public class updatejobservlet extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
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
        Job job = jd.findById(id);
        
        job.setLocation(location);
        job.setTitle(title);
        job.setCategory(cate);
        job.setYearEx(exp);
        job.setSalary(salary);
        job.setDescrip(description);
        job.setStatus("Pending");
        
        jd.update(job);
        
        response.sendRedirect("jobdetailemployeer?id=" + job.getJobID());
    } 
}
