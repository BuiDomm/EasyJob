/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Job;
import model.Question;
import model.User;
import java.sql.ResultSet;
import java.util.Date;

/**
 *
 * @author ACER
 */
public class QuestionDAO extends DBContext implements BaseDAO<Question> {

    JobDAO jd = new JobDAO();

    @Override
    public List<Question> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Question findById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean insert(Question question) {
        String sql = "INSERT INTO [dbo].[Questions]\n"
                + "           ([QuestionID]\n"
                + "           ,[JobID]\n"
                + "           ,[Content])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, question.getQuestionID());
            st.setInt(2, question.getJob().getJobID());
            st.setString(3, question.getContent());

            int rowAffect = st.executeUpdate();
            if (rowAffect > 0) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public List<Question> getQuestionsByJobId(int jobId) {
        List<Question> questions = new ArrayList<>();
        String sql = "SELECT [QuestionID]\n"
                + "      ,[JobID]\n"
                + "      ,[Content]\n"
                + "      ,[Date]\n"
                + "  FROM [dbo].[Questions] where JobID=?";
        try {

            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, jobId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String questionID = rs.getString("QuestionID");
                int jobID = rs.getInt("JobID");
                String content = rs.getString("Content");
                Date date = rs.getDate("Date");
                Job job = jd.findById(jobID);
                Question question = new Question(questionID, job, content, date);
                questions.add(question);

            }

        } catch (Exception e) {
        }

        return questions;
    }

    public Question findByQuestionId(String qid) {
        String sql = "SELECT [QuestionID]\n"
                + "      ,[JobID]\n"
                + "      ,[Content]\n"
                + "      ,[Date]\n"
                + "  FROM Questions where QuestionID=?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, qid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String questionID = rs.getString("QuestionID");
                int jobID = rs.getInt("JobID");
                String content = rs.getString("Content");
                Date date = rs.getDate("Date");
                Job job = jd.findById(jobID);
                Question question = new Question(questionID, job, content, date);
                return question;

            }
        } catch (Exception e) {
        }
        return null;
    }

    @Override
    public boolean update(Question q) {
        String sql = "UPDATE [dbo].[Questions]\n"
                + "   SET [Content] = ?\n"
                + " WHERE QuestionID =?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, q.getContent());
            st.setString(2, q.getQuestionID());
            
            int rowAffect = st.executeUpdate();
            if (rowAffect > 0) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    public boolean deleteFullQuestion(String id) {
       String Answersql = "DELETE FROM [dbo].[Answers]\n" +
"      WHERE QuestionID = ?";
       String Questionsql = "DELETE FROM [dbo].[Questions]\n" +
"      WHERE QuestionID = ?";
        PreparedStatement ps;
        try {
            PreparedStatement deleteAns = getConnection().prepareStatement(Answersql);
            PreparedStatement deleteQues = getConnection().prepareStatement(Questionsql);
            deleteAns.setString(1, id);
            deleteAns.executeUpdate();
           
            deleteQues.setString(1, id);
            int rowAffect = deleteQues.executeUpdate();
            if (rowAffect > 0) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);

        }

        return false;
       
    }
   
 public static void main(String[] args) {
        QuestionDAO questionDAO = new QuestionDAO();

        // ID của câu hỏi bạn muốn xóa
        String questionId = "QS10040003";  // Thay thế bằng ID thực tế của câu hỏi

        // Gọi phương thức deleteFullQuestion để xóa câu hỏi và các câu trả lời liên quan
        boolean isDeleted = questionDAO.deleteFullQuestion(questionId);

        if (isDeleted) {
            System.out.println("Câu hỏi và các câu trả lời liên quan đã được xóa thành công.");
        } else {
            System.out.println("Không thể xóa câu hỏi hoặc câu hỏi không tồn tại.");
        }
    }
}
