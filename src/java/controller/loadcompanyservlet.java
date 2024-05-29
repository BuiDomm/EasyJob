/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CompanyDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Company;
import model.User;

/**
 *
 * @author ACER
 */
public class loadcompanyservlet extends HttpServlet {
   
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
      HttpSession session = request.getSession();
        User acc = (User) session.getAttribute("account");
        CompanyDAO dao = new CompanyDAO();

        try {

            Company company = dao.findCompanyByUserId(acc.getIdUser());
            request.setAttribute("com", company);
            
            request.getRequestDispatcher("EditCompany.jsp").forward(request, response);

        } catch (Exception e) {
        
    } 
    } 


}
