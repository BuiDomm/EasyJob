/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.AdminDAO;
import dao.JobApplyDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author DELL
 */
public class AdminRejectBlog extends HttpServlet {
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         String blogId = request.getParameter("blogId");
         String reason = request.getParameter("reason");
        AdminDAO dao = new AdminDAO();
         JobApplyDAO jobdao = new JobApplyDAO();
         dao.rejectBlog(blogId);
          String title = dao.getBlogById(blogId).getTitle();
          int user = dao.getUserByBlogId(blogId).getIdUser();
          String mess = "Admin rejected your Blog : " +title+" Because: " + reason ;
          jobdao.insertNotificationApprovel(user, mess, 1);
        

       

           response.sendRedirect("adminListBlog");

    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
