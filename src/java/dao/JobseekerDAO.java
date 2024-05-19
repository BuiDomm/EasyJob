/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author ASUS
 */
public class JobseekerDAO extends DBContext implements BaseDAO<User> {

    @Override
    public List<User> getAll() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM Users";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idUser = rs.getInt(1);
                String firstName = rs.getString(2);
                String lastName = rs.getString(3);
                String email = rs.getString(4);
                String password = rs.getString(5);
                int roleID = rs.getInt(6);
                String message = rs.getString(7);
                String status = rs.getString(8);
                User u = new User(idUser, firstName, lastName, email, password, roleID, message, status);
                list.add(u);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public User findById(int id) {
        String sql = "SELECT * FROM Users \n"
                + "Where UserID =? ";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idUser = rs.getInt(1);
                String firstName = rs.getString(2);
                String lastName = rs.getString(3);
                String email = rs.getString(4);
                String password = rs.getString(5);
                int roleID = rs.getInt(6);
                String message = rs.getString(7);
                String status = rs.getString(8);
                User u = new User(idUser, firstName, lastName, email, password, roleID, message, status);
                return u;

            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean insert(User newObject) {
        String sql = "Insert Into Users(FirstName,LastName,Email,Password,RoleID)\n"
                + "Values (?,?,?,?,?)";
        PreparedStatement ps;
        try {
            ps = getConnection().prepareStatement(sql);
            ps.setString(1, newObject.getFirstName());
            ps.setString(2, newObject.getLastName());
            ps.setString(3, newObject.getEmail());
            ps.setString(4, newObject.getPassword());
            ps.setInt(5,newObject.getRoleId() );
            int rowAffect = ps.executeUpdate();
            if (rowAffect > 0) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public User fogortPass(String email) {
        String sql = "SELECT * FROM Users\n"
                + "Where Email = ?";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idUser = rs.getInt(1);
                User u = findById(idUser);
                if (u != null) {
                    return u;
                }

            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public boolean changePass(int idUser, String password) {
        String sql = "Update Users\n"
                + "		set Password = ?\n"
                + "		Where UserID = ?";
        User u = findById(idUser);
        PreparedStatement ps;
        try {
            ps = getConnection().prepareStatement(sql);
            ps.setString(1, password);
            ps.setInt(2, u.getIdUser());

            int rowAffect = ps.executeUpdate();
            if (rowAffect > 0) {

                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    public User loginAcount(String email, String pass) {

        String sql = "Select * from Users Where Email =? AND Password = ?";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8)
                );
            }
        } catch (Exception e) {

        }
        return null;
    }

    @Override
    public boolean update(User newObject) {
        String sql = "Update Users \n"
                + "set FirstName = ?,\n"
                + "LastName = ? , \n"
                + "Password = ? \n"
                + "Where UserID = ?";

        PreparedStatement ps;
        try {
            ps = getConnection().prepareStatement(sql);
            ps.setString(1, newObject.getFirstName());
            ps.setString(2, newObject.getLastName());
            ps.setString(3, newObject.getPassword());
            ps.setInt(4, newObject.getIdUser());

            int rowAffect = ps.executeUpdate();
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

}