/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import constanct.GoogleLoginHandle;
import dao.JobseekerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.GoogleAccount;
import model.User;

/**
 *
 * @author ASUS
 */
public class GoogleLoginServlet extends HttpServlet {

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
        String code = request.getParameter("code");

        GoogleLoginHandle gg = new GoogleLoginHandle();
        String token = gg.getToken(code);
        GoogleAccount gc = gg.getUserInfo(token);
        JobseekerDAO jd = new JobseekerDAO();
        User newU = new User(gc.getGiven_name(), gc.getFamily_name(), gc.getEmail(), "", 2, "", "");
        System.out.println(newU);
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
        
        String code = request.getParameter("code");

        GoogleLoginHandle gg = new GoogleLoginHandle();
        String token = gg.getToken(code);
        GoogleAccount gc = gg.getUserInfo(token);
        JobseekerDAO jd = new JobseekerDAO();
        User newU = new User(gc.getGiven_name(), gc.getFamily_name(), gc.getEmail(), "", 2, "", "");
        //dang ky
        if (jd.insert(newU)) {
            User userr = jd.fogortPass(newU.getEmail());
            HttpSession session = request.getSession();
            session.setAttribute("account", userr);
            response.sendRedirect("home.jsp");
        } //dang nhap
        else if ((jd.fogortPass(newU.getEmail()) != null)) {
            HttpSession session = request.getSession();
            User user = jd.fogortPass(gc.getEmail());
            session.setAttribute("account", user);
            response.sendRedirect("home.jsp");
        }

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
