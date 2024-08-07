/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AnswerDAO;
import dao.ChooseAnswerDAO;
import dao.CompanyDAO;
import dao.JobDAO;
import dao.NotificationDAO;
import dao.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Answer;
import model.ChooseAnswer;
import model.Company;
import model.Job;
import model.Question;
import model.User;

/**
 *
 * @author ADMIN
 */
public class dotest extends HttpServlet {

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
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");
        int id = Integer.parseInt(request.getParameter("id"));
        CompanyDAO cm = new CompanyDAO();
        Company com = cm.findCompanyByIdJob(id);
        JobDAO jd = new JobDAO();
        Job b = jd.findById(id);
        QuestionDAO qd = new QuestionDAO();
        AnswerDAO ad = new AnswerDAO();
        List<Question> questions = qd.getQuestionsByJobId(id);
        Map<Question, List<Answer>> questionAnswersMap = new HashMap<>();

        for (Question question : questions) {
            List<Answer> answers = ad.getAnswerByQuestionID(question.getQuestionID());
            Collections.shuffle(answers);
            questionAnswersMap.put(question, answers);
        }

        ChooseAnswerDAO chd = new ChooseAnswerDAO();
        List<ChooseAnswer> chooseanswer = chd.getChooseAnswerJobIDAndUserID(id, u.getIdUser());

        request.setAttribute("checktest", chooseanswer);
        request.setAttribute("com", com);
        request.setAttribute("cc", b);
        request.setAttribute("u", u);
        request.setAttribute("questions", questions);
        request.setAttribute("questionAnswersMap", questionAnswersMap);
        request.getRequestDispatcher("dotest.jsp").forward(request, response);
        
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
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");
        int id = Integer.parseInt(request.getParameter("id"));

        String[] chooseanswer = request.getParameterValues("chooseanswer[]");
        if (chooseanswer == null) {
            response.sendRedirect("skilltestcancel?id=" + id);
        } else {
            AnswerDAO ad = new AnswerDAO();
            ChooseAnswerDAO cdao = new ChooseAnswerDAO();
            for (int i = 0; i < chooseanswer.length; i++) {
                int input = Integer.parseInt(chooseanswer[i]);
                ChooseAnswer choose = new ChooseAnswer(0, u, ad.findById(input), "completed");
                cdao.insert(choose);
            }
            response.sendRedirect("jobdetails?id=" + id);
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
