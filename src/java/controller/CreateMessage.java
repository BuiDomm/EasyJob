/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.CVDAO;
import dao.CompanyDAO;
import dao.MessagessDAO;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CVProfile;
import model.Company;
import model.Messagess;
import model.User;

/**
 *
 * @author DELL
 */
public class CreateMessage extends HttpServlet {

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
        try {
            HttpSession session = request.getSession();
            User account = (User) session.getAttribute("account");
            MessagessDAO dao = new MessagessDAO();
            int uId = account.getIdUser();
            int friendId = Integer.parseInt(request.getParameter("friendId"));
            String message = request.getParameter("message");
            if (message.length() > 0) {

                String encryptedMessage = AESUtil.AESUtil.encrypt(message);

                User friend = dao.findById(friendId);
                String nameFriend = friend.getFirstName();
                LocalDateTime currentTime = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
                String formattedTime = currentTime.format(formatter);
                dao.InsertMessage(uId, friendId, formattedTime, encryptedMessage);
                Messagess messageDeatil = dao.getLastMessageThroughTwoFriendId(uId, friendId);

                Gson gson = new Gson();
                JsonObject jsonObject = new JsonObject();
                // thong tin nguoi gui
                JsonObject senderJson = convertAccountToJson(account);
                // thong tin nguoi nhan, quan trong la lay hinh anh thoiii
        
                JsonObject messJson = convertMessToJson(messageDeatil, nameFriend);
                jsonObject.add("mess", messJson);
                jsonObject.add("sender", senderJson);
             

                String json = gson.toJson(jsonObject);

                // Gửi JSON về client
                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                out.print(json);
                out.flush();
            }

        } catch (Exception ex) {
            Logger.getLogger(CreateMessage.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private JsonObject convertMessToJson(Messagess mess, String nameFriend) {
        JsonObject jsonObject = new JsonObject();
        try {

            jsonObject.addProperty("id", mess.getMessageID());
            jsonObject.addProperty("senderid", mess.getSenderID());
            jsonObject.addProperty("receiverid", mess.getReceiverID());
            jsonObject.addProperty("timestamp", mess.getTimestamp());
            jsonObject.addProperty("content", AESUtil.AESUtil.decrypt(mess.getContent()));
            jsonObject.addProperty("nameFriend", nameFriend);
            // Thêm các trường khác của đối tượng Messagess vào đây

        } catch (Exception ex) {
            Logger.getLogger(CreateMessage.class.getName()).log(Level.SEVERE, null, ex);
        }
        return jsonObject;
    }

    private JsonObject convertAccountToJson(User user) {
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("accountID", user.getIdUser());
        jsonObject.addProperty("name", user.getFirstName());
        // check neu nguoi gui la jobseeker thi co hinh anh nay
        if (user.getRoleId() == 2) {
          try{
            CVDAO cvd = new CVDAO();
            CVProfile cp = cvd.findByIdUser(user.getIdUser());
            jsonObject.addProperty("url", "/easyjob/assets/avatars/" + cp.getAvatar());
          
          } catch(Exception e) { 
             jsonObject.addProperty("url", "./assets/images/defaultImg.png");
          
          }
            // check neu nguoi gui la employer thi co hinh anh nay
        } else if (user.getRoleId() == 3) {
            CompanyDAO companyDAO = new CompanyDAO();
            Company com = companyDAO.findByUserId(user.getIdUser());
            jsonObject.addProperty("url", com.getUrl());
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
