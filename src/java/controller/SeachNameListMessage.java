/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import dao.CompanyDAO;
import dao.MessagessDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Company;
import model.User;

/**
 *
 * @author ASUS
 */
public class SeachNameListMessage extends HttpServlet {

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
        String nameSearch = request.getParameter("namesearch");
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");
        MessagessDAO md = new MessagessDAO();
        List<User> list = md.searchByName(u.getIdUser(), nameSearch);

        Gson gson = new Gson();
        //json tổng
        JsonObject jsonObject = new JsonObject();
        // tao json list
        JsonArray listAfterSearch = new JsonArray();
        for (User user : list) {
            // chuyen doi sang json account va add vao json list
            listAfterSearch.add(convertAccountToJson(user));
        }
        JsonObject sender = convertAccountToJson(u);

        // add list user sau khi tin vao json tong
        jsonObject.add("receiver", listAfterSearch);
        jsonObject.add("sender", sender);

        // chuyen doi thong tin nguoi gui tin nhan thanh json
        String json = gson.toJson(jsonObject);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        //ghi du lieu json vao trong body cua HTTP response -> chuyen data tu server ve client
        out.print(json);
        //dẩy đi
        out.flush();
    }

    private JsonObject convertAccountToJson(User user) {
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("accountID", user.getIdUser());
        jsonObject.addProperty("name", user.getFirstName());
        jsonObject.addProperty("fullName", user.getFirstName() + " " + user.getLastName());

        if (user.getRoleId() == 3) {
            CompanyDAO comDAO = new CompanyDAO();
            Company ca = comDAO.findCompanyByUserId(user.getIdUser());
            jsonObject.addProperty("url", ca.getUrl());

        }

        return jsonObject;
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
