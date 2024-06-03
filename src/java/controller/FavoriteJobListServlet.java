/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.JobDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.FavoriteJobDTO;
import model.Job;
import model.User;

/**
 *
 * @author This PC
 */
@WebServlet(name = "FavoriteJobListServlet", urlPatterns = {"/favoriteJobList"})
public class FavoriteJobListServlet extends HttpServlet {

    private JobDAO jobDao = new JobDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("account");
        
        String favoriteJobs = "";
        Cookie[] cookies = request.getCookies();
        if(cookies != null) {
            for(Cookie cookie: cookies) {
                if(cookie.getName().equals("favoriteJobs"+us.getIdUser())) {
                    favoriteJobs = cookie.getValue();
                    break;
                }
            }
        }
        
        String[] favoriteJobIdsString = favoriteJobs.split("\\|");
        List<Integer> favoriteJobIds = new ArrayList<>();
        for(String jbId: favoriteJobIdsString) {
            try {
                favoriteJobIds.add(Integer.parseInt(jbId));
            } catch (Exception e) {
                System.out.println("err: " + e.getMessage());
            }
        }
        
        List<FavoriteJobDTO> res = convertToFJobDto(favoriteJobIds);
        
        request.setAttribute("jobsFavorite", res);
        request.getRequestDispatcher("job-favorite.jsp").forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    private List<FavoriteJobDTO> convertToFJobDto(List<Integer> jobIds) {
    List<FavoriteJobDTO> res = new ArrayList<>();
    for (int id : jobIds) {
        FavoriteJobDTO job = jobDao.findJobFavoriteById(id);
        if (job != null) {
            res.add(job);
        }
    }
    return res;
}

}