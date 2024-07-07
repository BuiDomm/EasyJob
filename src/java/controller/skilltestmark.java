/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.oracle.wls.shaded.org.apache.bcel.generic.AALOAD;
import dao.AnswerDAO;
import dao.ChooseAnswerDAO;
import dao.CompanyDAO;
import dao.JobApplyDAO;
import dao.JobDAO;
import dao.JobseekerDAO;
import dao.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
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
public class skilltestmark extends HttpServlet {

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
        int id = Integer.parseInt(request.getParameter("id"));
        int userid = Integer.parseInt(request.getParameter("userid"));
        JobseekerDAO jsd = new JobseekerDAO();
        User u = jsd.findById(userid);
        CompanyDAO cm = new CompanyDAO();
        Company com = cm.findCompanyByIdJob(id);
        JobDAO jd = new JobDAO();
        Job b = jd.findById(id);
        QuestionDAO qd = new QuestionDAO();
        ChooseAnswerDAO chd = new ChooseAnswerDAO();
        List<ChooseAnswer> chooseanswer = chd.getChooseAnswerJobIDAndUserID(id, userid);

        AnswerDAO ad = new AnswerDAO();
        List<Question> questions = qd.getQuestionsByJobId(id);
        Map<Question, List<Answer>> questionAnswersMap = new HashMap<>();
        Map<Question, List<ChooseAnswer>> questionChooseAnswersMap = new HashMap<>();

        for (Question question : questions) {
            List<Answer> answers = ad.getAnswerByQuestionID(question.getQuestionID());
            questionAnswersMap.put(question, answers);

            List<ChooseAnswer> chooseAnswersForQuestion = new ArrayList<>();
            for (ChooseAnswer ca : chooseanswer) {
                if (ca.getAnswer().getQuestion().getQuestionID().equals(question.getQuestionID())) {
                    chooseAnswersForQuestion.add(ca);
                }
            }
            questionChooseAnswersMap.put(question, chooseAnswersForQuestion);
            
        }
        JobApplyDAO jadao = new JobApplyDAO();
        request.setAttribute("apply", jadao.getApplicationByUserIdAndJobId(userid, id));
        request.setAttribute("point", chd.getTotalPointsByJobIDAndUserID(id, userid));
        request.setAttribute("com", com);
        request.setAttribute("cc", b);
        request.setAttribute("u", u);
        request.setAttribute("questions", questions);
        request.setAttribute("questionAnswersMap", questionAnswersMap);
        request.setAttribute("questionChooseAnswersMap", questionChooseAnswersMap);
        request.getRequestDispatcher("skilltestmark.jsp").forward(request, response);

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
