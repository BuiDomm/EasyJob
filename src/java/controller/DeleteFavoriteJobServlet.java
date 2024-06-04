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

@WebServlet(name = "DeleteFavoriteJobServlet", urlPatterns = {"/deleteFavoriteJobServlet"})
public class DeleteFavoriteJobServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int uid = Integer.parseInt(request.getParameter("uid"));
        int jid = Integer.parseInt(request.getParameter("jid"));
        
        boolean success = deleteFavoriteJob(uid, jid, request, response);
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"success\": " + success + "}");
    }

    private boolean deleteFavoriteJob(int uid, int jid, HttpServletRequest request, HttpServletResponse response) {
        String favoriteJobs = "";
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("favoriteJobs" + uid)) {
                    favoriteJobs = cookie.getValue();
                    break;
                }
            }
        }

        if (!favoriteJobs.isEmpty()) {
            List<String> favoriteJobIds = new ArrayList<>(List.of(favoriteJobs.split("\\|")));
            boolean removed = favoriteJobIds.remove(String.valueOf(jid));
            if (removed) {
                favoriteJobs = String.join("|", favoriteJobIds);

                Cookie cookie = new Cookie("favoriteJobs" + uid, favoriteJobs);
                cookie.setMaxAge(60 * 60 * 24); // 24h
                response.addCookie(cookie);
                return true;
            }
        }
        return false;
    }
}
