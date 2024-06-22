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
import model.Answer;
import java.sql.ResultSet;
import java.util.Date;
import model.Question;

/**
 *
 * @author ADMIN
 */
public class AnswerDAO extends DBContext implements BaseDAO<Answer> {

    QuestionDAO qd = new QuestionDAO();

    @Override
    public List<Answer> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

     @Override
    public Answer findById(int id) {
        String sql = "SELECT * FROM Answers WHERE AnswerID = ?";
        try (PreparedStatement st = getConnection().prepareStatement(sql)) {
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String questionID = rs.getString("QuestionID");
                Question question = qd.findByQuestionId(questionID);
                int ansID = rs.getInt("AnswerID");
                String answerText = rs.getString("AnswerText");
                Date answerDate = rs.getDate("AnswerDate");
                int isTrue = rs.getInt("Is_true");
                Answer answer = new Answer(ansID, question, answerText, answerDate, isTrue);
                return answer;
            }
        } catch (Exception e) {
            Logger.getLogger(AnswerDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return null; 
    }

    @Override
    public boolean insert(Answer answer) {
        String sql = "INSERT INTO [dbo].[Answers]\n"
                + "           ([QuestionID]\n"
                + "           ,[Is_true]\n"
                + "           ,[AnswerText])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, answer.getQuestion().getQuestionID());
            st.setInt(2, answer.getIsTrue());
            st.setString(3, answer.getAnswerText());

            int rowAffect = st.executeUpdate();
            if (rowAffect > 0) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public List<Answer> getAnswerByQuestionID(String qid) {
        List<Answer> list = new ArrayList<>();
        String sql = "SELECT [AnswerID]\n"
                + "      ,[QuestionID]\n"
                + "      ,[Is_true]\n"
                + "      ,[AnswerText]\n"
                + "      ,[AnswerDate]\n"
                + "  FROM [dbo].[Answers] where QuestionID=?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, qid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Question q = qd.findByQuestionId(qid);
                int ansid = rs.getInt("AnswerID");
                String answerText = rs.getString("AnswerText");
                Date answerDate = rs.getDate("AnswerDate");
                int isTrue = rs.getInt("Is_true");
                Answer a = new Answer(ansid, q, answerText, answerDate, isTrue);
                list.add(a);

            }
        } catch (Exception e) {
        }

        return list;
    }

    @Override
    public boolean update(Answer a) {
        String sql = "UPDATE [dbo].[Answers]\n"
                + "   SET [AnswerText] = ?\n"
                + " WHERE AnswerID =?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, a.getAnswerText());
            st.setInt(2, a.getAnswerID());

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

    public static void main(String[] args) {
        // Khởi tạo AnswerDAO
        AnswerDAO answerDAO = new AnswerDAO();
        QuestionDAO questionDAO = new QuestionDAO();

        // Test phương thức findById
        System.out.println("\nTest phương thức findById:");
        int answerId = 1; // Thay đổi ID tùy theo dữ liệu trong cơ sở dữ liệu của bạn
        Answer answer = answerDAO.findById(answerId);
        if (answer != null) {
            System.out.println("Tìm thấy Answer với ID " + answerId + ": " + answer);
        } else {
            System.out.println("Không tìm thấy Answer với ID " + answerId);
        }

    }

}
