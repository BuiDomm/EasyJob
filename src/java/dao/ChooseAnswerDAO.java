/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.util.List;
import model.ChooseAnswer;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Answer;
import java.sql.ResultSet;
import java.util.Date;
import model.Question;
import model.User;
import model.UserDTO;

/**
 *
 * @author ADMIN
 */
public class ChooseAnswerDAO extends DBContext implements BaseDAO<ChooseAnswer> {
     JobDAO jd = new JobDAO();
     QuestionDAO qd = new QuestionDAO();
     AnswerDAO ad = new AnswerDAO();
     JobseekerDAO jsd = new JobseekerDAO();
    @Override
    public List<ChooseAnswer> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ChooseAnswer findById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean insert(ChooseAnswer newObject) {
        String sql = "INSERT INTO [dbo].[ChooseAns]\n"
                + "           ([UserID]\n"
                + "           ,[ChooseAnsID]\n"
                + "           ,[Status])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, newObject.getUser().getIdUser());
            st.setInt(2, newObject.getAnswer().getAnswerID());
            st.setString(3, newObject.getStatus());

            int rowAffect = st.executeUpdate();
            if (rowAffect > 0) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(ChooseAnswerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean update(ChooseAnswer newObject) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public List<ChooseAnswer> getChooseAnswerJobID(int id) {
        List<ChooseAnswer> list = new ArrayList<>();
        String sql = "SELECT * \n"
                + "FROM ChooseAns ca \n"
                + "JOIN Answers a ON ca.ChooseAnsID = a.AnswerID \n"
                + "JOIN Questions q ON a.QuestionID = q.QuestionID \n"
                + "WHERE q.JobID = ? ";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int cid = rs.getInt("ChooseID");
                int uid = rs.getInt("UserID");
                User u = jsd.findById(uid);
                int ChooseAnsID = rs.getInt("ChooseAnsID");
                Answer a = ad.findById(ChooseAnsID);
                String status = rs.getString("Status");
                ChooseAnswer c = new ChooseAnswer(cid, u, a, status);
                list.add(c);
                
                

            }
        } catch (Exception e) {
        }

        return list;
    }
    public List<ChooseAnswer> getChooseAnswerJobIDAndUserID(int jobID, int userID) {
        List<ChooseAnswer> list = new ArrayList<>();
        String sql = "SELECT * \n"
                + "FROM ChooseAns ca \n"
                + "JOIN Answers a ON ca.ChooseAnsID = a.AnswerID \n"
                + "JOIN Questions q ON a.QuestionID = q.QuestionID \n"
                + "WHERE q.JobID = ? AND ca.UserID = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, jobID);
            st.setInt(2, userID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int cid = rs.getInt("ChooseID");
                int uid = rs.getInt("UserID");
                User u = jsd.findById(uid);
                int ChooseAnsID = rs.getInt("ChooseAnsID");
                Answer a = ad.findById(ChooseAnsID);
                String status = rs.getString("Status");
                ChooseAnswer c = new ChooseAnswer(cid, u, a, status);
                list.add(c);
            }
        } catch (Exception e) {
            Logger.getLogger(ChooseAnswerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }
     public int getTotalPointsByJobIDAndUserID(int jobID, int userID) {
        String sql = "SELECT COUNT(*) AS TotalPoints " +
                     "FROM ChooseAns ca " +
                     "JOIN Answers a ON ca.ChooseAnsID = a.AnswerID " +
                     "JOIN Questions q ON a.QuestionID = q.QuestionID " +
                     "WHERE q.JobID = ? AND ca.UserID = ? AND a.is_true = 1 AND ca.Status = 'completed'";
        int totalPoints = 0;

        try (
             PreparedStatement st = getConnection().prepareStatement(sql)) {
            
            st.setInt(1, jobID);
            st.setInt(2, userID);
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
                totalPoints = rs.getInt("TotalPoints");
            }
        } catch (Exception ex) {
            Logger.getLogger(ChooseAnswerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return totalPoints;
    }
     public String getFirstChooseAnswerStatus(int jobID, int userID) {
        String sql = "SELECT TOP 1 ca.Status "
                   + "FROM ChooseAns ca "
                   + "JOIN Answers a ON ca.ChooseAnsID = a.AnswerID "
                   + "JOIN Questions q ON a.QuestionID = q.QuestionID "
                   + "WHERE q.JobID = ? AND ca.UserID = ? "
                   + "ORDER BY ca.ChooseID";
        String status = null;

        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, jobID);
            st.setInt(2, userID);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                status = rs.getString("Status");
            }
        } catch (Exception ex) {
            Logger.getLogger(ChooseAnswerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return status;
    }
     
    public User getUserByChooseAnswerID(int chooseAnswerID) {
        String sql = "SELECT u.* "
                   + "FROM Users u "
                   + "JOIN ChooseAns ca ON u.UserID = ca.UserID "
                   + "WHERE ca.ChooseID = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, chooseAnswerID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int idUser = rs.getInt("UserID");
                String firstName = rs.getString("FirstName");
                String lastName = rs.getString("LastName");
                String email = rs.getString("Email");
                String password = rs.getString("Password");
                int roleID = rs.getInt("RoleID");
                String message = rs.getString("Message");
                String city = rs.getString("City");
                int phoneNumber = rs.getInt("PhoneNumber");
                Date dob = rs.getDate("DateOfBirth");
                String status = rs.getString("Status");
                
                User user = new User(idUser, firstName, lastName, email, password, roleID, message, status, city, "0" + phoneNumber, (java.sql.Date) dob);
                return user;
            }
        } catch (Exception ex) {
            Logger.getLogger(ChooseAnswerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     
   
    public static void main(String[] args) {
        ChooseAnswerDAO chooseAnswerDAO = new ChooseAnswerDAO();
        int chooseAnswerID = 1284; // Sample ChooseAnswerID for testing
        User user = chooseAnswerDAO.getUserByChooseAnswerID(chooseAnswerID);
        
        if (user != null) {
            System.out.println("User ID: " + user.getIdUser());
            System.out.println("First Name: " + user.getFirstName());
            System.out.println("Last Name: " + user.getLastName());
            System.out.println("Email: " + user.getEmail());
            System.out.println("Password: " + user.getPassword());
            System.out.println("Role ID: " + user.getRoleId());
            System.out.println("Message: " + user.getMessage());
            System.out.println("City: " + user.getCityName());
            System.out.println("Phone Number: " + user.getPhoneNumber());
            System.out.println("Date of Birth: " + user.getDate());
            System.out.println("Status: " + user.getStatus());
        } else {
            System.out.println("No user found for the provided ChooseAnswerID.");
        }
    }

}
