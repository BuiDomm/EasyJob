/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.AdminDAO;
import dao.NotificationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Packages;

/**
 *
 * @author DELL
 */
public class AdminAddPackage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AdminDAO dao = new AdminDAO();

        List<Packages> listP = dao.getAllPackage();
        //b2:set data to jsp
        NotificationDAO notidao = new NotificationDAO();
        request.setAttribute("notidao", notidao);
        request.setAttribute("listP", listP);
        request.setAttribute("dao", dao);
        request.getRequestDispatcher("./Admin/addpackage.jsp").forward(request, response);
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
        processRequest(request, response);
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
        String nametxt = request.getParameter("nametxt");
        String descriptiontxt = request.getParameter("descriptiontxt");
        int price = Integer.parseInt(request.getParameter("pricetxt"));
        AdminDAO dao = new AdminDAO();
        dao.InsertPackage(nametxt, descriptiontxt, price);

        response.sendRedirect("addPackage");

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
