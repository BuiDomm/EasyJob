/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Company;
import model.Job;
import model.User;

/**
 *
 * @author ASUS
 */
public class CompanyDAO extends DBContext implements BaseDAO<Company> {

    @Override
    public List<Company> getAll() {
        List<Company> list = new ArrayList<>();
        String sql = "SELECT * FROM CompanyProfile";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idCompany = rs.getInt(1);
                String nameCompany = rs.getString(2);
                int idUser = rs.getInt(3);
                String aboutUs = rs.getString(4);
                String add = rs.getString(5);
                String status = rs.getString(6);
                String url = rs.getString(7);
                JobseekerDAO jd = new JobseekerDAO();
                User user = jd.findById(idUser);
                Company c = new Company(idCompany, nameCompany, user, aboutUs, add, status, url);
                list.add(c);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public Company findById(int id) {
        String sql = "Select * from CompanyProfile\n"
                + "Where CompanyID = ? ";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idCompany = rs.getInt(1);
                String nameCompany = rs.getString(2);
                int idUser = rs.getInt(3);
                String aboutUs = rs.getString(4);
                String add = rs.getString(5);
                String status = rs.getString(6);
                String url = rs.getString(7);
                JobseekerDAO jd = new JobseekerDAO();
                User user = jd.findById(idUser);
                Company c = new Company(idCompany, nameCompany, user, aboutUs, add, status, url);
                return c;
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Company findByUserId(int id) {
        String sql = "Select * from CompanyProfile\n"
                + "Where UserID = ? ";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idCompany = rs.getInt(1);
                String nameCompany = rs.getString(2);
                int idUser = rs.getInt(3);
                String aboutUs = rs.getString(4);
                String add = rs.getString(5);
                String status = rs.getString(6);
                String url = rs.getString(7);
                JobseekerDAO jd = new JobseekerDAO();
                User user = jd.findById(idUser);
                Company c = new Company(idCompany, nameCompany, user, aboutUs, add, status, url);
                return c;
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Company findCompanyByUserId(int userid) {
        JobseekerDAO j = new JobseekerDAO();
        String sql = "SELECT *FROM CompanyProfile where USERID = ?;";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, userid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int companyID = rs.getInt("CompanyID");
                String companyName = rs.getString("CompanyName");
                int userID = rs.getInt("UserID");
                String aboutUs = rs.getString("AboutUs");
                String address = rs.getString("Address");
                String status = rs.getString("Status");
                String url = rs.getString("Url");
                User user = j.findById(userID);
                Company company = new Company(companyID, companyName, user, aboutUs, address, status, url);
                return company;

            }
        } catch (Exception e) {
        }
        return null;
    }

    public boolean isCompanyNameExists(String name) {
        String sql = "SELECT * FROM CompanyProfile WHERE LOWER(CompanyName) = LOWER(?)";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean insert(Company company) {
        String sql = "INSERT INTO [dbo].[CompanyProfile]\n"
                + "           ([CompanyName]\n"
                + "           ,[UserID]\n"
                + "           ,[AboutUs]\n"
                + "           ,[Address]\n"
                + "           ,[Status]\n"
                + "           ,[Url])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, company.getNameCompany());
            st.setInt(2, company.getUser().getIdUser());
            st.setString(3, company.getAboutUS());
            st.setString(4, company.getAdd());
            st.setString(5, company.getStatus());
            st.setString(6, company.getUrl());

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
    public boolean update(Company company) {
        String sql = "UPDATE [dbo].[CompanyProfile]\n"
                + "   SET [CompanyName] = ?\n"
                + "      ,[AboutUs] = ?\n"
                + "      ,[Address] = ?\n"
                + "      ,[Status] = ?\n"
                + "      ,[Url] = ?\n"
                + " WHERE CompanyID=?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, company.getNameCompany());

            st.setString(2, company.getAboutUS());
            st.setString(3, company.getAdd());
            st.setString(4, company.getStatus());
            st.setString(5, company.getUrl());
            st.setInt(6, company.getCompanyID());
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

    public Company findCompanyByIdJob(int id) {
        JobseekerDAO j = new JobseekerDAO();
        String sql = "Select * FROM CompanyProfile\n"
                + "JOIN Jobs as J On J.CompanyID = CompanyProfile.CompanyID\n"
                + "Where J.JobID = ?;";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int companyID = rs.getInt("CompanyID");
                String companyName = rs.getString("CompanyName");
                int userID = rs.getInt("UserID");
                String aboutUs = rs.getString("AboutUs");
                String address = rs.getString("Address");
                String status = rs.getString("Status");
                String url = rs.getString("Url");
                User user = j.findById(userID);
                Company company = new Company(companyID, companyName, user, aboutUs, address, status, url);
                return company;

            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Company> getTop3() {
        List<Company> list = new ArrayList<>();
        String sql = "SElect TOP 3  * FROM CompanyProfile\n"
                + "JOIN Jobs as J on j.CompanyID = CompanyProfile.CompanyID Where J.Status = 'Accept'\n"
                + "Order by JobID DESC";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idCompany = rs.getInt(1);
                String nameCompany = rs.getString(2);
                int idUser = rs.getInt(3);
                String aboutUs = rs.getString(4);
                String add = rs.getString(5);
                String status = rs.getString(6);
                String url = rs.getString(7);
                JobseekerDAO jd = new JobseekerDAO();
                User user = jd.findById(idUser);
                Company c = new Company(idCompany, nameCompany, user, aboutUs, add, status, url);
                list.add(c);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
