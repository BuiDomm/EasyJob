/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Apply;
import model.CVProfile;
import model.Job;

/**
 *
 * @author ASUS
 */
public class ApplyDAO extends DBContext implements BaseDAO<Apply> {

    @Override
    public List<Apply> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Apply findById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public List<Apply> findListByIdCV(int id) {

        List<Apply> list = new ArrayList<>();
        String sql = "	SELECT * FROM Applications\n"
                + "Where CVid =?";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
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
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

    public Apply findByJobIDAndCvID(int job, int cv) {

        String sql = "SELECT * FROM Applications\n"
                + "Where JobID =? and CVId = ?";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, job);
            ps.setInt(2, cv);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idApp = rs.getInt(1);
                int jobID = rs.getInt(2);
                int CVid = rs.getInt(3);
                Date date = rs.getDate(4);
                String status = rs.getString(5);
                JobDAO jd = new JobDAO();
                Job j = jd.findById(jobID);
                CVDAO cvd = new CVDAO();
                CVProfile cp = cvd.findByID(CVid);
                Apply a = new Apply(idApp, j, cp, date, status);
                return a;
            }
        } catch (Exception ex) {
            Logger.getLogger(ApplyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean insert(Apply newObject) {

        String sql = "INSERT INTO Applications(JobID,CVId,ApplicationDate,Status)\n"
                + "Values(?,?,GETDATE(),?)";
        PreparedStatement ps;
        try {
            ps = getConnection().prepareStatement(sql);
            ps.setInt(1, newObject.getJob().getJobID());
            ps.setInt(2, newObject.getCvProfile().getCVId());
            ps.setString(3, newObject.getStatus());
            int rowAffect = ps.executeUpdate();
            if (rowAffect > 0) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(ApplyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean update(Apply newObject) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public static void main(String[] args) {
        ApplyDAO ap = new ApplyDAO();
    }

}
