/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import dao.CVDAO;
import dao.CompanyDAO;
import dao.MessagessDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.CVProfile;
import model.Company;
import model.User;

/**
 *
 * @author ASUS
 */
public class GetSorttedReceiverList extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GetSorttedReceiverList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetSorttedReceiverList at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        HttpSession session = request.getSession();
        User account = (User) session.getAttribute("account");
        MessagessDAO dao = new MessagessDAO();
        List<User> receiver = dao.getListAccountBySenderID(account.getIdUser());

        JsonObject jsonResponse = new JsonObject();
        JsonArray jsonReceiverArray = new JsonArray();

        for (User user : receiver) {
            jsonReceiverArray.add(convertAccountToJson(user));
        }

        jsonResponse.add("receiver", jsonReceiverArray);
        jsonResponse.add("sender", convertAccountToJson(account));

        response.setContentType("application/json");
        try (PrintWriter out = response.getWriter()) {
            out.print(jsonResponse.toString());
            out.flush();
        }
    }

    private JsonObject convertAccountToJson(User user) {
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("accountID", user.getIdUser());
        jsonObject.addProperty("firstName", user.getFirstName());
        jsonObject.addProperty("lastName", user.getLastName());
        jsonObject.addProperty("roleId", user.getRoleId());

        if (user.getRoleId() == 3) {
            CompanyDAO comDAO = new CompanyDAO();
            Company ca = comDAO.findCompanyByUserId(user.getIdUser());
            jsonObject.addProperty("url", ca.getUrl());
            jsonObject.addProperty("nameCompany", ca.getNameCompany());
        } else {
       try {
            CVDAO cd = new CVDAO();
            CVProfile cp = cd.findByIdUser(user.getIdUser());
            jsonObject.addProperty("url", "/easyjob/assets/avatars/" + cp.getAvatar());
       
       }catch(Exception e){ 
           jsonObject.addProperty("url","./assets/images/defaultImg.png");
           
       }
            jsonObject.addProperty("nameCompany", ""); // Để trống nếu không phải công ty
        }

        return jsonObject;
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
