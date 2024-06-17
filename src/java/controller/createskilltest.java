/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CompanyDAO;
import dao.JobApplyDAO;
import dao.JobDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Answer;
import model.Apply;
import model.Company;
import model.Job;
import model.Question;
import model.User;
import org.apache.http.client.fluent.Response;

/**
 *
 * @author ADMIN
 */
public class createskilltest extends HttpServlet {

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
        JobApplyDAO dao = new JobApplyDAO();
        List<Apply> listApply = dao.ListApplyByUserIdAndJobID(u.getIdUser(), id);
        for (Apply apply : listApply) {
            System.out.println(apply.getCvProfile().getUserID());
        }
        request.setAttribute("dao", dao);
        request.setAttribute("listApply", listApply);
        request.setAttribute("com", com);
        request.setAttribute("cc", b);
        request.setAttribute("u", u);
        request.getRequestDispatcher("createskilltest.jsp").forward(request, response);
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

        String[] questionTitles = request.getParameterValues("questionTitle[]");
        String[] answers = request.getParameterValues("answer[]");
        String[] incorrectAnswers = request.getParameterValues("incorrectAnswer[]");

        int id = Integer.parseInt(request.getParameter("id"));

        JobDAO jd = new JobDAO();
        Job job = jd.findById(id);
        List<Question> questions = new ArrayList<>();
        List<Answer> allAnswers = new ArrayList<>();

        for (int i = 0; i < questionTitles.length; i++) {
            String questionTitle = questionTitles[i];
            String answerText = answers[i];

            Question question = new Question((int) Math.random(), job, questionTitle, null);
            questions.add(question);

            Answer correctAnswer = new Answer(job.getJobID(), question, answerText, null, 1);
            allAnswers.add(correctAnswer);
            if (incorrectAnswers != null) {
                int questionIndex = 0;
                int incorrectAnswersPerQuestion = incorrectAnswers.length / questionTitles.length;

                for (int j = 0; j < incorrectAnswers.length; j++) {
                    String incorrectAnswerText = incorrectAnswers[i];
                    Answer incorrectAnswer = new Answer(job.getJobID(), question, incorrectAnswerText, null, 0);
                    allAnswers.add(incorrectAnswer);
                }
            }

        }

        request.setAttribute("job", job);
        request.setAttribute("questions", questions);
        request.setAttribute("allAnswers", allAnswers);

        request.getRequestDispatcher("test.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
