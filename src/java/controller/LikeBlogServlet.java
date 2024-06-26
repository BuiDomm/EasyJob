/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dao.JobseekerDAO;
import dao.LikeDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Like;

/**
 *
 * @author This PC
 */
@WebServlet(name = "LikeBlogServlet", urlPatterns = {"/likeBlogs"})
public class LikeBlogServlet extends HttpServlet {

    private LikeDAO likeDao = new LikeDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int uid = Integer.parseInt(request.getParameter("uid"));
        int bid = Integer.parseInt(request.getParameter("bid"));

        Like like = likeDao.getLikeByBlogIdAndUserId(bid, uid);
        if (like == null) {
            this.likeDao.insert(new Like(uid, bid));
        } else {
            this.likeDao.deleteLike(uid, bid);
        }

        int totalLikes = this.likeDao.getCountByBlog(bid);

        // Prepare the JSON response
        Gson gson = new Gson();
        String jsonResponse = gson.toJson(totalLikes);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
