/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Apply;
import model.CVProfile;
import model.Category;
import model.Company;
import model.Job;
import model.User;

/**
 *
 * @author DELL
 */
public class JobApplyDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // apply
    public List<Apply> ListApplyByUserId(int uid, String statusApplication) {

        List<Apply> list = new ArrayList<>();
        String sql = "select * from Applications a\n"
                + "join CVProfile cv on cv.CVId = a.CVId\n"
                + "join Jobs j on a.JobID = j.JobID\n"
                + "join CompanyProfile c on j.CompanyID = c.CompanyID\n"
                + "where c.UserID = ? and a.Status = ?  ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.setString(2, statusApplication);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idApp = rs.getInt(1);
                int jobID = rs.getInt(2);
                int CVid = rs.getInt(3);
                Date date = rs.getDate(4);
                String status = rs.getString(5);

                JobDAO jd = new JobDAO();
                Job j = jd.findById(jobID);
                CVDAO cv = new CVDAO();
                CVProfile cp = cv.findByID(CVid);
                Apply a = new Apply(idApp, j, cp, date, status);
                list.add(a);
            }
        } catch (Exception ex) {
        }
        return list;

    }

    public int getTotalApply(int uid, String statusApplication) {
        String query = "select count(*) from Applications a\n"
                + "join CVProfile cv on cv.CVId = a.CVId\n"
                + "join Jobs j on a.JobID = j.JobID\n"
                + "join CompanyProfile c on j.CompanyID = c.CompanyID\n"
                + "where c.UserID = ? and a.Status = ? ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, uid);
            ps.setString(2, statusApplication);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Apply> pagingCVList(int uid, String statusApplication, int index) {
        List<Apply> list = new ArrayList<>();
        String sql = " select * from Applications a\n"
                + "join CVProfile cv on cv.CVId = a.CVId\n"
                + "join Jobs j on a.JobID = j.JobID\n"
                + "join CompanyProfile c on j.CompanyID = c.CompanyID\n"
                + "where c.UserID = ? and a.Status = ?\n"
                + "order by a.ApplicationID\n"
                + "OFFSET ? rows fetch next 2 rows only";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.setString(2, statusApplication);
            ps.setInt(3, (index - 1) * 2);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idApp = rs.getInt(1);
                int jobID = rs.getInt(2);
                int CVid = rs.getInt(3);
                Date date = rs.getDate(4);
                String status = rs.getString(5);
                JobDAO jd = new JobDAO();
                Job j = jd.findById(jobID);
                CVDAO cv = new CVDAO();
                CVProfile cp = cv.findByID(CVid);
                Apply a = new Apply(idApp, j, cp, date, status);
                list.add(a);
            }
        } catch (Exception ex) {

        }
        return list;
    }

    //u
    public User getUserByCVid(int cvid) {

        String sql = "select * from Users u\n"
                + "join CVProfile cv on u.UserID = cv.UserID\n"
                + "where cv.CVId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cvid);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idUser = rs.getInt(1);
                String firstName = rs.getString(2);
                String lastName = rs.getString(3);
                String email = rs.getString(4);
                String password = rs.getString(5);
                int roleID = rs.getInt(6);
                String message = rs.getString(7);
                String city = rs.getString(8);
                String phoneNumber = rs.getString(9);
                Date dob = rs.getDate(10);
                String status = rs.getString(11);
                User u = new User(idUser, firstName, lastName, email, password, roleID, message, status, city, "0" + phoneNumber, dob);
                return u;

            }
        } catch (Exception ex) {
        }
        return null;
    }

    public User getUserByapplyid(int apply) {

        String sql = "select * from Users u\n"
                + "join CVProfile cv on u.UserID = cv.UserID\n"
                + "join Applications a on cv.CVId = a.CVId\n"
                + "where a.ApplicationID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, apply);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idUser = rs.getInt(1);
                String firstName = rs.getString(2);
                String lastName = rs.getString(3);
                String email = rs.getString(4);
                String password = rs.getString(5);
                int roleID = rs.getInt(6);
                String message = rs.getString(7);
                String city = rs.getString(8);
                String phoneNumber = rs.getString(9);
                Date dob = rs.getDate(10);
                String status = rs.getString(11);
                User u = new User(idUser, firstName, lastName, email, password, roleID, message, status, city, "0" + phoneNumber, dob);
                return u;

            }
        } catch (Exception ex) {
        }
        return null;
    }

    //update
    public void accpetCv(String applyid) {
        String query = "Update Applications SET Status = 'Accept' where ApplicationID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, applyid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void rejectCv(String applyid) {
        String query = "Update Applications SET Status = 'Reject' where ApplicationID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, applyid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    //job
    public Job findByApplyId(int applyid) {
        String sql = "select * from jobs j\n"
                + "join Applications a on j.JobID = a.JobID\n"
                + "where a.ApplicationID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, applyid);
            rs = ps.executeQuery();

            while (rs.next()) {
                CompanyDAO com = new CompanyDAO();
                CategoryDAO cd = new CategoryDAO();
                int idJob = rs.getInt(1);
                int idCompany = rs.getInt(2);
                int idCategory = rs.getInt(3);
                String title = rs.getString(4);
                String desc = rs.getString(5);
                int expY = rs.getInt(6);
                String location = rs.getString(7);
                int salary = rs.getInt(8);
                String status = rs.getString(9);
                Date date = rs.getDate(10);
                Company company = com.findById(idCompany);
                Category category = cd.findById(idCategory);
                Job j = new Job(idJob, company, category, title, desc, expY, location, salary, status, date);
                return j;

            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //notification
    public void insertNotificationApprovel(int useId, String mess, int status) {
        String query = "INSERT INTO Notifications( UserID, [Message],ReadStatus)\n"
                + "VALUES (?,?,?);";

        try {
            conn = new DBContext().getConnection();//mo ket noi vs sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, useId);
            ps.setString(2, mess);
            ps.setInt(3, status);
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public List<Apply> ListApplyByUserIdAndJobID(int uid, int jobId) {

        List<Apply> list = new ArrayList<>();
        String sql = "select * from Applications a "
                + "join CVProfile cv on cv.CVId = a.CVId "
                + "join Jobs j on a.JobID = j.JobID "
                + "join CompanyProfile c on j.CompanyID = c.CompanyID "
                + "where c.UserID = ? and a.JobID = ? "
                + "order by a.ApplicationDate DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.setInt(2, jobId);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idApp = rs.getInt(1);
                int jobID = rs.getInt(2);
                int CVid = rs.getInt(3);
                Date date = rs.getDate(4);
                String status = rs.getString(5);

                JobDAO jd = new JobDAO();
                Job j = jd.findById(jobID);
                CVDAO cv = new CVDAO();
                CVProfile cp = cv.findByID(CVid);
                Apply a = new Apply(idApp, j, cp, date, status);
                list.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public Apply getApplicationByUserIdAndJobId(int applicantUserId, int jobId) {
        Apply application = null;
        String sql = "select * from Applications a "
                + "join CVProfile cv on cv.CVId = a.CVId "
                + "join Jobs j on a.JobID = j.JobID "
                + "where cv.UserID = ? and a.JobID = ? "
                + "order by a.ApplicationDate DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, applicantUserId);
            ps.setInt(2, jobId);
            rs = ps.executeQuery();
            if (rs.next()) {
                int idApp = rs.getInt(1);
                int jobID = rs.getInt(2);
                int CVid = rs.getInt(3);
                Date date = rs.getDate(4);
                String status = rs.getString(5);

                JobDAO jd = new JobDAO();
                Job j = jd.findById(jobID);
                CVDAO cv = new CVDAO();
                CVProfile cp = cv.findByID(CVid);
                application = new Apply(idApp, j, cp, date, status);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return application;
    }

    public static void main(String[] args) {
        JobApplyDAO dao = new JobApplyDAO();
        List<Apply> j = dao.pagingCVList(2, "Pending", 1);
        Job a = dao.findByApplyId(1003);
        System.out.println(a);
        for (Apply cVProfile : j) {
            System.out.println(cVProfile);
        }
    }
}
