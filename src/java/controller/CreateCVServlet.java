/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CVDAO;
import dao.JobseekerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CVProfile;
import model.User;

/**
 *
 * @author Admin /createCV
 */
public class CreateCVServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("createCV.jsp");
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String linkYoutube = request.getParameter("linkYoutube");
       String linkPdf = request.getParameter("linkPdf");
       String education = request.getParameter("education");
       String skills = request.getParameter("skills");
       String experience = request.getParameter("experience");
       String certification = request.getParameter("certification");
       String description = request.getParameter("description");
       String linkTwitter = request.getParameter("linkTwitter");
       String linkFacebook = request.getParameter("linkFacebook");
       String linkLinkedin = request.getParameter("linkLinkedin");
       String linkUrl = linkYoutube+"|"+linkFacebook+"|"+linkTwitter+"|"+linkLinkedin;
       
       System.out.println("----------------------"+linkPdf);
       
       JobseekerDAO jsDAO = new JobseekerDAO();
       CVDAO cvDao = new CVDAO();
       String roleRequired = "jobseeker";
        
        // Get all cookies from the request
        Cookie[] cookies = request.getCookies();
        String cuser = null;

        // Check if cookies are not null
        if (cookies != null) {
            // Loop through the cookies to find the one named "cuser"
            for (Cookie cookie : cookies) {
                if ("cuser".equals(cookie.getName())) {
                    cuser = cookie.getValue();
                    break; // Exit loop once the cookie is found
                }
            }
        }

        // Nếu đã login 
        if (cuser != null) {
            String roleName = jsDAO.getRoleByEmail(cuser);
            //Nếu role là jobseeker ,gọi jsp cvProfile
            if(roleName.toLowerCase().equalsIgnoreCase(roleRequired)){
                // Truyền cv vs thông tin user sang jsp
                // Gọi hàm DAO để lấy CVProfile dựa trên email
                CVProfile cvProfile = cvDao.findByEmail(cuser);
                User user = jsDAO.findByEmail(cuser);               
                
                if (cvProfile == null && user != null) {
                    //xu ly insert     
                    CVProfile newCv = new CVProfile(user.getIdUser(), skills, experience, description, education, certification, linkUrl, linkPdf);
                    cvDao.insert(newCv);
                    
                       
                   
                    //request.setAttribute("UserId", user.getIdUser());
                    // Chuyển hướng đến trang JSP
                    response.sendRedirect("CVSeeker");
                } else {
                     response.sendRedirect("CVSeeker");
                }
            }
            //Nếu role không phải jobseeker ,chuyển trang login
            else{
                response.sendRedirect("login.jsp");
            }
        } 
        
        // Nếu chưa login chuyển sang trang login 
        else {
           response.sendRedirect("login.jsp");
        }
    }
}
