/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.JobseekerDAO;
import dao.NotificationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.regex.Pattern;
import model.User;

/**
 *
 * @author ASUS
 */
public class Changepass extends HttpServlet {

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
            out.println("<title>Servlet Changepass</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Changepass at " + request.getContextPath() + "</h1>");
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
        NotificationDAO notidao = new NotificationDAO();
        request.setAttribute("notidao", notidao);
        request.getRequestDispatcher("changepass.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");
        String currentPass = request.getParameter("currentpass");
        String newPass = request.getParameter("newpass");
        String confirmPass = request.getParameter("confirmnewpass");
        JobseekerDAO jd = new JobseekerDAO();

        Pattern p = Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$");

        if (u.getPassword().equals(currentPass)) {

            if (newPass.equals(confirmPass)) {
                if (p.matcher(newPass).find()) {

                    jd.changePass(u.getIdUser(), newPass);
                    u.setPassword(newPass);
                    session.setAttribute("account", u);
                    NotificationDAO notidao = new NotificationDAO();
                    request.setAttribute("notidao", notidao);
                    request.setAttribute("successfully", true);
                    request.getRequestDispatcher("changepass.jsp").forward(request, response);
                } else {
                    NotificationDAO notidao = new NotificationDAO();
                    request.setAttribute("notidao", notidao);
                    request.setAttribute("notice", "New password have [0-9],[a-z],[A-Z],[!-&]");
                    request.getRequestDispatcher("changepass.jsp").forward(request, response);

                }

            } else {
                NotificationDAO notidao = new NotificationDAO();
                request.setAttribute("notidao", notidao);
                request.setAttribute("notice", "The new password and confirm is not same!!!");
                request.getRequestDispatcher("changepass.jsp").forward(request, response);

            }

        } else {
            NotificationDAO notidao = new NotificationDAO();
            request.setAttribute("notidao", notidao);
            request.setAttribute("notice", "The current password is wrong!!!");
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
        }

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
