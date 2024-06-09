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
import model.Apply;
import model.CVProfile;
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
    public List<Apply> ListApplyByUserId(int uid) {

        List<Apply> list = new ArrayList<>();
        String sql = "	select * from Applications a\n"
                + "join CVProfile cv on cv.CVId = a.CVId\n"
                + "join Jobs j on a.JobID = j.JobID\n"
                + "join CompanyProfile c on j.CompanyID = c.CompanyID\n"
                + "where c.UserID = ? ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);
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

    public static void main(String[] args) {
        JobApplyDAO dao = new JobApplyDAO();
        List<Apply> j = dao.ListApplyByUserIdAndJobID(23, 8);
        for (Apply cVProfile : j) {
            System.out.println(cVProfile);
        }
    }
}
