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
import model.User;

/**
 *
 * @author DELL
 */
public class AdminDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public int getTotalUser() {
        String query = "select count(*) from Users";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<User> pagingAccount(int index) {
        List<User> list = new ArrayList<>();
        String sql = " select * from Users\n"
                + "order by UserID\n"
                + "OFFSET ? rows fetch next 10 rows only";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, index);
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
                list.add(u);
            }
        } catch (Exception ex) {

        }
        return list;
    }

    public List<User> getAll() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM Users\n"
                + "where UserID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
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
                list.add(u);
            }
        } catch (Exception ex) {

        }
        return list;
    }
    
    
     public void lockAccount(String userId) {
        String query = "UPDATE Users SET Status = 'Lock' WHERE UserID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } 
    }
     
      public void unlockAccount(String userId) {
        String query = "UPDATE Users\n"
                + "SET Status = 'Active'\n"
                + "WHERE UserID = ?;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } 
    }

    public static void main(String[] args) {
        AdminDAO dao = new AdminDAO();
//        dao.lockAccount("2");
        List<User> a = dao.pagingAccount(0);

        for (User users : a) {
            System.out.println(users);
        }

    }

}
