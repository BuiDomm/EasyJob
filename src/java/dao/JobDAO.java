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
import model.Category;
import model.Company;
import model.Job;
import model.User;

/**
 *
 * @author ASUS
 */
public class JobDAO extends DBContext implements BaseDAO<Job> {
    
    CompanyDAO com = new CompanyDAO();
    CategoryDAO cd = new CategoryDAO();
    
    @Override
    public List<Job> getAll() {
        List<Job> list = new ArrayList<>();
        String sql = "SELECT * FROM jobs";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
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
                list.add(j);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    @Override
    public Job findById(int id) {
        String sql = "Select * from jobs\n"
                + "where JobID = ? ";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
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
    
    public List<Job> findByIdUser(int id) {
        List<Job> list = new ArrayList<>();
        String sql = "SELECT * FROM jobs\n"
                + "Join CompanyProfile as CM on CM.CompanyID = jobs.CompanyID\n"
                + "JOIN Users as u on u.UserID = CM.UserID\n"
                + "Where u.UserID = ? ";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
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
                list.add(j);
                
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public int getPageNumber() {
        
        String sql = "Select count(*) as countjob from jobs";
        
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int count = rs.getInt(1);
                int numberpage = 0;
                numberpage = count / 12;
                if (count % 12 != 0) {
                    numberpage = numberpage + 1;
                }
                return numberpage;
                
            }
            
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public List<Job> getTop3() {
        List<Job> list = new ArrayList<>();
        String sql = "SElect TOP 3  * FROM Jobs\n"
                + "Order by JobID DESC";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
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
                list.add(j);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<Job> getAllFollowPage(int num) {
        List<Job> list = new ArrayList<>();
        CategoryDAO cd = new CategoryDAO();
        String sql = "Select * from jobs\n"
                + "	order by JobID\n"
                + "	offset ? rows \n"
                + "	fetch first 12 rows only";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, (num - 1) * 12);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
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
                
                list.add(j);
            }
            
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    @Override
    public boolean insert(Job newObject) {
        String sql = "	Insert Into Jobs(CompanyID,CategoryID,Title,Description,ExperienceYears,Location,Salary,Status) \n"
                + "	Values(?,?,?,?,?,?,?,?)";
        PreparedStatement ps;
        try {
            ps = getConnection().prepareStatement(sql);
            ps.setInt(1, newObject.getCompany().getCompanyID());
            ps.setInt(2, newObject.getCategory().getCategoryID());
            ps.setString(3, newObject.getTitle());
            ps.setString(4, newObject.getDescrip());
            ps.setInt(5, newObject.getYearEx());
            ps.setString(6, newObject.getLocation());
            ps.setInt(7, newObject.getSalary());
            ps.setString(8, newObject.getStatus());
            int rowAffect = ps.executeUpdate();
            if (rowAffect > 0) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
        
    }
    
    @Override
    public boolean update(Job newObject) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
