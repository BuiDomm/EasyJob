/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CVDAO;
import dao.JobseekerDAO;
import java.io.IOException;
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
public class EmployerDetailCVServlet extends HttpServlet {

    // Từ trang khác khi click vào 1 jobseeker apply thì truyền id của jobseeker đó sang servlet này ,để xem detail cv
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int jobseekerId = 0;
        int applyId = 0;
        try {
            jobseekerId = Integer.parseInt(request.getParameter("UserId"));
            applyId = Integer.parseInt(request.getParameter("ApplyId"));
        } catch (Exception e) {
            response.sendRedirect("login.jsp");
        }

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");

        if (user != null && user.getRoleId() == 3) {
            JobseekerDAO jsDAO = new JobseekerDAO();
            CVDAO cvDao = new CVDAO();

            User jobseeker = jsDAO.findById(jobseekerId);
            if (jobseeker != null) {
                CVProfile cvProfile = cvDao.findByEmail(jobseeker.getEmail());

                if (cvProfile != null) {
                    String linkUrl = cvProfile.getLinkUrl();
                    int count = countOccurrences(linkUrl, '|');
                    if (count < 4) {
                        int diff = 4 - count;
                        for (int i = 0; i < diff; i++) {
                            linkUrl += "|";
                        }
                    }

                    request.setAttribute("cv", cvProfile);
                    request.setAttribute("user", jobseeker);
                    request.setAttribute("applyId", applyId);
                    request.getRequestDispatcher("CVProfileForView.jsp").forward(request, response);
                } else {
                    response.getWriter().println("Không tìm thấy CVProfile cho email: " + jobseeker.getEmail());
                }
            } else {
                response.getWriter().println("Không tìm thấy jobseeker cho id: " + jobseekerId);
            }
        } else {
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
