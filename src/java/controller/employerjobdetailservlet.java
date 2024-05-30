/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CompanyDAO;
import dao.JobDAO;
import dao.JobseekerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Company;
import model.Job;
import model.User;

/**
 *
 * @author ACER
 */
public class employerjobdetailservlet extends HttpServlet {
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         HttpSession session = request.getSession();
     
        User user = (User) session.getAttribute("account");
        CompanyDAO dao = new CompanyDAO();
        Company com = dao.findCompanyByUserId(user.getIdUser());   
        JobDAO jd = new JobDAO();
        Job job = jd.findByCompanyId(com.getCompanyID());
        request.setAttribute("com", com);
        request.setAttribute("job", job);
        request.getRequestDispatcher("employerjobdetail.jsp").forward(request, response);
    } 

   

}
