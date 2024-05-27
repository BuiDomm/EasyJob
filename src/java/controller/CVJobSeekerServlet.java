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
import jakarta.servlet.http.HttpSession;
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");

        if (user != null && user.getRoleId() == 2) {
            CVDAO cvDao = new CVDAO();
            CVProfile cvProfile = cvDao.findByEmail(user.getEmail());

            if (cvProfile != null) {
                String linkUrl = cvProfile.getLinkUrl();
                int count = countOccurrences(linkUrl, '|');
                if (count < 3) {
                    int diff = 3 - count;
                    for (int i = 0; i < diff; i++) {
                        linkUrl += "|";
                    }
                }
                request.setAttribute("cv", cvProfile);
                request.setAttribute("user", user);
                request.getRequestDispatcher("CVProfile.jsp").forward(request, response);
            } else {
                response.sendRedirect("createCV");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");

        if (user != null && user.getRoleId() == 2) {
            String linkYoutube = request.getParameter("linkYoutube");
            String linkPdf = request.getParameter("linkPdf");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String education = request.getParameter("education");
            String skills = request.getParameter("skills");
            String phoneNumber = request.getParameter("phoneNumber");
            String email = request.getParameter("email");
            String cityName = request.getParameter("cityName");
            String experience = request.getParameter("experience");
            String certification = request.getParameter("certification");
            String description = request.getParameter("description");
            String linkTwitter = request.getParameter("linkTwitter");
            String linkFacebook = request.getParameter("linkFacebook");
            String linkLinkedin = request.getParameter("linkLinkedin");

            String linkUrl = linkYoutube + "|" + linkFacebook + "|" + linkTwitter + "|" + linkLinkedin;

            JobseekerDAO jsDAO = new JobseekerDAO();
            CVDAO cvDao = new CVDAO();

            CVProfile cvProfile = cvDao.findByEmail(user.getEmail());

            if (cvProfile != null) {
                if (linkPdf.equalsIgnoreCase("")) {
                    linkPdf = cvProfile.getLinkPdf();
                }
                cvDao.updateCVProfileFromCV(linkPdf, education, skills, experience, certification, description, linkUrl, user.getEmail());
                jsDAO.updateUserFromCV(user.getEmail(), firstName, lastName, phoneNumber, email, cityName);

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

                session.setAttribute("account", user);

                request.setAttribute("cv", cvProfile);
                request.setAttribute("user", user);
                request.getRequestDispatcher("CVProfile.jsp").forward(request, response);
            } else {
                response.getWriter().println("Không tìm thấy CVProfile cho email: " + user.getEmail());
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    public int countOccurrences(String inputString, char ch) {
        int count = 0;
        for (int i = 0; i < inputString.length(); i++) {
            if (inputString.charAt(i) == ch) {
                count++;
            }
        }
        return count;
    }

}
