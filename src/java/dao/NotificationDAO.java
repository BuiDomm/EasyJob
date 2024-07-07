/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Notification;

/**
 *
 * @author DELL
 */
public class NotificationDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Notification> getListNotificationsesByAccount(String accountID) {
        List<Notification> listN = new ArrayList<>();
        String query = "select * from Notifications\n"
                + "where UserID = ?\n"
                + "order by Time desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi vs sql
            ps = conn.prepareStatement(query);
            ps.setString(1, accountID);
            rs = ps.executeQuery();

            while (rs.next()) {
                listN.add(new Notification(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5)));

            }
        } catch (Exception e) {
        }

        return listN;

    }

    public List<Notification> getNewNotificationsesByAccount(int accountID) {
        List<Notification> listN = new ArrayList<>();
        String query = "SELECT TOP 3 *\n"
                + "from Notifications\n"
                + " where UserID = ?\n"
                + "order by Time desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi vs sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            rs = ps.executeQuery();

            while (rs.next()) {
                listN.add(new Notification(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5)));

            }
        } catch (Exception e) {
        }

        return listN;

    }

    public int getNumberNewNotificationses(int accountID) {
        String query = "SELECT COUNT(*)\n"
                + "FROM Notifications\n"
                + "where UserID = ? and ReadStatus = 1";
        try {
            conn = new DBContext().getConnection();//mo ket noi vs sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }

        return 0;

    }

    public void readAll(String accountID) {
        String query = "UPDATE Notifications\n"
                + "SET ReadStatus = 0\n"
                + "where UserID = ? ";

        try {
            conn = new DBContext().getConnection();//mo ket noi vs sql
            ps = conn.prepareStatement(query);
            ps.setString(1, accountID);
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public int getTotalNotification(int uid) {
        String query = "SELECT count(*) FROM Notifications";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, uid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Notification> pagingNewNotificationsesByAccount(int index, int accountID) {
        List<Notification> list = new ArrayList<>();
        String sql = "select * from Notifications\n"
                + "where UserID = ?\n"
                + "order by Time desc\n"
                + "OFFSET ? rows fetch next 4 rows only";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, accountID);
            ps.setInt(2, (index - 1) * 4);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Notification(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5)));
            }
        } catch (Exception ex) {

        }
        return list;
    }

    public static void main(String[] args) {
        NotificationDAO dao = new NotificationDAO();
        List<Notification> a = dao.getListNotificationsesByAccount("1");
        for (Notification notification : a) {
            System.out.println(notification);
        }

    }

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
}
