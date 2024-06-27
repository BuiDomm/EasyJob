/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AnswerDAO;
import dao.CompanyDAO;
import dao.JobDAO;
import dao.QuestionDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Answer;
import model.Company;
import model.Job;
import model.Question;
import model.User;

/**
 *
 * @author ADMIN
 */
public class updateskilltest extends HttpServlet {

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
            questionAnswersMap.put(question, answers);
        }

        request.setAttribute("com", com);
        request.setAttribute("cc", b);
        request.setAttribute("u", u);
        request.setAttribute("questions", questions);
        request.setAttribute("questionAnswersMap", questionAnswersMap);
        request.getRequestDispatcher("updateskilltest.jsp").forward(request, response);
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
    QuestionDAO qd = new QuestionDAO();
    AnswerDAO ad = new AnswerDAO();
    int jobID = Integer.parseInt(request.getParameter("id"));
    String[] questionTitles = request.getParameterValues("questionTitle[]");
    String[] questionIDs = request.getParameterValues("questionID[]");
    String[] answerIDs = request.getParameterValues("answerID[]");
    String[] incorrectanswerIDs = request.getParameterValues("incorrectanswerID[]");
    String[] correctAnswers = request.getParameterValues("correctAnswer[]");
    String[] addquestionTitles = request.getParameterValues("addquestionTitle[]");
    String[] addcorrectAnswers = request.getParameterValues("addcorrectAnswer[]");
    String[] countIncorrectAnswers = request.getParameterValues("incorrectAnswersCount[]");
    
    String[] addcountIncorrectAnswer = request.getParameterValues("addincorrectAnswersCount[]");

    
    JobDAO jd = new JobDAO();
    Job job = jd.findById(jobID);

    int incorrectAnswerIndex = 0;
    int addincorrectAnswerIndex = 0;
    int addincorrectAnswerCountIndex = 0;
       try {
       
           for (int i = 0; i < questionTitles.length; i++) {
        String questionTitle = questionTitles[i];
        String answerText = correctAnswers[i];
        String questionID = questionIDs[i];
        int answerID = Integer.parseInt(answerIDs[i]);
        Question question = qd.findByQuestionId(questionID);

        question.setContent(questionTitle);
        qd.update(question);

        Answer correctAnswer = ad.findById(answerID);
        correctAnswer.setAnswerText(answerText);
        ad.update(correctAnswer);

        int countIncorrect = Integer.parseInt(countIncorrectAnswers[i]);
        String[] incorrectAnswers = request.getParameterValues("incorrectAnswer[]");
        

        for (int j = 0; j < countIncorrect; j++) {
            
            String incorrectAnswerText = incorrectAnswers[incorrectAnswerIndex];
            int incorrectanswerID = Integer.parseInt(incorrectanswerIDs[incorrectAnswerIndex]);
            Answer incorrectAnswer = ad.findById(incorrectanswerID);
            incorrectAnswer.setAnswerText(incorrectAnswerText);

            ad.update(incorrectAnswer);
            incorrectAnswerIndex++;
        }
        if (addcountIncorrectAnswer != null){
        int addcountIncorrectAnswers = Integer.parseInt(addcountIncorrectAnswer[i]);
            addincorrectAnswerCountIndex++;
            for (int k = 0; k < addcountIncorrectAnswers; k++) {

                String addincorrectAnswers = request.getParameterValues("addincorrectAnswer[]")[addincorrectAnswerIndex++];
                Answer addincorrectAnswer = new Answer(i, question, addincorrectAnswers, null, 0);

                ad.insert(addincorrectAnswer);
            }
        }
    }
           
       } catch (Exception e) {
       }
       
       
    int questionIdCounter = 0;
       try {
           if (questionTitles != null){
            questionIdCounter=questionTitles.length+1;
        }else{
            questionIdCounter=1;
        }
           if(addquestionTitles != null){
            for (int i = 0; i < addquestionTitles.length; i++) {
            String addquestionTitleText = addquestionTitles[i];
            String addanswerText = addcorrectAnswers[i];
            String questionId = "QS" + jobID * 1000 + questionIdCounter++;

            Question question = new Question(questionId, job, addquestionTitleText, null);

            qd.insert(question);

            Answer correctAnswer = new Answer(i, question, addanswerText, null, 1);

            ad.insert(correctAnswer);

            int addcountIncorrectAnswers = Integer.parseInt(addcountIncorrectAnswer[addincorrectAnswerCountIndex]);
            for (int j = 0; j < addcountIncorrectAnswers; j++) {

                String addincorrectAnswers = request.getParameterValues("addincorrectAnswer[]")[addincorrectAnswerIndex++];
                Answer incorrectAnswer = new Answer(i, question, addincorrectAnswers, null, 0);

                ad.insert(incorrectAnswer);
            }
            addincorrectAnswerCountIndex++;
        }
        }
           
       } catch (Exception e) {
       }
        
//    request.setAttribute("mess", addincorrectAnswerCountIndex);
//    request.getRequestDispatcher("test.jsp").forward(request, response);
    request.getRequestDispatcher("loadskilltest?id="+job.getJobID()).forward(request, response);
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
