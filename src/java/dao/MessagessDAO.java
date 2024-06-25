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
import javax.mail.Message;
import model.Category;
import model.Company;
import model.Job;
import model.Messagess;
import model.User;

/**
 *
 * @author DELL
 */
public class MessagessDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

//    account
    public User findById(int id) {
        String sql = "SELECT * FROM Users \n"
                + "Where UserID = ? ";
        try {

            conn = new DBContext().getConnection();//mo ket noi vs sql
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
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
                User u = new User(idUser, firstName, lastName, email, password, roleID, message, status, city, phoneNumber, dob);
                return u;
            }
        } catch (Exception ex) {

        }
        return null;
    }
// truy vấn để lấy ra message mới được create thôi

    public Messagess getLastMessageThroughTwoFriendId(int SenderId, int ReceiverId) {
        String query = "select top 1 * from Messagess where (SenderID = ? and ReceiverID= ?)\n"
                + "order by SentTime desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi vs sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, SenderId);
            ps.setInt(2, ReceiverId);
            rs = ps.executeQuery();

            while (rs.next()) {
                return new Messagess(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5));

            }
        } catch (Exception e) {
        }

        return null;

    }
//insert new message

    public void InsertMessage(int sendId, int receiverId, String date, String content) {

        String query = "INSERT INTO Messagess (SenderID, ReceiverID, SentTime,Message)\n"
                + "VALUES (?,?,?,?);";
        try {
            conn = new DBContext().getConnection();//mo ket noi vs sql
            ps = conn.prepareStatement(query);
            // Set parameters
            ps.setInt(1, sendId);
            ps.setInt(2, receiverId);
            ps.setString(3, date);
            ps.setString(4, content);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

//    public List<Messagess> getnewMessagesses(int ReceiverID) {
//        List<Messagess> listM = new ArrayList<>();
//        String query = "SELECT TOP 3 M1.*\n"
//                + "FROM Messagess M1\n"
//                + "JOIN (   SELECT SenderID, MAX(SentTime) AS LatestTimestamp\n"
//                + " FROM Messagess\n"
//                + " WHERE ReceiverID = ? \n"
//                + " GROUP BY SenderID\n"
//                + ") AS M2 ON M1.SenderID = M2.SenderID AND M1.SentTime = M2.LatestTimestamp\n"
//                + "ORDER BY M1.SentTime DESC;";
//        try {
//            conn = new DBContext().getConnection();//mo ket noi vs sql
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, ReceiverID);
//            rs = ps.executeQuery();
//
//            while (rs.next()) {
//                listM.add(new Messagess(
//                        rs.getInt(1),
//                        rs.getInt(2),
//                        rs.getInt(3),
//                        rs.getString(4),
//                        rs.getString(5)));
//
//            }
//        } catch (Exception e) {
//        }
//
//        return listM;
//
//    }
    public List<Messagess> getMessBySendReceiver(int SenderId, int ReceiverId) {
        List<Messagess> listM = new ArrayList<>();
        String query = "select * from Messagess\n"
                + "WHERE SenderID = ? and ReceiverID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi vs sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, SenderId);
            ps.setInt(2, ReceiverId);
            rs = ps.executeQuery();

            while (rs.next()) {
                listM.add(new Messagess(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5)));

            }
        } catch (Exception e) {
        }

        return listM;

    }

    public List<User> getListAccountBySenderID(int SenderId) {
        List<User> listA = new ArrayList<>();
        String query = "WITH SentMessages AS (\n"
                //Truy vấn này chọn các tin nhắn mà ReceiverID là giá trị tham số truyền vào và sắp xếp theo thời gian
                + " SELECT DISTINCT M.SenderID AS AccountID, MAX(M.SentTime) AS LatestMessageTime\n"
                + "FROM Messagess M\n"
                + "  WHERE M.ReceiverID = ?\n"
                + " GROUP BY M.SenderID)"
                //Truy vấn này chọn các tin nhắn mà SenderID là giá trị tham số truyền vào và sắp xếp theo thời gian
                + ",ReceivedMessages AS (  SELECT DISTINCT M.ReceiverID AS AccountID, MAX(M.SentTime) AS LatestMessageTime\n"
                + " FROM Messagess M\n"
                + "  WHERE M.SenderID = ?\n"
                + "   GROUP BY M.ReceiverID),"
                + "Combined AS ( " //Truy vấn kết hợp SentMessages và ReceivedMessages chọn ra max last time nhóm lại bằng account id
                + "  SELECT AccountID, MAX(LatestMessageTime) AS LatestMessageTime\n"
                + "   FROM (     SELECT AccountID, LatestMessageTime FROM SentMessages\n"
                + "   UNION ALL\n"
                + "   SELECT AccountID, LatestMessageTime FROM ReceivedMessages\n"
                + " ) AS SubQuery GROUP BY AccountID)\n"
                + "SELECT A.*\n" // đoạn này in ra
                + "FROM Users A\n"
                + "JOIN Combined C ON A.UserID = C.AccountID\n"
                + "ORDER BY C.LatestMessageTime DESC;";
        try {
            conn = new DBContext().getConnection();//mo ket noi vs sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, SenderId);
            ps.setInt(2, SenderId);
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
                listA.add(u);
            }
        } catch (Exception e) {
        }

        return listA;
    }

    // company
    public int getEmployIdByJobId(int jobid) {
        String query = "select * from CompanyProfile cp\n"
                + "join Jobs j on cp.CompanyID = j.CompanyID\n"
                + "where j.JobID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi vs sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, jobid);
            rs = ps.executeQuery();
            JobseekerDAO j = new JobseekerDAO();
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
                int employerId = c.getUser().getIdUser();
                return employerId;
            }
        } catch (Exception e) {
        }

        return 0;

    }

    public List<User> searchByName(int idSender, String name) {
        List<User> list = new ArrayList<>();
        JobseekerDAO jd = new JobseekerDAO();
        String sql = "WITH SentMessages AS (\n"
                + "    SELECT DISTINCT M.SenderID AS AccountID, MAX(M.SentTime) AS LatestMessageTime\n"
                + "    FROM Messagess M\n"
                + "    WHERE M.ReceiverID = ?\n"
                + "    GROUP BY M.SenderID\n"
                + "),\n"
                + "ReceivedMessages AS (\n"
                + "    SELECT DISTINCT M.ReceiverID AS AccountID, MAX(M.SentTime) AS LatestMessageTime\n"
                + "    FROM Messagess M\n"
                + "    WHERE M.SenderID = ?\n"
                + "    GROUP BY M.ReceiverID\n"
                + "),\n"
                + "Combined AS (\n"
                + "    SELECT AccountID, MAX(LatestMessageTime) AS LatestMessageTime\n"
                + "    FROM (\n"
                + "        SELECT AccountID, LatestMessageTime FROM SentMessages\n"
                + "        UNION ALL\n"
                + "        SELECT AccountID, LatestMessageTime FROM ReceivedMessages\n"
                + "    ) AS SubQuery\n"
                + "    GROUP BY AccountID\n"
                + "),\n"
                + "UsersMessaged AS (\n"
                + "    SELECT DISTINCT\n"
                + "        U.UserID,\n"
                + "        U.FirstName,\n"
                + "        U.LastName\n"
                + "    FROM Messagess M\n"
                + "    JOIN Users U ON M.ReceiverID = U.UserID\n"
                + "    WHERE M.SenderID = ?\n"
                + "    AND (\n"
                + "        (? IS NULL OR U.FirstName LIKE ?)\n"
                + "        OR (? IS NULL OR U.LastName LIKE ?)\n"
                + "    )\n"
                + ")\n"
                + "SELECT UM.UserID, UM.FirstName, UM.LastName\n"
                + "FROM UsersMessaged UM\n"
                + "JOIN Combined C ON UM.UserID = C.AccountID\n"
                + "ORDER BY C.LatestMessageTime DESC, UM.FirstName, UM.LastName;";

        try {
            conn = new DBContext().getConnection();//mo ket noi vs sql
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idSender);
            ps.setInt(2, idSender);
            ps.setInt(3, idSender);
            ps.setString(4, name != null ? name : null);
            ps.setString(5, name != null ? "%" + name + "%" : null);
            ps.setString(6, name != null ? name : null);
            ps.setString(7, name != null ? "%" + name + "%" : null);

            rs = ps.executeQuery();

            while (rs.next()) {
                int idUser = rs.getInt(1);
                User u = jd.findById(idUser);
                list.add(u);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public MessagessDAO() {
    }

    public static void main(String[] args) {
        MessagessDAO dao = new MessagessDAO();
//        List<Messagess> list = dao.getMessBySendReceiver(1, 2);
//        for (Messagess m : list) {
//            System.out.println(m.getTimestamp());
//        }
//        List<User> list = dao.searchByName(1, "");
//        for (User u : list) {
////            System.out.println(u);
//        }
        System.out.println(dao.searchByName(1, "dung"));

    }
}
