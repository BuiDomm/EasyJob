/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author This PC
 */
@WebServlet(name = "FavoriteJobServlet", urlPatterns = {"/favoriteJobs"})
public class FavoriteJobServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int uid = Integer.parseInt(request.getParameter("uid"));
        int jid = Integer.parseInt(request.getParameter("jid"));
        
        saveFavoriteJob(uid, jid, request, response);
        
        response.sendRedirect("jobdetails?id="+jid);
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
    }

    private void saveFavoriteJob(int uid, int jid, HttpServletRequest request, HttpServletResponse response) {
        String favoriteJobs = "";
        Cookie[] cookies = request.getCookies();
        if(cookies != null) {
            for(Cookie cookie: cookies) {
                if(cookie.getName().equals("favoriteJobs"+uid)) {
                    favoriteJobs = cookie.getValue();
                    break;
                }
            }
        }
        
        if(favoriteJobs.isEmpty()) {
            favoriteJobs = String.valueOf(jid);
        } else {
            if(!favoriteJobs.contains(String.valueOf(jid))) {
                favoriteJobs += "|" + jid;
            }
        }
        
        Cookie cookie = new Cookie("favoriteJobs"+uid, favoriteJobs);
        cookie.setMaxAge(60*60*24); // 24h
        response.addCookie(cookie);
    }
    
}
