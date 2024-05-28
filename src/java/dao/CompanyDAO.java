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
                String status = rs.getString(5);
                String url = rs.getString(6);
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
                String status = rs.getString(5);
                String url = rs.getString(6);
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

    @Override
    public boolean insert(Company newObject) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean update(Company newObject) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
