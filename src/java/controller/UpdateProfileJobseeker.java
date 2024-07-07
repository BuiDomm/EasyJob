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
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;

/**
 *
 * @author ASUS
 */
public class UpdateProfileJobseeker extends HttpServlet {

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
            out.println("<title>Servlet UpdateProfileJobseeker</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProfileJobseeker at " + request.getContextPath() + "</h1>");
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
        User u = (User) session.getAttribute("account");
        request.setAttribute("acc", u);
        NotificationDAO notidao = new NotificationDAO();
        request.setAttribute("notidao", notidao);
        request.getRequestDispatcher("profilejb.jsp").forward(request, response);
    }

    public static boolean is18OrOlder(Date birthDate) {
        LocalDate birthLocalDate = birthDate.toLocalDate();

        LocalDate currentDate = LocalDate.now();

        Period age = Period.between(birthLocalDate, currentDate);

        return age.getYears() >= 18;
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
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String password = request.getParameter("pass");
        String cityName = request.getParameter("cityname");
        String phoneNumber = request.getParameter("phone");
        String dobDate = request.getParameter("date");
        Date dob = Date.valueOf(dobDate);
        Pattern padd = Pattern.compile("^[a-zA-Z\\s]+$");
        Pattern numB = Pattern.compile("^\\d+$");
        if (!numB.matcher(phoneNumber).find()) {
            // ktra dien thaoi
            request.setAttribute("notice", "Phone numbers cannot contain characters other than numbers.");
            request.getRequestDispatcher("profilejb.jsp").forward(request, response);
        } else { 
            // thong qua kiem tra sdt
            // ktra dia chi
            if (!padd.matcher(cityName).find()) {
                request.setAttribute("notice", "The city name does not include address numbers and does not include special characters.");
                request.getRequestDispatcher("profilejb.jsp").forward(request, response);
            } else {
                // thong qua ktra dia chi
                //check date hien tai để kiểm tra có đủ 18 tuổi k
                if (!is18OrOlder(dob)) { 
                    request.setAttribute("notice", "User must be over 18 years old.");
                    NotificationDAO notidao = new NotificationDAO();
                    request.setAttribute("notidao", notidao);
                    request.getRequestDispatcher("profilejb.jsp").forward(request, response);
                } else {
                        // thong qua cái ktra tuổi

                    User u = (User) session.getAttribute("account");
                    JobseekerDAO jd = new JobseekerDAO();
                    Pattern p = Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$");
                    if (password.length() == 0) {
                        // Google muón thì cập nhật mk
                        User uu = new User(u.getIdUser(), firstName, lastName, u.getEmail(), u.getPassword(), u.getRoleId(), u.getMessage(), u.getStatus(), cityName, phoneNumber, dob);
                        jd.update(uu);
                        session.setAttribute("account", uu);
                        request.setAttribute("successfully", true);
                        NotificationDAO notidao = new NotificationDAO();
                        request.setAttribute("notidao", notidao);

                        request.getRequestDispatcher("profilejb.jsp").forward(request, response);

                    } else if (password.length() != 0) {
                        // còn không thì phải khác 0 ( mật khẩu dài hơn 0)
                        if (!p.matcher(password).find()) {
                            request.setAttribute("notice", "New password have [0-9],[a-z],[A-Z],[!-&]");
                            request.getRequestDispatcher("profilejb.jsp").forward(request, response);
                        } else {
                             //( mật khẩu dài hơn 0)
                            User uu = new User(u.getIdUser(), firstName, lastName, u.getEmail(), password, u.getRoleId(), u.getMessage(), u.getStatus(), cityName, phoneNumber, dob);
                            jd.update(uu);
                            session.setAttribute("account", uu);
                            request.setAttribute("successfully", true);
                            NotificationDAO notidao = new NotificationDAO();
                            request.setAttribute("notidao", notidao);
                            request.getRequestDispatcher("profilejb.jsp").forward(request, response);
                            //done
                        }
                    }
//        else if ((password.length() != 0 && confirmpasss.length() == 0) || password.length() == 0 && confirmpasss.length() != 0) {
//
//            request.setAttribute("notice", "Please fill in all information!!!");
//            request.getRequestDispatcher("profilejb.jsp").forward(request, response);
//
//        }
                }
            }
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
