/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.CVDAO;
import dao.CompanyDAO;
import dao.JobApplyDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.User;

public class AcceptCvApply extends HttpServlet {
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
         String applyid = request.getParameter("applyid");
         User user = (User) session.getAttribute("account");
        int useId = user.getIdUser();
        JobApplyDAO dao = new JobApplyDAO();
        CompanyDAO companydao = new CompanyDAO();
        int userApply = dao.getUserByapplyid(Integer.parseInt(applyid)).getIdUser();
        
        String company = companydao.findByUserId(useId).getNameCompany();
        String title = dao.findByApplyId(Integer.valueOf(applyid)).getTitle();
        String mess = company + " approved your Cv for Job : " +title ;
        dao.accpetCv(applyid);
        dao.insertNotificationApprovel(userApply, mess, 1);
        response.sendRedirect("listApplyCv");
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
