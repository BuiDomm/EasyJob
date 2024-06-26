/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.CVDAO;
import dao.CompanyDAO;
import dao.MessagessDAO;
import dao.NotificationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import model.CVProfile;
import model.Company;
import model.User;

/**
 *
 * @author DELL
 */
public class MessageListAccount extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User account = (User) session.getAttribute("account");
        MessagessDAO dao = new MessagessDAO();
        List<User> receiver = dao.getListAccountBySenderID(account.getIdUser());
        User sender = dao.findById(account.getIdUser());
        CompanyDAO cd = new CompanyDAO();
        CVDAO cvd = new CVDAO();
        if (account.getRoleId() == 2) {
            List<Company> companyByUser = new ArrayList<>();
            for (User u : receiver) {
                Company com = cd.findCompanyByUserId(u.getIdUser());
                companyByUser.add(com);
            }
            request.setAttribute("companyByUser", companyByUser);
        } else if (account.getRoleId() == 3) {
            List<String> cvProfiles = new ArrayList<>();
            for (User u : receiver) {
                CVProfile cv = cvd.findByIdUser(u.getIdUser());
                cvProfiles.add("/easyjob/assets/avatars/" + cv.getAvatar());
            }
            request.setAttribute("cvProfiles", cvProfiles);
        }
        NotificationDAO notidao = new NotificationDAO();
        request.setAttribute("notidao", notidao);
        request.setAttribute("receiver", receiver);
        request.setAttribute("sender", sender);
        request.setAttribute("dao", dao);

        request.getRequestDispatcher("chat.jsp").forward(request, response);

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
