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
        String sql = "SELECT * FROM Applications\n"
                + "Where ApplicationID =? ";
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
                return a;
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Apply> findListByIdCV(int id) {

        List<Apply> list = new ArrayList<>();
        String sql = "	SELECT * FROM Applications\n"
                + "Where CVid =? ORDER BY ApplicationDate DESC";
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
        String updateNumberJobApply = "UPDATE CVProfile SET Number = Number - 1 WHERE CVId = ?";
        PreparedStatement ps;
        try {
            ps = getConnection().prepareStatement(sql);
            ps.setInt(1, newObject.getJob().getJobID());
            ps.setInt(2, newObject.getCvProfile().getCVId());
            ps.setString(3, newObject.getStatus());
            int rowAffect = ps.executeUpdate();
            if (rowAffect > 0) {
                ps = getConnection().prepareStatement(updateNumberJobApply);
                ps.setInt(1, newObject.getCvProfile().getCVId());
                ps.executeUpdate();
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(ApplyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public int countApplicationsByCompanyId(int companyId) {
        String sql = "SELECT COUNT(*) AS ApplicationCount FROM Applications A "
                + "JOIN Jobs J ON A.JobID = J.JobID "
                + "WHERE J.CompanyID = ?";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, companyId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("ApplicationCount");
            }
        } catch (Exception ex) {
            Logger.getLogger(ApplyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int countApplicationsByMonthAndYear(int year, int month, int companyId) {
        String sql = "SELECT COUNT(ApplicationID) AS NumberOfApplications\n"
                + "FROM Applications A\n"
                + "JOIN Jobs J ON A.JobID = J.JobID\n"
                + "WHERE DATEPART(YEAR, ApplicationDate) = ?\n"
                + "AND DATEPART(MONTH, ApplicationDate) = ?\n"
                + "AND J.CompanyID = ?";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, year);
            ps.setInt(2, month);
            ps.setInt(3, companyId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("NumberOfApplications");
            }
        } catch (Exception e) {
            Logger.getLogger(ApplyDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return 0;
    }

    public List<Apply> searchCVAppliApply(int cvProfileID, String keywwordString) {
        List<Apply> list = new ArrayList<>();
        String sql = "SELECT a.*\n"
                + "FROM Applications a\n"
                + "JOIN Jobs j ON a.JobID = j.JobID\n"
                + "JOIN Categories c ON j.CategoryID = c.CategoryID\n"
                + "WHERE a.CVId = ? AND (\n"
                + "    CAST(a.CVId AS CHAR) LIKE ?\n"
                + "    OR j.Title LIKE ?\n"
                + "    OR CAST(a.ApplicationDate AS CHAR) LIKE ?\n"
                + "    OR a.Status LIKE ?\n"
                + "    OR c.CategoryName LIKE ?\n"
                + ")";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            String searchPattern = "%" + keywwordString + "%";
            ps.setInt(1, cvProfileID);
            ps.setString(2, searchPattern);
            ps.setString(3, searchPattern);
            ps.setString(4, searchPattern);
            ps.setString(5, searchPattern);
            ps.setString(6, searchPattern);

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

    @Override
    public boolean update(Apply newObject) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE Applications \n"
                + "Where ApplicationID =?";
        PreparedStatement ps;
        try {
            ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            int rowAffect = ps.executeUpdate();
            if (rowAffect > 0) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(CVDAO.class.getName()).log(Level.SEVERE, null, ex);

        }

        return false;
    }

    public boolean deleteByIDJobAndIDCvProfile(int idjob, int idCvProfile) {
        String sql = "DELETE Applications \n"
                + "Where JobID =? AND CVId = ?";
        PreparedStatement ps;
        try {
            ps = getConnection().prepareStatement(sql);
            ps.setInt(1, idjob);
            ps.setInt(2, idCvProfile);

            int rowAffect = ps.executeUpdate();
            if (rowAffect > 0) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(ApplyDAO.class.getName()).log(Level.SEVERE, null, ex);

        }

        return false;
    }

    public static void main(String[] args) {
        ApplyDAO ap = new ApplyDAO();
        System.out.println(ap.searchCVAppliApply(7, "2024-06-15").size());
    }

}
