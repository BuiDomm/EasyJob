/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BlogDAO;
import dao.JobseekerDAO;
import dao.NotificationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Blog;
import model.User;

/**
 *
 * @author This PC
 */
@WebServlet(name = "AddBlogController", urlPatterns = {"/addblog"})
public class AddBlogController extends HttpServlet {

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
        Blog product = new Blog();
        JobseekerDAO js = new JobseekerDAO();
        NotificationDAO ntd = new NotificationDAO();
        List<User> adminlist = js.getAll();
        
        product.setTitle(request.getParameter("title"));
        product.setContent(request.getParameter("content"));
        product.setImage(request.getParameter("image"));

        HttpSession session = request.getSession();
        User a = (User) session.getAttribute("account");

        int cid = a.getIdUser();
        product.setUserId(cid);
        
        User u = js.findById(product.getUserId());
        
        String blog = product.getTitle();
        String mess = u.getFirstName() + u.getLastName() + " send " + blog;
        
        BlogDAO pdb = new BlogDAO();
        pdb.inSertProduct(product);
        for (User user : adminlist) {
            if (user.getRoleId() == 1) {
                ntd.insertNotificationApprovel(user.getIdUser(), mess, 1);
            } 
        }
        
        response.sendRedirect("pendingblog");
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
