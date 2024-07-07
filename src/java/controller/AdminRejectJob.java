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
public class AdminRejectJob extends HttpServlet {
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         String jobid = request.getParameter("jobId");
         String reason = request.getParameter("reason");
         String returnPage = request.getParameter("returnP");
        AdminDAO dao = new AdminDAO();
        JobApplyDAO jobdao = new JobApplyDAO();
         dao.rejectJob(jobid);
         String title = dao.getByjobId(jobid).getTitle();
          int user = dao.getUserByJobId(jobid).getIdUser();
          String mess = "Admin rejected your Job : " +title+" Because: " + reason ;
          jobdao.insertNotificationApprovel(user, mess, 1);
        
         if("listActive".equals(returnPage)){
           response.sendRedirect("listJobAccept");
        }else{
          response.sendRedirect("requestList");
         }
         
       
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
