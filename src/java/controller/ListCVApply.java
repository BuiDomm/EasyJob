/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.CVDAO;
import dao.ChooseAnswerDAO;
import dao.JobApplyDAO;
import dao.QuestionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.Apply;
import model.ChooseAnswer;
import model.Question;
import model.User;

/**
 *
 * @author DELL
 */
public class ListCVApply extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        int useId = user.getIdUser();
        String status = request.getParameter("status");
         String indexPage = request.getParameter("index");
        if (status == null) {
            status = "Pending";
        }
         if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        JobApplyDAO dao = new JobApplyDAO();
        int count = dao.getTotalApply(useId, status);
        int endPage = count / 6;
        if (count % 6 != 0) {
            endPage++;
        }
     
        List<Apply> listApply = dao.pagingCVList(useId, status, index);
        for (Apply apply : listApply) {
            System.out.println(apply);
        }
        ChooseAnswerDAO chd = new ChooseAnswerDAO();
        request.setAttribute("status", chd);
        request.setAttribute("endP", endPage);
        request.setAttribute("dao", dao);
        request.setAttribute("listApply", listApply);
        request.getRequestDispatcher("listCvSeeker.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
