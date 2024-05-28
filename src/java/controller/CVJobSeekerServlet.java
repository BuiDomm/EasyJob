/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CVDAO;
import dao.JobseekerDAO;
import jakarta.servlet.RequestDispatcher;
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
 * @author Admin
 */
public class CVJobSeekerServlet extends HttpServlet {

    // Hien thi overview 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
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
        if (cuser != null && !cuser.equalsIgnoreCase("")) {
            String roleName = "";
            try{
                roleName = jsDAO.getRoleByEmail(cuser);
                if(roleName.equalsIgnoreCase("") || roleName == null){
                    response.sendRedirect("login.jsp");
                }
            }catch(Exception e){
                 response.sendRedirect("login.jsp");
            }
            //Nếu role là jobseeker ,gọi jsp cvProfile
            if(roleName.toLowerCase().equalsIgnoreCase(roleRequired)){
                // Truyền cv vs thông tin user sang jsp
                // Gọi hàm DAO để lấy CVProfile dựa trên email
                CVProfile cvProfile = cvDao.findByEmail(cuser);
                User user = jsDAO.findByEmail(cuser);
                
                if (cvProfile != null && user != null) {
                    // Xử lý link url ,nếu không đủ 4 dấu | cho 4 loại link thì điền thêm để in ra jsp không lỗi
                    String linkUrl = cvProfile.getLinkUrl();
                     // Kiểm tra xem chuỗi có ít hơn 3 kí tự '|' không
                    int count = countOccurrences(linkUrl, '|');
                    if (count < 3) {
                        // Tính số lượng kí tự '|' cần thêm vào
                        int diff = 3 - count;

                        // Thêm kí tự '|' vào chuỗi để có đủ 4 kí tự '|'
                        for (int i = 0; i < diff; i++) {
                            linkUrl += "|";
                        }
                    }
                    
                    // Truyền thông tin CVProfile, user qua request
                    request.setAttribute("cv", cvProfile);
                    request.setAttribute("user", user);
                    // Chuyển hướng đến trang JSP
                    request.getRequestDispatcher("CVProfile.jsp").forward(request, response);
                } else {
                    response.sendRedirect("createCV");
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

    // Hàm đếm số lần xuất hiện của một kí tự trong chuỗi
    public int countOccurrences(String inputString, char ch) {
        int count = 0;
        for (int i = 0; i < inputString.length(); i++) {
            if (inputString.charAt(i) == ch) {
                count++;
            }
        }
        return count;
    }
   
    // Save change profile
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String linkYoutube = request.getParameter("linkYoutube");
       String linkPdf = request.getParameter("linkPdf");
       String firstName = request.getParameter("firstName");
       String lastName = request.getParameter("lastName");
       String education = request.getParameter("education");
       String skills = request.getParameter("skills");
       String phoneNumber = request.getParameter("phoneNumber");
       System.out.println("phne----------------------"+phoneNumber);
       String email = request.getParameter("email");
       String cityName = request.getParameter("cityName");
       String experience = request.getParameter("experience");
       String certification = request.getParameter("certification");
       String description = request.getParameter("description");
       String linkTwitter = request.getParameter("linkTwitter");
       String linkFacebook = request.getParameter("linkFacebook");
       String linkLinkedin = request.getParameter("linkLinkedin");
       
       String linkUrl = linkYoutube+"|"+linkFacebook+"|"+linkTwitter+"|"+linkLinkedin;
       
            
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
                
                if (cvProfile != null && user != null) {
                    //xu ly update
                    System.out.println("--------------------------------------");
                    // Truong hop k chon linkpdf moi
                    if(linkPdf.equalsIgnoreCase("")){
                        linkPdf = cvProfile.getLinkPdf();
                    }
                    cvDao.updateCVProfileFromCV(linkPdf, education, skills, experience, certification, description, linkUrl, cuser);
                    jsDAO.updateUserFromCV(cuser, firstName, lastName, phoneNumber, email, cityName);
                    
                    
                    cvProfile.setEducation(education);
                    cvProfile.setCertification(certification);
                    cvProfile.setSkills(skills);
                    cvProfile.setExperience(experience);
                    cvProfile.setDescription(description);
                    cvProfile.setLinkUrl(linkUrl);
                    cvProfile.setLinkPdf(linkPdf);
                    
                    user.setFirstName(firstName);
                    user.setLastName(lastName);
                    user.setPhoneNumber(phoneNumber);
                    user.setCityName(cityName);
                    user.setEmail(email);
                     // Tạo hoặc cập nhật cookie
                    Cookie cookie = new Cookie("cuser", email);
                    // Thiết lập thời gian tồn tại của cookie (tùy chọn, ở đây là 1 ngày)
                    cookie.setMaxAge(24 * 60 * 60); // 1 ngày
                    // Thiết lập đường dẫn (tùy chọn)
                    cookie.setPath("/"); // cookie sẽ có hiệu lực trong toàn bộ ứng dụng
                    // Thêm cookie vào phản hồi
                    response.addCookie(cookie);
                    
                    
                    // Truyền thông tin CVProfile, user qua request
                    request.setAttribute("cv", cvProfile);
                    request.setAttribute("user", user);
                    // Chuyển hướng đến trang JSP
                    request.getRequestDispatcher("CVProfile.jsp").forward(request, response);
                } else {
                    response.getWriter().println("Không tìm thấy CVProfile cho email: " + cuser);
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