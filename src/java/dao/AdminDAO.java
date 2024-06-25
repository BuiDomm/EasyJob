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
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Category;
import model.Company;
import model.Job;
import model.Statistic;
import model.User;

/**
 *
 * @author DELL
 */
public class AdminDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    CompanyDAO com = new CompanyDAO();
    CategoryDAO cd = new CategoryDAO();

    //user
    public int getTotalUser() {
        String query = "select count(*) from Users WHERE RoleID <> 1\n";
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

    public int getTotalUserByRoll(int rollid) {
        String query = "select count(*) from Users\n"
                + "WHERE RoleID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, rollid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int getAccountByStatus(String status) {
        String query = "select count(*) from Users\n"
                + "WHERE Status = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<User> pagingAccount(int index, int rollid) {
        List<User> list = new ArrayList<>();
        String sql = " select * from Users\n"
                + "  where RoleID = ?\n"
                + " order by UserID\n"
                + "OFFSET ? rows fetch next 4 rows only";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, rollid);
            ps.setInt(2, (index - 1) * 4);
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

    //job
    public List<Job> pagingJobsByStatus(int index, String statusString) {
        List<Job> list = new ArrayList<>();
        String sql = " select * from Jobs j\n"
                + " where j.Status =  ?\n"
                + "order by JobID\n"
                + "OFFSET ? rows fetch next 4 rows only";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, statusString);
            ps.setInt(2, (index - 1) * 4);
            rs = ps.executeQuery();
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

        }
        return list;
    }

    public int getTotalJob() {
        String query = "select count(*) from Jobs\n";
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

    public int getNumberJobStatus(String statusString) {
        String query = "SELECT count(*) FROM jobs j\n"
                + "where j.Status =  ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, statusString);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Job> getJobByStatus(String statusString) {
        List<Job> list = new ArrayList<>();
        String sql = "SELECT * FROM jobs j\n"
                + "where j.Status =  ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, statusString);
            rs = ps.executeQuery();
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

    //company
    public int getTotalCompany() {
        String query = "select count(*) from CompanyProfile cp\n";
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

    public Company companyByJobId(int id) {
        String sql = "select * from CompanyProfile cp\n"
                + "join Jobs j on cp.CompanyID = j.CompanyID\n"
                + "where j.JobID = ? ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
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

    public void accpetJob(String jobid) {
        String query = "Update Jobs SET Status = 'Accept' where JobID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, jobid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void rejectJob(String jobid) {
        String query = "Update Jobs SET Status = 'Reject' where JobID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, jobid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // statistic
    public List<Statistic> getJobByMonth() {
        List<Statistic> list = new ArrayList<>();
        String sql = "WITH Months AS (\n"
                + "    SELECT 1 AS Month UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL\n"
                + "    SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL\n"
                + "    SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL\n"
                + "    SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12\n"
                + ")\n"
                + "SELECT\n"
                + "    NULL AS Year,\n"
                + "    m.Month,\n"
                + "    COALESCE(COUNT(j.Date), 0) AS JobCount\n"
                + "FROM Months m\n"
                + "LEFT JOIN Jobs j ON m.Month = MONTH(j.Date) AND YEAR(j.Date) = 2024\n"
                + "GROUP BY m.Month\n"
                + "ORDER BY m.Month;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int year = rs.getInt(1);
                int month = rs.getInt(2);
                int countJob = rs.getInt(3);
                Statistic j = new Statistic(year, month, countJob);
                list.add(j);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
public Map<Job, Integer> getTopJobWithApplyCount(String period) {
    Map<Job, Integer> accountPurchaseCountMap = new LinkedHashMap<>();
    String dateFilter = "";

    switch (period.toLowerCase()) {
        case "week" -> dateFilter = "AND DATEPART(week, A.ApplicationDate) = DATEPART(week, GETDATE())";
        case "month" -> dateFilter = "AND DATEPART(month, A.ApplicationDate) = DATEPART(month, GETDATE())";
        case "year" -> dateFilter = "AND DATEPART(year, A.ApplicationDate) = DATEPART(year, GETDATE())";
        default -> throw new IllegalArgumentException("Invalid period specified. Use 'week', 'month', or 'year'.");
    }

    String query = "SELECT TOP 5 J.Title, J.[Location], J.Salary, COUNT(*) AS ApplyCount\n"
            + " FROM Jobs J JOIN Applications A ON J.JobID = A.JobID\n"
            + " WHERE J.Status = 'Accept' " + dateFilter + "\n"
            + " GROUP BY J.Title, J.[Location], J.Salary\n"
            + " ORDER BY ApplyCount DESC";

    try {
        conn = new DBContext().getConnection(); // Open connection to SQL
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();

        while (rs.next()) {
            String title = rs.getString("Title");
            String location = rs.getString("Location");
            int salary = rs.getInt("Salary");
            int applyCount = rs.getInt("ApplyCount");

            // Debugging statements
            System.out.println("Title: " + title + ", Location: " + location + ", Salary: " + salary + ", ApplyCount: " + applyCount);

            Job job = new Job(title, location, salary);
            accountPurchaseCountMap.put(job, applyCount);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return accountPurchaseCountMap;
}

//    public Map<Job, Integer> getTopJobWithApplyCount() {
//        Map<Job, Integer> accountPurchaseCountMap = new LinkedHashMap<>();
//        String query = "SELECT TOP 5 J.Title, J.[Location], J.Salary, COUNT(*) AS ApplyCount\n"
//                + " FROM Jobs J JOIN Applications A ON J.JobID = A.JobID\n"
//                + " WHERE J.Status = 'Accept'\n"
//                + " GROUP BY J.Title, J.[Location], J.Salary\n"
//                + " ORDER BY ApplyCount DESC";
//        try {
//            conn = new DBContext().getConnection(); // Open connection to SQL
//            ps = conn.prepareStatement(query);
//            rs = ps.executeQuery();
//
//            while (rs.next()) {
//                String title = rs.getString("Title");
//                String location = rs.getString("Location");
//                int salary = rs.getInt("Salary");
//                int applyCount = rs.getInt("ApplyCount");
//
//                // Debugging statements
//                System.out.println("Title: " + title + ", Location: " + location + ", Salary: " + salary + ", ApplyCount: " + applyCount);
//
//                Job job = new Job(title, location, salary);
//                accountPurchaseCountMap.put(job, applyCount);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return accountPurchaseCountMap;
//    }

    //blog
    public int getNumberBlogStatus(String statusString) {
        String query = "SELECT count(*) FROM Blogs b\n"
                + "where b.[Status] =  ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, statusString);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

//    public List<Blog> pagingBlogByStatus(int index, String statusString) {
//        List<Blog> list = new ArrayList<>();
//        String sql = " select * from Blogs b\n"
//                + " where b.Status =  ? \n"
//                + "order by b.BlogID \n"
//                + "OFFSET ? rows fetch next 4 rows only";
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(sql);
//            ps.setString(1, statusString);
//            ps.setInt(2, (index - 1) * 4);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new Blog(
//                        rs.getInt(1),
//                        rs.getInt(2),
//                        rs.getString(3),
//                        rs.getString(4),
//                        rs.getDate(5),
//                        rs.getString(6),
//                        rs.getString(7)));
//            }
//        } catch (Exception ex) {
//
//        }
//        return list;
//    }
    public static void main(String[] args) {
        AdminDAO dao = new AdminDAO();

//        List<Blog> a = dao.pagingBlogByStatus(1, "Pending");
//        for (Blog blog : a) {
//            System.out.println(blog);
//        }
//        dao.lockAccount("2");
//        Company b = dao.companyByJobId(1);
//        System.out.println(b);
//        List<Job> a = dao.getJobByStatus("Pending");
        Map<Job, Integer> e = dao.getTopJobWithApplyCount("year");
        for (Map.Entry<Job, Integer> entry : e.entrySet()) {
            Job job = entry.getKey();
            Integer applyCount = entry.getValue();

            System.out.println("Title: " + job.getTitle() + " - Purchase Count: " + applyCount);
        }
//        
//        List<Statistic> s = dao.getJobByMonth();
//        for (Statistic users : s) {
//            System.out.println(users);
//        }
    }

}
