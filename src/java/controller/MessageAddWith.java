/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.JobseekerDAO;
import dao.MessagessDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;


public class MessageAddWith extends HttpServlet {
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         try {
             MessagessDAO dao = new MessagessDAO();
             HttpSession session = request.getSession();
             User account = (User) session.getAttribute("account");
             int friendId = Integer.parseInt(request.getParameter("friendId"));
             LocalDateTime currentTime = LocalDateTime.now();
             DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
             String formattedTime = currentTime.format(formatter);
             JobseekerDAO jd = new JobseekerDAO();
             User emp = jd.findById(friendId);
             dao.InsertMessage(account.getIdUser(),friendId,formattedTime,AESUtil.AESUtil.encrypt("Hi "+emp.getFirstName()+" "+emp.getLastName()));
             response.sendRedirect("messageListAccount");
         } catch (Exception ex) {
             Logger.getLogger(MessageAddWith.class.getName()).log(Level.SEVERE, null, ex);
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
